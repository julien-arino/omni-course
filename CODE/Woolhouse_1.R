library(deSolve)
library(latex2exp)

# Load useful_functions.R, which contains the crop function
source("useful_functions.R")

# R0
R0_Woolhouse_ODE = function(params) {
  with(as.list(params), {
    R0 = alpha*N*beta*H/(gamma*mu_2)
    return(R0)
  })
}

# EEP
EEP_Woolhouse_ODE = function(params) {
  with(as.list(params), {
   OUT = list()
   OUT$I_H = alpha*N/gamma-mu_2/(beta*H)
   OUT$i_S = 1-1/R0_Woolhouse_ODE(params)
   return(OUT)
  })
}

# Right hand side of the ODE
rhs_Woolhouse1_ODE = function(t, x, params) {
  with(as.list(c(x, params)), {
    dI_H = alpha*N*i_S-gamma*I_H
    di_S = beta*H*I_H*(1-i_S)-mu_2*i_S
    list(c(dI_H, di_S))
  })
}

# Put parameters in a list
params = list()
params$H = 100        # Total human population
params$N = 1000       # Total population snails
params$alpha = 20     # Nb schistosomes/infected H/unit time
params$gamma = 1/1000 # Life expectancy schistosome
params$mu_2 = 1/70    # Life expectancy infected snail
# Set beta through R_0:
# R_0= alpha*N*beta*H/(gamma*mu_2),
# so, given R_0, 
# beta = R_0*gamma*mu_2/(alpha*N*H)
params$R_0 = 2.5     # Desired value of R_0
params$beta = params$R_0*params$gamma*params$mu_2 / 
  (params$alpha*params$N*params$H)
# Final time
params$t_f = 1000

# Initial conditions. It is useful to have named variables here (S=.., I=..),
# so that the ODE algorithm knows what variables are passed to it (otherwise, 
# the RHS would need S=x[1], etc.)
IC <- c(I_H = 1, i_S = 0.01)

# Set time span. Can be either end points or specified time points. We do the latter
# (when fitting, which we are not doing here, this is useful)
tspan = seq(from = 0, to = params$t_f, by = 0.1)

sol_ODE = ode(y = IC,
              func = rhs_Woolhouse1_ODE,
              times = tspan,
              parms = params)


# Are we plotting for a dark background
plot_blackBG = TRUE
# Plot (and save) the result
png("../FIGS/Woolhouse_schisto_1.png", width = 1000, height = 600)
if (plot_blackBG) {
  par(bg = 'black', fg = 'white') # set background to black, foreground white
  colour = "white"
} else {
  colour = "black"
}

y_max = max(sol_ODE[,"I_H"])
i_S_scale = max(sol_ODE[,"i_S"])*100

plot(sol_ODE[,"time"], sol_ODE[,"I_H"],
     type = "l", lwd = 2,
     xlab = "Time (days)", ylab = "Value",
     ylim = c(0, y_max),
     col.axis = colour, cex.axis = 2,
     col.lab = colour, cex.lab = 2)
lines(sol_ODE[,"time"], sol_ODE[,"i_S"], 
      lwd = 2, lty = 3)
legend("topleft", legend = c("I_H", "i_S"),
       lwd = c(2,2), lty = c(1,3), inset = 0.01)
dev.off()
#crop_figure("../FIGS/Woolhouse_schisto_1.png")