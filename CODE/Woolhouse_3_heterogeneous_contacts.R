library(deSolve)
library(latex2exp)

# Load useful_functions.R, which contains the crop function
source("useful_functions.R")

# Right hand side of the ODE
rhs_Woolhouse1_ODE = function(t, x, params) {
  with(as.list(params), {
    I_H = x[idx_I_H]
    i_S = x[idx_i_S]
    incid_I = I_H %*% K
    incid_i = K %*% i_S
    dI_H = alpha*N*i_S-gamma*I_H
    di_S = beta*H*I_H*(1-i_S)-mu_2*i_S
    list(c(dI_H, di_S))
  })
}

# Put parameters in a list
params = list()
params$H = 100        # Total human population
params$L = 5          # Number of sites
params$idx_I_H = 1:params$H
params$idx_i_S = (params$H+1):(params$H+params$L)
# The contact matrix... completely random for now
params$K = matrix(data = runif(params$H*params$L),
                  nr = params$H, nc = params$L)

params$N = rep(1000, params$L)       # Total population snails per site
params$alpha = rep(20, params$L)     # Nb schistosomes/infected H/unit time
params$gamma = 1/1000 # Life expectancy schistosome
params$mu_2 = 1/70    # Life expectancy infected snail
# Final time
params$t_f = 1000

params

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