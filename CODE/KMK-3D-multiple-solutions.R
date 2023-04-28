library(deSolve)
library(plotly)
library(viridis)

rhs_SIR_KMK <- function(t, x, p) {
  with(as.list(c(x, p)), {
    dS = - beta * S * I
    dI = beta * S * I - gamma * I
    dR = gamma * I
    return(list(c(dS, dI, dR)))
  })
}

# Condition initiale pour S (pour calculer R_0)
N0 = 1000
gamma = 1/14
# On règle beta pour que R_0 = 1.5
beta = 1.5 * gamma / N0 
params = list(gamma = gamma, beta = beta)
times = seq(0, 365, 1)

# Prepare colour palette
colour_palette = viridis(length(times))

i = 1
sol = list()
for (I0 in seq(5, 500, by = 5)) {
  IC = c(S = N0-I0, I = I0, R = 0)
  sol[[i]] <- as.data.frame(ode(IC, times, rhs_SIR_KMK, params))
  sol[[i]]$colour = colour_palette[round(sol[[i]]$time)+1]
  i = i+1
}

# Line where we expect solutions in the SR-plane
SR_line = data.frame(S = 0:N0,
                     I = rep(0, length(0:N0)),
                     R = seq(N0, 0, by = -1))
# Plane (triangle from intersection with positive cone) where
# solutions live
S_tmp <- seq(from = 0, to = N0, by=5)
I_tmp <- seq(from = 0, to = N0, by=5)
plane = expand.grid(S = S_tmp,I = I_tmp)
plane$R <- N0-plane$S-plane$I
plane = plane[which(plane$R>0),]

fig <- plot_ly(data = plane,
               x = ~S, y = ~I, z = ~R,
               type = "mesh3d")
fig <- fig %>% 
  add_lines(data = SR_line,
            x = ~S, y = ~I, z = ~R,
            mode = 'lines',
            line = list(width = 6, 
                        color = "red", 
                        reverscale = FALSE))
for (i in 1:length(sol)) {
  fig <- fig %>% add_lines(data = sol[[i]], 
                           x = ~S, y = ~I, z = ~R,
                           mode = 'lines',
                           line = list(width = 6, 
                                       color = ~colour, 
                                       reverscale = FALSE))
}
fig = fig %>%
  add_lines(data = SR_line,
            x = ~S, y = ~I, z = ~R,
            mode = 'lines',
            line = list(width = 6, 
                        color = "red", 
                        reverscale = FALSE))
# fig = fig %>%
#   add_surface(data = plane,
#               x = ~S, y = ~I, z = ~R,
#               type = "mesh3d")
fig = fig %>% 
  layout(showlegend = FALSE,
         scene = list(
           annotations = list(
             showarrow = TRUE,
             x = 500,
             y = 0,
             z = 500,
             text = "S+R=N",
             xanchor = "left",
             xshift = 10,
             opacity = 0.7
           )))

fig
