---
marp: true
title: Simulation of epidemiological models
description: Julien Arino - OMNI/RÉUNIS & MfPH course on One Health Modelling for Emerging Infectious Diseases - Introduction - Lecture 3 - Simulation of epidemiological models
theme: default
class: invert
math: mathjax
paginate: false
size: 4K
---

<style>
  .theorem {
    text-align:justify;
    background-color:#16a085;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;  margin-bottom: 10px;
  }
  .definition {
    text-align:justify;
    background-color:#ededde;
    border-radius:20px;
    padding:10px 20px 10px 20px;
    box-shadow: 0px 1px 5px #999;
    margin-bottom: 10px;
  }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
</style>

<!-- backgroundColor: black -->

<!-- _backgroundImage: "linear-gradient(to top, #85110d, 1%, black)" -->
# Simulation of epidemiological models

11-14 October 2022 

Julien Arino ([julien.arino@umanitoba.ca](mailto:Julien.Arino@umanitoba.ca)) [![width:32px](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/GitHub-Mark-Light-64px.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:24px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

---

<!-- _backgroundImage: "radial-gradient(red,30%,black)" -->
# Outline

- Foreword: the R language
- Programming in R
- Dealing with data
- Solving ODE numerically
- Simulating continuous-time Markov chains

---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->Foreword: the R language

## (and other solutions for scientific computing)

---

# R was originally for stats but is now much more

- Open source version of S
- Appeared in 1993
- Now version 4.2
- One major advantage in my view: uses a lot of C and Fortran code. E.g., `deSolve`:
> The functions provide an interface to the FORTRAN functions 'lsoda', 'lsodar', 'lsode', 'lsodes' of the 'ODEPACK' collection, to the FORTRAN functions 'dvode', 'zvode' and 'daspk' and a C-implementation of solvers of the 'Runge-Kutta' family with fixed or variable time steps
- Very active community on the web, easy to find solutions (same true of Python, I just prefer R)

---

# Development environments

- Terminal version, not very friendly
- Nicer terminal: [radian](https://github.com/randy3k/radian)
- Execute R scripts by using `Rscript name_of_script.R`. Useful to run code in `cron`, for instance
- Use IDEs:
    - [RStudio](https://www.rstudio.com/products/rstudio/) has become the reference
    - [RKWard](https://invent.kde.org/education/rkward) is useful if you are for instance using an ARM processor (Raspberry Pi, some Chromebooks..)
- Integrate into jupyter notebooks

---

# Going further

- [RStudio server](https://www.rstudio.com/products/rstudio/#rstudio-server): run RStudio on a Linux server and connect via a web interface
- Shiny: easily create an interactive web site running R code
- [Shiny server](https://www.rstudio.com/products/shiny/shiny-server/): run Shiny apps on a Linux server
- Rmarkdown: markdown that incorporates R commands. Useful for generating reports in html or pdf, can make slides as well..
- RSweave: LaTeX incorporating R commands. Useful for generating reports. Not used as much as Rmarkdown these days

---

# R is a scripted language

- Interactive
- Allows you to work in real time
    - Be careful: what is in memory might involve steps not written down in a script
    - If you want to reproduce your steps, it is good to write all the steps down in a script and to test from time to time running using `Rscript`: this will ensure that all that is required to run is indeed loaded to memory when it needs to, i.e., that it is not already there..

---

# There is also Python

- Python is also scripted
- I am not a fan: indentation-delimited code blocks is a super bad idea IMBO (I don't know any good programmer who do not indent their code) and I do not enjoy the mix of OO and functional approaches
- That does not mean it is not a good solution, though
- Python, even more than R, benefits from a massive user pool, so finding help on the web is usually simple

---

# Jupyter notebooks (and [syzygy.ca](https://syzygy.ca))

An alternative to using RStudio to develop in `R` or whatever `Python` IDE you like is to use [Jupyter](https://jupyter.org/) `notebooks`, `labs` or `voilà`. Jupter also runs Julia

If you are affiliated with the following Canadian institutions: 
> Athabasca, BCIT, Brock, ETS Montréal, McGill, McMaster, Queens, SFU, UAlberta, UBC, UCalgary, ULethbridge, UManitoba, UNB, UNBC, UOttawa, UQAM, URegina, USask, USherbrooke, UToronto, UVic, UWaterloo, York

you can use Jupyter notebooks from [syzygy.ca](https://syzygy.ca), it is free. Note that space and computing power is limited on [syzygy.ca](https://syzygy.ca), but to test run simple `R`, `Python` or `Julia` code, this is a very good platform

---

# There are other solutions

- [Julia](https://julialang.org/)
- [Octave](https://octave.org/) (MatLab's GPL cousin)
- [SciLab](https://www.scilab.org/)
- [Maxima](https://maxima.sourceforge.io/) (more for symbolic computations)
- [SageMath](https://www.sagemath.org/) (tries to bridge most of the former)

And of course all the paying stuff (MatLab, Maple, Mathematica), which I do not use as a matter of principle

---

# The "[Stack Overflow](https://stackoverflow.com/) test"

When choosing a language (if you get to choose), perform the [Stack Overflow](https://stackoverflow.com/) test: search for the language within square brackets, e.g., [python], [r], etc. 

As of 2022-10-08,
- [python]: 2,034,840 questions
- [r]: 465,987 questions
- [julia]: 11,041 questions
- [octave]: 5,140 questions ([matlab]: 93,540 questions)
- [sage]: 872 questions

Unless you have a resident expert available, this is good to bear in mind!

---

<!-- _backgroundImage: "linear-gradient(to bottom, red,black)" -->
# <!--fit-->Programming in R

---

# Similar to matlab..

.. with some differences, of course! Otherwise, where would the fun be? ;)

---

# Assignment

Two ways:

```R
X <- 10
```

or

```R
X = 10
```

First version is preferred by R purists.. I don't really care

---

# Lists

A very useful data structure, quite flexible and versatile. Empty list: `L <- list()`. Convenient for things like parameters. For instance

```R
L <- list()
L$a <- 10
L$b <- 3
L[["another_name"]] <- "Plouf plouf"
```

```R
> L[1]
$a
[1] 10
> L[[2]]
[1] 3
> L$a
[1] 10
> L[["b"]]
[1] 3
> L$another_name
[1] "Plouf plouf"
```

---

# Vectors

```R
x = 1:10
y <- c(x, 12)
> y
 [1]  1  2  3  4  5  6  7  8  9 10 12
z = c("red", "blue")
> z
[1] "red"  "blue"
z = c(z, 1)
> z
[1] "red"  "blue" "1"
```
Note that in `z`, since the first two entries are characters, the added entry is also a character. Contrary to lists, vectors have all entries of the same type

---

# Matrices

Matrix (or vector) of zeros
```R
A <- mat.or.vec(nr = 2, nc = 3)
```

Matrix with prescribed entries

```R
B <- matrix(c(1,2,3,4), nr = 2, nc = 2)
> B
     [,1] [,2]
[1,]    1    3
[2,]    2    4
C <- matrix(c(1,2,3,4), nr = 2, nc = 2, byrow = TRUE)
> C
     [,1] [,2]
[1,]    1    2
[2,]    3    4
```

Remark that here and elsewhere, naming the arguments (e.g., `nr = 2`) allows to use arguments in any order

---

# Matrix operations

Probably the biggest annoyance in R compared to other languages

- The notation `A*B` is the *Hadamard product* $A\circ B$ (what would be denoted `A.*B` in matlab), not the standard matrix multiplication
- Matrix multiplication is written `A %*% B`

---

# Vector operations

Vector addition is also frustrating. Say you write `x=1:10`, i.e., make the vector
```R
> x
 [1]  1  2  3  4  5  6  7  8  9 10
```
Then `x+1` gives
```R
> x+1
 [1]  2  3  4  5  6  7  8  9 10 11
 ```
 i.e., adds 1 to all entries in the vector

 Beware of this in particular when addressing sets of indices in lists, vectors or matrices

---

# For the matlab-ers here

- R does not have the keyword `end` to access the last entry in a matrix/vector/list..
- Use `length` (lists or vectors), `nchar` (character chains), `dim` (matrices.. careful, of course returns 2 values)

---

# Flow control

```R
if (condition is true) {
  list of stuff to do
}
```

Even if `list of stuff to do` is a single instruction, best to use curly braces

```R
if (condition is true) {
  list of stuff to do
} else if (another condition) {
  ...
} else {
  ...
}
```

---

# For loops

`for` applies to lists or vectors

```R
for (i in 1:10) {
  something using integer i
}
for (j in c(1,3,4)) {
  something using integer j
}
for (n in c("truc", "muche", "chose")) {
  something using string n
}
for (m in list("truc", "muche", "chose", 1, 2)) {
  something using string n or integer n, depending
}
```

---

# lapply

Very useful function (a few others in the same spirit: `sapply`, `vapply`, `mapply`)

Applies a function to each entry in a list/vector/matrix

Because there is a parallel version (`parLapply`) that we will see later, worth learning

```R
l = list()
for (i in 1:10) {
        l[[i]] = runif(i)
}
lapply(X = l, FUN = mean)
```

or, to make a vector

```R
unlist(lapply(X = l, FUN = mean))
```

or

```R
sapply(X = l, FUN = mean)
```

---

# "Advanced" lapply

Can "pick up" nontrivial list entries

```R
l = list()
for (i in 1:10) {
        l[[i]] = list()
        l[[i]]$a = runif(i)
        l[[i]]$b = runif(2*i)
}
sapply(X = l, FUN = function(x) length(x$b))
```

gives

```R
[1]  2  4  6  8 10 12 14 16 18 20
```

Just recall: the argument to the function you define is a list entry (`l[[1]]`, `l[[2]]`, etc., here)

---

# Avoid parameter variation loops with expand.grid

```R
# Suppose we want to vary 3 parameters
variations = list(
    p1 = seq(1, 10, length.out = 10),
    p2 = seq(0, 1, length.out = 10),
    p3 = seq(-1, 1, length.out = 10)
)

# Create the list
tmp = expand.grid(variations)
PARAMS = list()
for (i in 1:dim(tmp)[1]) {
    PARAMS[[i]] = list()
    for (k in 1:length(variations)) {
        PARAMS[[i]][[names(variations)[k]]] = tmp[i, k]     
    }
}
```

There is still a loop, but you can split this list, use it on different machines, etc. And can use `parLapply` (more on that later)

---

<!-- _backgroundImage: "linear-gradient(to bottom, red,black)" -->
# <!--fit-->Dealing with data

- Example: population of Canada
- Data wrangling


<div style = "position: relative; bottom: -25%; font-size:20px;">

- JA. [Mathematical epidemiology in a data-rich world](http://dx.doi.org/10.1016/j.idm.2019.12.008). *Infectious Disease Modelling* **5**:161-188 (2020)
- See also [GitHub repo](https://github.com/julien-arino/modelling-with-data) for that paper

</div>

---

# It is important to be "data aware"

- Using R (or Python), it is really easy to grab data from the web, e.g., from Open Data sources
- More and more locations have an open data policy
- As a modeller, you do not need to have data everywhere, but you should be aware of the context
- If you want your work to have an impact, for instance in public health, you cannot be completely disconnected from reality

---

# Data is everywhere 

## Closed data

- Often generated by companies, governments or research labs
- When available, come with multiple restrictions

## Open data

- Often generated by the same entities but "liberated" after a certain period
- More and more frequent with governments/public entities
- Wide variety of licenses, so beware
- Wide variety of qualities, so beware

---

# Open Data initiatives

Recent movement (5-10 years): governments (local or higher) create portals where data are centralised and published

- [Winnipeg](https://data.winnipeg.ca/)
- [Alberta](https://open.alberta.ca/opendata), [B.C.](https://catalogue.data.gov.bc.ca/), [Ontario](https://data.ontario.ca/)
- [Canada](https://open.canada.ca/en/open-data)
- [Europe](https://data.europa.eu/euodp/data/)
- [UN](http://data.un.org/)
- [World Bank](https://data.worldbank.org/)
- [WHO](https://www.who.int/gho/database/en/)

---

# Data gathering methods

- By hand
- Using programs such as [Engauge Digitizer](http://markummitchell.github.io/engauge-digitizer/) or [g3data](https://github.com/pn2200/g3data)
- Using APIs
- Using natural language processing and other web scraping methods
- Using R or Python packages

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, black)" -->
# Example: population of Canada

---

```R
library(wbstats)
source("useful_functions.R")
pop_data_CTRY <- wb_data(country = "CAN", indicator = "SP.POP.TOTL",
                         mrv = 100, return_wide = FALSE)
y_range = range(pop_data_CTRY$value)
y_axis <- make_y_axis(y_range)
png(file = "pop_CAN.png", 
    width = 800, height = 400)
plot(pop_data_CTRY$date, pop_data_CTRY$value * y_axis$factor,
     xlab = "Year", ylab = "Population", type = "b", lwd = 2,
     yaxt = "n")
axis(2, at = y_axis$ticks, labels = y_axis$labels, las = 1)
dev.off()
crop_figure("pop_CAN.png")
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/pop_CAN.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26, black)" -->
# Data wrangling

---

# Data wrangling: `dplyr` vs `sqldf`

`dplyr` is part of the `tidyverse` set of libraries. Load `magrittr` and its pipe `%>%`

`sqldf` allows to use SQL on dataframes.. interesting alternative if you know SQL

---

```R
library(sqldf)
library(dplyr)

SARS = read.csv("../DATA/SARS-CoV-1_data.csv")

## Three ways to keep only the data for one country
ctry = "Canada"
# The basic one
idx = which(SARS$country == ctry)
SARS_selected = SARS[idx,]
# The sqldf way
SARS_selected = sqldf(paste0("SELECT * FROM SARS WHERE country = '", 
                             ctry, "'"))
# The dplyr way
SARS_selected = SARS %>%
  filter(country == ctry)
```

---

```R
# Create incidence for the selected country. diff does difference one by one,
# so one less entry than the vector on which it is being used, thus we pad with a 0.
SARS_selected$incidence = c(0, diff(SARS_selected$totalNumberCases))
# Keep only positive incidences (discard 0 or negative adjustments)
SARS_selected = SARS_selected %>%
  filter(incidence > 0)

# Plot the result
# Before plotting, we need to make the dates column we will use be actual dates..
SARS_selected$toDate = lubridate::ymd(SARS_selected$toDate)
EpiCurve(SARS_selected,
         date = "toDate", period = "day",
         freq = "incidence",
         title = "SARS-CoV-1 incidence in Canada in 2003")
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/SARS-CoV-1_cases_CAN.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, red,black)" -->
# <!--fit-->Solving ODE numerically

- The deSolve library
- Example - Fitting data

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26,black)" -->
# The deSolve library

---

# The deSolve library

- As I have already pointed out, [`deSolve`](https://cran.r-project.org/web/packages/deSolve/index.html):
> The functions provide an interface to the FORTRAN functions 'lsoda', 'lsodar', 'lsode', 'lsodes' of the 'ODEPACK' collection, to the FORTRAN functions 'dvode', 'zvode' and 'daspk' and a C-implementation of solvers of the 'Runge-Kutta' family with fixed or variable time steps

- So you are benefiting from years and year of experience: [ODEPACK](https://computing.llnl.gov/projects/odepack) is a set of Fortran (77!) solvers developed at Lawrence Livermore National Laboratory (LLNL) starting in the late 70s

- Other good solvers are also included, those written in C

- Refer to the [package help](https://cran.r-project.org/web/packages/deSolve/deSolve.pdf) for details

---

# Using deSolve for simple ODEs

As with more numerical solvers, you need to write a function returning the value of the right hand side of your equation (the vector field) at a given point in phase space, then call this function from the solver

```R
library(deSolve)
rhs_logistic <- function(t, x, p) {
  with(as.list(x), {
    dN <- p$r * N *(1-N/p$K)
    return(list(dN))
  })
}
params = list(r = 0.1, K = 100)
IC = c(N = 50)
times = seq(0, 100, 1)
sol <- ode(IC, times, rhs_logistic, params)
```

---

This also works: add `p` to arguments of `as.list` and thus use without `p$` prefix

```R
library(deSolve)
rhs_logistic <- function(t, x, p) {
  with(as.list(c(x, p)), {
    dN <- r * N *(1-N/K)
    return(list(dN))
  })
}
params = list(r = 0.1, K = 100)
IC = c(N = 50)
times = seq(0, 100, 1)
sol <- ode(IC, times, rhs_logistic, params)
```

In this case, beware of not having a variable and a parameter with the same name..

---

# Default method: `lsoda`

- `lsoda` switches automatically between stiff and nonstiff methods

- You can also specify other methods: "lsode", "lsodes", "lsodar", "vode", "daspk", "euler", "rk4", "ode23", "ode45", "radau", "bdf", "bdf_d", "adams", "impAdams" or "impAdams_d" ,"iteration" (the latter for discrete-time systems)

```R
ode(y, times, func, parms, method = "ode45")
```

- You can even implement your own integration method

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26,black)" -->
# Example - Fitting data

---

# Example - Fitting data

- Note that this is a super simplified version of what to do
- Much more elaborate procedures exist
  - Roda. [Bayesian inference for dynamical systems](https://doi.org/10.1016/j.idm.2019.12.007)
  - Portet. [A primer on model selection using the Akaike Information Criterion](https://doi.org/10.1016/j.idm.2019.12.010)
- Let us grab some epi data online and fit an SIR model to it
- Don't expect anything funky, as I said, this is the baby version
- Also, keep in mind that any identification procedure is subject to risks due to *identifiability issues*; see, e.g., Roda et al, [Why is it difficult to accurately predict the COVID-19 epidemic?](https://doi.org/10.1016/j.idm.2020.03.001)

---

# Principle

- Data is a set $(t_i,y_i)$, $i=1,\ldots,N$, where $t_i\in\mathcal{I}$, some interval
- Solution to SIR is $(t,x(t))$ for $t\in\mathcal{I}$
- Suppose parameters of the model are $p$
- We want to minimise the error function
$$
E(p) = \sum_{i=1}^N \|x(t_i)-y_i\|
$$
- Norm is typically Euclidean, but could be different depending on objectives
- So given a point $p$ in (admissible) parameter space, we compute the solution to the ODE, compute $E(p)$
- Using some minimisation algorithm, we seek a minimum of $E(p)$ by varying $p$

---

# What are $y_i$ and $x(t_i)$ here?

- In epi data for infectious diseases, we typically have incidence, i.e., number of new cases per unit time
- In SIR model, this is $\beta SI$ or $\beta SI/N$, so, if using mass action incidence and Euclidean norm
$$
E(p)=\sum_{i=1}^N(\beta S(t_i)I(t_i)-y_i)^2
$$
or, if using standard incidence
$$
E(p)=\sum_{i=1}^N
\left(\beta \frac{S(t_i)I(t_i)}{N}-y_i\right)^2
$$

---

# Implementing in practice

See the code [SIR_KMK_fitting.R](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/CODE/SIR_KMK_fitting.R), which we will go over now

---

<!-- _backgroundImage: "linear-gradient(to bottom, red,black)" -->
# <!-- fit -->Simulating continuous-time Markov chains

## (a.k.a. making your ODE wriggly)

- Why stochasticity matters
- Continuous time Markov chains
- ODE $\rightleftharpoons$ CTMC
- Simulating CTMC (in theory)
- Simulating CTMC (in practice)
- Parallelising your code in `R`

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26,black)" -->
# <!-- fit -->Why stochasticity matters

---

# Why stochastic systems?

- Life results from the interaction of countless processes

- Each process happens with some degree of imprecision. E.g., when a virus replicates, it misses a base here and there; when a cell undergoes mitosis, material is not split 50-50; when you meet another human, you *forget* to shake their hand. Etc.

- Because of repetition, this gives rise to uncertainty

- Stochastic systems incorporate uncertainty

---

![bg left:40% height:600px](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/SIS_base_MA_incidence_noDemog_vertical_blackBG.png)
# Running example 
## SIS model without demography

- Constant total population $P^\star$

- Basic reproduction number
$$\mathcal{R}_0 = \dfrac{\beta}{\gamma}P^\star$$

---

# In the deterministic world, $\mathcal{R}_0$ rules the world

- If $\mathcal{R}_0=\beta P^\star/\gamma<1$, the disease dies out (*disease-free* equilibrium)
- If $\mathcal{R}_0>1$, it becomes established at an *endemic* equilibrium $I^\star=P^\star-\gamma/\beta=(1-1/\mathcal{R}_0)P^\star$

Next slides: $P^\star = 100$, $\gamma=1/5$, $\mathcal{R}_0=\{0.8,1.5,2.5\}$ (and $\beta=\gamma \mathcal{R}_0/P^\star$), $I_0=1$

---

![bg contain](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/ODE_SIS.png)

---

# <!--fit-->In stochastic world, make that ''$\mathcal{R}_0$ rules-*ish*'' ($\mathcal{R}_0=1.5$)

![height:600px center](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/several_CTMC_sims.png)

---

# Extinctions happen quite frequently

In following slide, we 
- vary $I_0$ in $\{1,2,3,5,10\}$
- vary $\mathcal{R}_0$ from 0.5 to 3 by steps of 0.05
- run 500 simulation for each value pair
- record the percentage of realisations that see extinctions in the time period under consideration ([0,100] days)

---

# When $I_0=1$, extinctions happen quite frequently

![height:600px](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/extinctions_fct_R0.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26,black)" -->
# <!--fit-->Continuous time Markov chains

---

# In this lecture

- I will only show one very specific aspect of stochastic systems: continuous-time Markov chains (CTMC), which are essentially the stochastic equivalent of ODE
- There are plenty of resources on stochastic systems in math epi. For instance, see [here](https://julien-arino.github.io/3MC-course-epidemiological-modelling/) some slides and videos I made for a course (the Wednesday April 6 2022 lectures are the ones on stochastic systems)

---

# Continuous time Markov chains (CTMC)

- Almost exact stochastic equivalent to ODE
- Conversion from ODE to CTMC and vice-versa is very easy for compartmental models (see later)
- Harder to study than discrete-time Markov chains (DTMC) but still quite amenable to analysis

---

# Continuous-time Markov chains

CTMC similar to DTMC except in way they handle time between events (transitions)

DTMC: transitions occur each $\Delta t$

CTMC: $\Delta t\to 0$ and transition times follow an exponential distribution parametrised by the state of the system

CTMC are roughly equivalent to ODE

---

# Several ways to formulate CTMC's

A continuous time Markov chain can be formulated in terms of
- infinitesimal transition probabilities
- branching process
- time to next event

Here, time is in $\mathbb{R}_+$

---
# Example of a simple birth-death process

For small $\Delta t$,
$$
\begin{align*}
p_{ji}(\Delta t) &= \mathbb{P}\left\{I(t+\Delta)=j|I(t)=i\right\} \\
&=
\begin{cases}
B(i)\Delta t+o(\Delta t) & j=i+1 \\
D(i)\Delta t+o(\Delta t) & j=i-1 \\
1-[B(i)+D(i)]\Delta t+o(\Delta t) & j=i \\
o(\Delta t) & \textrm{otherwise}
\end{cases}
\end{align*}
$$
with $o(\Delta t)\to 0$ as $\Delta t\to 0$

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26,black)" -->
# <!-- fit -->ODE $\rightleftharpoons$ CTMC

---

# <!--fit-->Converting your compartmental ODE model to CTMC

Easy as $\pi$ :)

- Compartmental ODE model focuses on flows into and out of compartments
  - ODE model has as many equations as there are compartments
- Compartmental CTMC model focuses on transitions
  - CTMC model has as many transitions as there are arrows between (or into or out of) compartments

---

# ODE to CTMC : focus on different components

![width:600px](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/SIS_no_demography_flows_ODE_blackBG.png)  ![width:400px](https://raw.githubusercontent.com/julien-arino/presentations/main/FIGS/flow-diagrams/figure_SIS_no_demography_CTMC.png)

---

# SIS without demography

| Transition | Effect | Weight | Probability |
| --- | --- | --- | --- |
| $S\to S-1$, $I\to I+1$ | new infection | $\beta SI$ | $\dfrac{\beta SI}{\beta SI+\gamma I}$ |
| $S\to S+1$, $I\to I-1$ | recovery of an infectious | $\gamma I$ | $\dfrac{\gamma I}{\beta SI+\gamma I}$ |

States are $S,I$

---

# SIS with demography

| Transition | Effect | Weight | Probability |
| --- | --- | --- | --- |
| $S\to S+1$ | birth of a susceptible | $b$ | $\frac{b}{b+d(S+I)+\beta SI+\gamma I}$ |
| $S\to S-1$ | death of a susceptible | $dS$ | $\frac{dS}{b+d(S+I)+\beta SI+\gamma I}$ |
| $S\to S-1$, $I\to I+1$ | new infection | $\beta SI$ | $\frac{\beta SI}{b+d(S+I)+\beta SI+\gamma I}$ |
| $I\to I-1$ | death of an infectious | $dI$ | $\frac{dI}{b+d(S+I)+\beta SI+\gamma I}$ |
| $S\to S+1$, $I\to I-1$ | recovery of an infectious | $\gamma I$ | $\frac{\gamma I}{b+d(S+I)+\beta SI+\gamma I}$ |

States are $S,I$

---

# Kermack & McKendrick model

| Transition | Effect | Weight | Probability |
| --- | --- | --- | --- |
| $S\to S-1$, $I\to I+1$ | new infection | $\beta SI$ | $\dfrac{\beta SI}{\beta SI+\gamma I}$ |
| $I\to I-1$, $R\to R+1$ | recovery of an infectious | $\gamma I$ | $\dfrac{\gamma I}{\beta SI+\gamma I}$ |

States are $S,I,R$

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26,black)" -->
# <!-- fit -->Simulating CTMC (in theory)

---

# Gillespie's algorithm

- A.k.a. the stochastic simulation algorithm (SSA)
- Derived in 1976 by Daniel Gillespie
- Generates possible solutions for CTMC
- Extremely simple, so worth learning how to implement; there are however packages that you can use (see later)

---

# Gillespie's algorithm

Suppose system has state $\mathbf{x}(t)$ with initial condition $\mathbf{x}(t_0)=\mathbf{x}_0$ and *propensity functions* $a_i$ of elementary reactions

set $t\leftarrow t_0$ and $\mathbf{x}(t)\leftarrow \mathbf{x}_0$
while {$t\leq t_f$}
- $\xi_t\leftarrow \sum_j a_j(\mathbf{x}(t))$
- Draw $\tau_t$ from $T\thicksim \mathcal{E}(\xi_t)$
- Draw $\zeta_t$ from $\mathcal{U}([0,1])$
- Find $r$, smallest integer s.t. $\sum_{k=1}^j a_k(\mathbf{x}(t))> \zeta_t\sum_j a_j(\mathbf{x}(t))=\zeta_t\xi_t$
- Effect the next reaction (the one indexed $r$)
- $t\leftarrow t+\tau_t$

---

# <!--fit-->Drawing at random from an exponential distribution

If you do not have an exponential distribution random number generator.. We want $\tau_t$ from $T\thicksim\mathcal{E}(\xi_t)$, i.e., $T$ has probability density function
$$
f(x,\xi_t)=
\xi_te^{-\xi_t x}\mathbf{1}_{x\geq 0}
$$
Use cumulative distribution function $F(x,\xi_t)=\int_{-\infty}^x f(s,\xi_t)\,ds$
$$
F(x,\xi_t)=
(1-e^{-\xi_t x})\mathbf{1}_{x\geq 0}
$$
which has values in $[0,1]$. So draw $\zeta$ from $\mathcal{U}([0,1])$ and solve $F(x,\xi_t)=\zeta$ for $x$
$$
\begin{align*}
F(x,\xi_t)=\zeta & \Leftrightarrow 1-e^{-\xi_tx}=\zeta \\
&\Leftrightarrow e^{-\xi_tx} = 1-\zeta \\
&\Leftrightarrow \xi_tx = -\ln(1-\zeta) \\
&\Leftrightarrow \boxed{x = \frac{-\ln(1-\zeta)}{\xi_t}}
\end{align*}
$$

---

# Gillespie's algorithm (SIS model with only I eq.)

set $t\leftarrow t_0$ and $I(t)\leftarrow I(t_0)$
while {$t\leq t_f$}
- $\xi_t\leftarrow \beta (P^\star-i)i+\gamma i$
- Draw $\tau_t$ from $T\thicksim \mathcal{E}(\xi_t)$
- $v\leftarrow\left[\beta (P^\star-i)i,\xi_t\right]/\xi_t$
- Draw $\zeta_t$ from $\mathcal{U}([0,1])$
- Find $pos$ such that $v_{pos-1}\leq\zeta_t\leq v_{pos}$
- switch {$pos$}
  - 1: New infection, $I(t+\tau_t)=I(t)+1$
  - 2: End of infectious period, $I(t+\tau_t)=I(t)-1$
- $t\leftarrow t+\tau_t$

---

# Sometimes Gillespie goes bad

- Recall that the inter-event time is exponentially distributed
- Critical step of the Gillespie algorithm:
  -  $\xi_t\leftarrow$ weight of all possible events (*propensity*)
  - Draw $\tau_t$ from $T\thicksim \mathcal{E}(\xi_t)$
- So the inter-event time $\tau_t\to 0$ if $\xi_t$ becomes very large for some $t$
- This can cause the simulation to grind to a halt

---

# Example: a birth and death process

- Individuals born at *per capita* rate $b$
- Individuals die at *per capita* rate $d$
- Let's implement this using classic Gillespie

(See [`simulate_birth_death_CTMC.R`](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/CODE/simulate_birth_death_CTMC.R) on course GitHub repo)


---

# Gillespie's algorithm (birth-death model)

set $t\leftarrow t_0$ and $N(t)\leftarrow N(t_0)$
while {$t\leq t_f$}
- $\xi_t\leftarrow (b+d)N(t)$
- Draw $\tau_t$ from $T\thicksim \mathcal{E}(\xi_t)$
- $v\leftarrow\left[bN(t),\xi_t\right]/\xi_t$
- Draw $\zeta_t$ from $\mathcal{U}([0,1])$
- Find $pos$ such that $v_{pos-1}\leq\zeta_t\leq v_{pos}$
- switch {$pos$}
  - 1: Birth, $N(t+\tau_t)=N(t)+1$
  - 2: Death, $N(t+\tau_t)=N(t)-1$
- $t\leftarrow t+\tau_t$

---

```R
b = 0.01   # Birth rate
d = 0.01   # Death rate
t_0 = 0    # Initial time
N_0 = 100  # Initial population

# Vectors to store time and state. Initialise with initial condition.
t = t_0
N = N_0

t_f = 1000  # Final time

# We'll track the current time and state (could also just check last entry in t
# and N, but will take more operations)
t_curr = t_0
N_curr = N_0
```

---

```R
while (t_curr<=t_f) {
  xi_t = (b+d)*N_curr
  # The exponential number generator does not like a rate of 0 (when the 
  # population crashes), so we check if we need to quit
  if (N_curr == 0) {
    break
  }
  tau_t = rexp(1, rate = xi_t)
  t_curr = t_curr+tau_t
  v = c(b*N_curr, xi_t)/xi_t
  zeta_t = runif(n = 1)
  pos = findInterval(zeta_t, v)+1
  switch(pos,
         { 
           # Birth
           N_curr = N_curr+1
         },
         {
           # Death
           N_curr = N_curr-1
         })
  N = c(N, N_curr)
  t = c(t, t_curr)
}
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/CTMC_birth_death_sol_b=0_01_d=0_01.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/CTMC_birth_death_sol_b=0_01_d=0_02.png)

---

![bg contain](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/CTMC_birth_death_sol_b=0_03_d=0_01.png)

---

# Last one did not go well

- Wanted 1000 time units (days?)
- Interrupted at $t=344.4432$ because I lost patience
- (Penultimate slide: sim stopped because the population went extinct, I did not stop it!)
- At stop time
  - N = 103,646
  - $|N| = 208,217$ (and $|t|$ as well, of course!)
  - time was moving slowly
```R
> tail(diff(t))
[1] 1.282040e-05 5.386999e-04 5.468540e-04 1.779985e-04 6.737294e-05 2.618084e-04
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/CTMC_birth_death_ie_vs_t_b=0_03_d=0_01.png)

--- 

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26,black)" -->
# <!-- fit -->Simulating CTMC (in practice)

---

# Tau-leaping (and packages) to the rescue!

- *Approximation* method (compared to classic Gillespie, which is exact)
- Roughly: consider "groups" of events instead of individual events
- Good news: `GillespieSSA2` and `adaptivetau`, two standard packages for SSA in `R`, implement tau leaping

---

# Simulating a CTMC

```R
library(GillespieSSA2)
IC <- c(S = (Pop-I_0), I = I_0)
params <- c(gamma = gamma, beta = beta)
reactions <- list(
  reaction("beta*S*I", c(S=-1,I=+1), "new_infection"),
  reaction("gamma*I", c(S=+1,I=-1), "recovery")
)
set.seed(NULL)
sol <- ssa(
    initial_state = IC,
    reactions = reactions,
    params = params,
    method = ssa_exact(),
    final_time = t_f,
)
plot(sol$time, sol$state[,"I"], type = "l",
     xlab = "Time (days)", ylab = "Number infectious")
```

---

![bg contain](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/one_CTMC_sim.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, #156C26,black)" -->
# <!--fit-->Parallelising your code in `R`

---

# Parallelisation

To see multiple realisations: good idea to parallelise, then interpolate results. Write a function, e.g.,  `run_one_sim` that .. runs one simulation, then..

```R
nb_cores <- detectCores()
if (nb_cores > 124) {
  nb_cores = 124
}
cl <- makeCluster(nb_cores)
clusterEvalQ(cl,{
  library(GillespieSSA2)
})
clusterExport(cl,
              c("params",
                "run_one_sim"),
              envir = .GlobalEnv)
SIMS = parLapply(cl = cl, 
                 X = 1:params$number_sims, 
                 fun =  function(x) run_one_sim(params))
stopCluster(cl)
```

See [`SIS_CTMC_parallel.R`](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/CODE/SIS_CTMC_parallel.R) on course GitHub repo

---

![bg contain](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/many_CTMC_sims_with_means.png)

---

# Benefit of parallelisation

Run the parallel code for 50 sims between `tictoc::tic()` and `tictoc::toc()`, giving `4.785 sec elapsed`, then the sequential version
```R
tictoc::tic()
SIMS = lapply(X = 1:params$number_sims, 
              FUN =  function(x) run_one_sim(params))
tictoc::toc()
```
which gives `158.306 sec elapsed` on a 64C/128T AMD Ryzen Threadripper 3990X. That is, parallel ran 33.08$\times$ faster !)

