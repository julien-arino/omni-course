library(wbstats)
library(deSolve)
library(GA)
library(parallel)
library(doParallel)

# Load useful_functions.R, which contains the crop function
source("useful_functions.R")

# The RHS function for KMK
RHS_logistic <- function(t, x, p) {
  with(as.list(c(x,p)), {
    dN <- r*N*(1-N/K)
    return(list(dN))
  })
}

# Get the data for a country
get_pop_data <- function(CTRY) {
  pop = wb_data("SP.POP.TOTL", country = CTRY,
                mrv = 100, return_wide = FALSE)
  pop = pop[,c("date", "value")]
  pop = pop[order(pop$date),]
  pop$date = as.numeric(pop$date)
  pop$value = as.numeric(pop$value)
  return(pop)
}

# Compute the error based on one parameter value. Will also need a few more
# arguments
error_fit <- function(p_vary, 
                      params, 
                      data,
                      method = "rk4") {
  # Anything that changes during optimisation is set here
  params$r = as.numeric(p_vary["r"])
  params$K = as.numeric(p_vary["K"])
  # Set the initial condition
  N0 = data$value[1]
  IC = c(N = N0)
  # Compute the solution
  sol = ode(y = IC, times = data$date, func = RHS_logistic, 
            parms = params, method = method)
  # Error checking
  if (sol[dim(sol)[1],"time"] < data$date[dim(data)[1]]) {
    return(Inf)
  }
  # Compute the error
  diff_values = data$value - sol[,"N"]
  diff_values_squared = diff_values^2
  error = sum(diff_values_squared)
  return(error)
}

# Get the population. We take El Salvador, which seems to be levelling off
# in past years (to see if we get a value for K)
pop = get_pop_data("El Salvador")

params = list()
params$r = 1
params$K = max(pop$value)

## Fit using a genetic algorithm
GA = ga(
  type = "real-valued",
  fitness = function(x) 
    -error_fit(p_vary = c(r = x[1], K = x[2]),
               params = params,
               data = pop,
               method = "rk4"),
  parallel = TRUE,
  lower = c(0.1, 1000000),
  upper = c(10, 10000000),
  optim = TRUE,
  optimArgs = list(method = "CG"),
  suggestions = c(1, params$K),
  popSize = 500,
  maxiter = 200
)

params$r = GA@solution[1]
params$K = GA@solution[2]
N0 = pop$value[1]
IC = c(N = N0)
times = seq(pop$date[1], pop$date[length(pop$date)], 0.1)
sol <- ode(IC, times, RHS_logistic, params)

y_min = min(min(sol[,"N"]), min(pop$value))
y_max = max(max(sol[,"N"]), max(pop$value))
y_axis = make_y_axis(yrange = c(y_min, y_max))

# Are we plotting for a dark background
plot_blackBG = TRUE
# Plot (and save) the result
png("../FIGS/fit_logistic_1.png", width = 1000, height = 600)
if (plot_blackBG) {
  par(bg = 'black', fg = 'white') # set background to black, foreground white
  colour = "white"
} else {
  colour = "black"
}

plot(sol[,"time"], sol[,"N"]*y_axis$factor, type = "l",
     xlab = "Date", ylab = "Population",
     lwd = 3, col = "red",
     yaxt = "n", ylim = c(y_min,y_max)*y_axis$factor,
     col.axis = colour, cex.axis = 1.5,
     col.lab = colour, cex.lab = 1.5)
lines(pop$date, pop$value*y_axis$factor, type = "b", pch = 19)
legend("bottomright", legend = c("Data", "Fit"), 
       lty = c(-1, 1), col = c(colour, "red"),
       pch = c(19, -1), lwd = c(2, 3),
       inset = 0.01)
axis(2, at = y_axis$ticks, labels = y_axis$labels,
     col.axis = colour, las = 1)
dev.off()
