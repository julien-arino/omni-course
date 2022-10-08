---
marp: true
title: Basic concepts of mathematical epidemiology. Models in one population and their basic properties
description: Julien Arino - 3MC Course Epidemiological Modelling - Course 02 - Basic concepts of mathematical epidemiology. Models in one population and their basic properties
theme: default
class: invert
paginate: false
size: 4K
math: mathjax
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

<!-- _backgroundImage: "linear-gradient(to top, #85110d, 1%, black)" -->
# Basic concepts of math epi

11-14 October 2022 

Julien Arino [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/email-round.png)](mailto:Julien.Arino@umanitoba.ca) [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/world-wide-web.png)](https://julien-arino.github.io/) [![width:32px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/github-icon.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
Canadian COVID-19 Mathematical Modelling Task Force
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:24px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

<style>
img[alt~="center"] {
  display: block;
  margin: 0 auto;
}
</style>

---

<!-- _backgroundImage: "radial-gradient(red,30%,black)" -->
# Outline

- Compartmental models
- The (epidemic) Kermack and McKendrick SIR model
- Incidence functions
- The (endemic) SIS model
- Effect of vaccination - Herd immunity

---

<!-- _backgroundImage: "linear-gradient(to bottom, red,black)" -->
# <!--fit-->Compartmental models

---

<!-- _backgroundImage: "linear-gradient(to bottom, red,black)" -->
# <!--fit-->The (epidemic) Kermack and McKendrick SIR model

---

# This is a particular case!

Kermack & McKendrick formulated the model that follows in a much more general work

Really worth taking a look at this series of papers!
- [A contribution to the mathematical theory of epidemics](https://doi.org/10.1098/rspa.1927.0118) (1927)
- [Contributions to the mathematical theory of epidemics. II. The problem of endemicity](https://doi.org/10.1098/rspa.1932.0171) (1932)
- [Contributions to the mathematical theory of epidemics. III. Further studies of the problem of endemicity](https://doi.org/10.1098/rspa.1933.0106) (1933)
- [Contributions to the mathematical theory of epidemics IV. Analysis of experimental epidemics of the virus disease mouse ectromelia](https://doi.org/10.1017/S0022172400034902) (1937)
- [Contributions to the mathematical theory of epidemics. V. Analysis of experimental epidemics of mouse-typhoid; a bacterial disease conferring incomplete immunity](https://doi.org/10.1017/S0022172400011918) (1939)

---

# <!--fit-->The underlying question - What is the *size* of an epidemic?

- Suppose we consider the occurrence of an epidemic peak
  - Does it always take place?
  - When it occurs, how bad is it?
  - If an epidemic moves through a population, is everyone infected?

---

# The SIR model *without demography*

- The time interval under consideration is sufficiently small that demography can be omitted (we say there is *no vital dynamics*)
- Individuals in the population can be susceptible ($S$) or infected and infectious with the disease ($I$). Upon recovery or death, they are *removed* from the infectious compartment ($R$)
- Incidence is mass action $\beta SI$

![width:600px center](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/SIR_KMK_ODE_blackBG.png)


---

![bg left:25% height:600px](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/SIR_KMK_ODE_vertical_blackBG.png)

# <!--fit-->The Kermack-McKendrick SIR model
$$
\begin{align}
\frac{d}{dt}S(t) &= -\beta S(t)I(t) \tag{1a} \\
\frac{d}{dt}I(t) &= (\beta S(t)-\gamma)I(t)  \tag{1b} \\
\frac{d}{dt}R(t) &= \gamma I(t)  \tag{1c}
\end{align}
$$

Considered with initial conditions (IC) $S(0)=S_0$, $I(0)=I_0$ and $R(0)=R_0$ (often the latter is zero)

---

![bg left:25% height:600px](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/SIR_KMK_ODE_vertical_blackBG.png)

# <!--fit-->The Kermack-McKendrick SIR model
As often with ODE, write $dX(t)/dt=X'(t)$ and omit time-dependence of state variables:
$$
\begin{align}
S' &= -\beta SI \tag{1a}\label{sys:KMK_dS} \\
I' &= (\beta S-\gamma)I  \tag{1b}\label{sys:KMK_dI} \\
R' &= \gamma I  \tag{1c}\label{sys:KMK_dR}
\end{align}
$$

Considered with initial conditions (IC) $S(0)=S_0$, $I(0)=I_0$ and $R(0)=R_0$ (often the latter is zero)

---

# Reducing the problem

3 compartments, but inspection shows that *removed* individuals do not influence the dynamics of $S$ or $I$

Furthermore, total population $N=S+I+R$ satisfies
$$
N'=(S+I+R)'=0
$$
so $N$ is constant and dynamics of $R$ can deduced from that of $R=N-(S+I)$

So now consider
$$
\begin{align}
S' &= -\beta SI \tag{2a}\\
I' &= (\beta S-\gamma)I  \tag{2b}
\end{align}
$$

---

# Equilibria


Consider the equilibia of
$$
\begin{align}
S' &= -\beta SI \tag{2a}\label{sys:KMK_2d_dS} \\
I' &= (\beta S-\gamma)I  \tag{2b}\label{sys:KMK_2d_dI}
\end{align}
$$

From $\eqref{sys:KMK_2d_dI}$
- either $\bar S=\gamma/\beta$
- or $\bar I=0$

Substitute into $\eqref{sys:KMK_2d_dS}$
- in the first case, $(\bar S,\bar I)=(\gamma/\beta,0)$
- in the second case, any $\bar S\geq 0$ is an equilibrium (*continuum* of EP)

---

# Workaround - Study $dI/dS$

What is the dynamics of $dI/dS$? We have
$$
\tag{3}\label{eq:KMK_dI_over_dS}
\frac{dI}{dS}
=\frac{dI}{dt}\frac{dt}{dS}
=\frac{I'}{S'}
=\frac{\beta SI-\gamma I}{-\beta SI}
=\frac{\gamma}{\beta S}-1
$$
provided $S\neq 0$

**Careful!** Remember that $S$ and $I$ are $S(t)$ and $I(t)$.. equation $\eqref{eq:KMK_dI_over_dS}$ thus describes the relationship between $S$ and $I$ along solutions to the original ODE $\eqref{sys:KMK_2d_dS}$-$\eqref{sys:KMK_2d_dI}$

---

We can integrate equation $\eqref{eq:KMK_dI_over_dS}$, giving trajectories in phase space
$$
I(S)=\frac\gamma\beta \ln S-S+C
$$
with $C\in\mathbb{R}$

The initial condition $I(S_0)=I_0$ gives $C=S_0+I_0-\frac \gamma\beta \ln S_0$, and the solution to $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ is thus, as a function of $S$,
$$
\begin{align*}
I(S)&=S_0+I_0-S+\frac\gamma\beta \ln \frac S{S_0} \\
R(S)&=N-S-I(S)=R_0-\frac\gamma\beta \ln \frac S{S_0}
\end{align*}
$$

---


![width:1200px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/KMK_planar_trajectories.png)

Trajectories in phase plane $(S,I)$ corresponding to IC $(S_0,1-S_0)$ and $\beta/\gamma=2.5$


---

# The basic reproduction number $\mathcal{R}_0$

Suppose total population $N$ is normalised, i.e., $N=1$. Then $R=1-(S+I)$

Define
$$
\begin{equation}\label{eq:R0_KMK}\tag{4}
\mathcal{R}_0=\frac{\beta}{\gamma}
\end{equation}
$$


---

<div class="theorem">

Let $(S(t),I(t))$ be a solution to $\eqref{sys:KMK_dS}$-$\eqref{sys:KMK_dR}$ in proportions and $\mathcal{R}_0$ be defined as in $\eqref{eq:R0_KMK}$. If $\mathcal{R}_0
S_0\leq 1$, then $I(t)$ tends to 0 when $t\to\infty.$ If $\mathcal{R}_0
S_0>1$, then $I(t)$ first reaches a maximum 
$$
1-\frac 1{\mathcal{R}_0}-\frac{\ln(\mathcal{R}_0 S_0)}{\mathcal{R}_0}
$$
then tends to 0 when $t\to\infty$

The proportion $S(t)$ of susceptibles is a nonincreasing function and its limit $S(\infty)$ is the unique solution in $(0,1/\mathcal{R}_0)$ of the equation 
$$
1-S(\infty)+\frac{\ln[S(\infty)/S_0]}{\mathcal{R}_0}=0
$$
</div>

---

<!-- _backgroundImage: "linear-gradient(to bottom, red,black)" -->
# <!--fit-->Incidence functions

---

Before proceeding further, worth spending some time discussing **incidence functions**, which describe how contacts between individuals take place and lead to new cases

See in particular McCallum, Barlow & Hone, [How should pathogen transmission be modelled?](https://doi.org/10.1016/S0169-5347(01)02144-9), Trends in Ecology & Evolution **16** (2001)

---

# <!--fit-->Remark - Incidence function versus force of infection

Two different forms for the rate of movement of $S$ individuals from $S$ to whatever infected compartment they end up in:

- $S'=-f(S,I,N)$ is an **incidence function**
- $S'=-\lambda(S,I,N)S$ is a **force of infection**

The two are of course essentially equivalent, the context tends to drive the form used. Advanced PDE models that consider for instance an age-of-infection structure need to integrate over $I(t,a)$ and thus often use force of infection, others are somewhat random..

---

# Interactions - Infection

- Rate at which new cases appear per unit time is the *incidence function*
$$
\tag{5}
f(S,I,N)
$$
- Depends of the number $S$ of susceptible individuals, $I$ of infectious individuals and, sometimes, of the total population $N$
- Incidence includes two main components:
  - a denumeration of the number of contacts taking place
  - a description of the probability that such a contact, when it takes place, results in the transmission of the pathogen
- Choosing an appropriate function is hard and probably one of the flunkiest part of epidemic modelling

---

# Two most frequently used functions

The two most frequently used incidence functions are  **mass action incidence**
$$\tag{6}
f(S,I, N)=\beta SI
$$
and **standard** (or **proportional**) **incidence**
$$\tag{7}
f(S,I, N)=\beta\frac{SI}{N}
$$

In both cases, $\beta$ is the *disease transmission coefficient*

---

# Units of $\beta$

Recall that if $X(t)$ is the population in compartment $X$ at time $t$, then $X'$ has units $\text{number}/\text{time}$

In a differential equation, left and right hand side must have same units, so..

### Mass action incidence

$$
\beta SI \propto 
\beta\times\text{number}\times\text{number}
$$
has units number/time if $\beta$ has units $1/(\text{number}\times\text{time})$

### Standard incidence

$$
\beta SI/N \propto 
\beta\times\text{number}\times\text{number}/\text{number} \propto \beta \times\text{number}
$$
has units number/time if $\beta$ has units $1/\text{time}$

---

# Mass action incidence

$$
\begin{equation}
\tag{6}\label{eq:incidence_mass_action}
f(S,I, N)=\beta SI
\end{equation}
 $$

- There is homogenous mixing of susceptible and infectious individuals 
- Strong hypothesis: each individual potentially meets every other individual

In this case, one of the most widely accepted interpretations is that all susceptible individuals can come across all infectious individuals (hence the name, by analogy with gas dynamics in chemistry/physics) 

When population is large, the hypothesis becomes unrealistic

---

# Standard (proportional) incidence 

The other form used frequently:
$$
\begin{equation}
\tag{7}\label{eq:incidence_proportional}
f(S,I,N)=\beta\frac{SI}{N}
\end{equation}
$$

Each susceptible individual meets a fraction of the infectious individuals

Or vice-versa! See, e.g., Hethcote, [Qualitative analyses of communicable disease models](https://doi-org.uml.idm.oclc.org/10.1016/0025-5564(76)90132-2), *Mathematical Biosciences* (1976)

Case of a larger population

---

# Constant population $\implies$ $\eqref{eq:incidence_mass_action}$ $\equiv$ $\eqref{eq:incidence_proportional}$

When the total population is constant, a lot of incidence function are equivalent (to units)

Suppose $N(t)\equiv N_0$, then
$$
\beta SI = \tilde\beta\frac{SI}{N}
\iff \tilde\beta=N_0\beta
$$
and if the right hand side is satisfied, then $\eqref{eq:incidence_mass_action}$ and $\eqref{eq:incidence_proportional}$ identical

Keep in mind units are different, though

---

# General incidence

$$
\tag{8}
f(S,I,N)=\beta S^q I^p
$$
These functions were introduced with data fitting in mind: fitting to data, find the $p,q$ best matching the available data

---

# Incidence with refuge

The following implements a refuge effect; it assumes that a proportion $0<q<1$ of the population is truly susceptible, because of, e.g., spatial heterogenities

$$
\tag{9}
f(S,I,N)=
\begin{cases}
\beta I\left(N-\dfrac Iq\right),&\textrm{if }I<qN \\
0,&\textrm{if }I\geq qN
\end{cases}
\qquad\qquad
$$


---

# Negative binomial incidence

$$
\tag{10}
f(S,I,N)=kS\ln\left(1+\beta\frac Ik\right)
$$
For small values of $k$, this function describes a very concentrated infection process, while when $k\to\infty$, this function reduces to a mass action incidence

---

# Switching incidence

Arino & McCluskey, [Effect of a sharp change of the incidence function on the dynamics of a simple disease](https://doi.org/10.1080/17513751003793017), *Journal of Biological Dynamics* (2010)

Scale population so switch occurs at $N=1$ and suppose
$$
\tag{11}
F(S,I,N) = 
\begin{cases}
\beta SI & \textrm{if }N\leq 1 \\
\beta \dfrac{SI}{N} & \textrm{if }N> 1
\end{cases}
$$
In SIS with non-constant population
$$
\begin{align}
S' &= bN-dS-F(S,I,N)+\gamma I \\
I' &= F(S,I,N)-(d+\delta+\gamma)I
\end{align}
$$
$b\neq d$ and $\delta$ disease-induced death rate, periodic solutions found

---

<!-- _backgroundImage: "linear-gradient(to bottom, red,black)" -->
# <!--fit--> The (endemic) SIS model

---
 
- Consider a closed population
- Assume individuals in the population can be in one of two states:
  - *susceptible* (to the disease) if they are not currently harbouring the pathogen 
  - *infectious* (and *infected*) if they have contracted the disease and are actively spreading it

$\implies$ there are two compartments and the aim of modelling is to describe evolution of numbers in each compartment

--- 
 
- $S(t)$ the number of susceptibles at time $t$
- $I(t)$ the number of infectious/infected at time $t$
- $N(t)=S(t)+I(t)$ the total population total

The following hypotheses describea disease for which the incubation period is short or even non-existent

We also assume infection has limited duration for each individual

---

# Type of compartments

## Susceptible individuals

- Are born at a *per capita* rate $b$ proportional to the total population $N$
- Die at the *per capita* rate $d$, proportional to the susceptible population $S$
- Newborns are susceptible (*vertical transmission* is ignored)

## Infected and infectious individuals

- Die at the *per capita* rate $d$, proportional to the infected/infectious population $I$
- Recover at the *per capita* rate $\gamma$
- We do not take into account disease-induced death

---

# Model flow diagram

![width:600px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/figure_SIS_base_prop_incidence_birthdN.png)

---

# The model

![bg right:34% width:400px](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/figure_SIS_base_prop_incidence_birthdN_vertical.png)

$$
\begin{align}
S' &= \underbrace{bN}_\textrm{birth}
-\underbrace{dS}_\textrm{death} 
-\underbrace{\beta\frac{SI}{N}}_\textrm{infection}
+\underbrace{\gamma I}_\textrm{recovery}
\tag{12a}\label{sys:SIS_base_dS}\\
I' &= \underbrace{\beta\frac{SI}{N}}_\textrm{infection}
-\underbrace{dI}_\textrm{death} 
-\underbrace{\gamma I}_\textrm{recovery} 
\tag{12b}\label{sys:SIS_base_dI}
\end{align}
$$

Consider initial value problem (IVP) consisting of this system together with initial conditions $S(0)=S_0\geq 0$ and $I(0)=I_0\geq 0$

---

# Remarks
 
- In what follows, assume $b=d$ to keep population constant
- $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ is an SIS (Susceptible-Infectious-Susceptible) model
- If $\gamma=0$ (no recovery), then model is SI
  - In this case, infected individual remains infected their whole life (but disease is not lethal since there is no disease-induced death)
- Diseases with these types of characteristics are bacterial diseases such as those caused by *staphylococcus aureus*, *streptococcus pyogenes*, *chlamydia pneumoniae* or *neisseria gonorrhoeae*

---

# Birth and death are *relative*

Remark that the notions of *birth* and *death* are relative to the population under consideration

E.g., consider a model for human immunodeficiency virus (HIV) in an at-risk population of intravenous drug users. Then 
- birth is the moment the at-risk behaviour starts
- death is the moment the at-risk behaviour stops,  whether from "real death" or because the individual stops using drugs



---

# Analysis of the system

System $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ is planar nonlinear 

Typically, we would use standard planar analysis techniques

However, here we can find an explicit solution

**NB:** while this is useful illustration, this is a rare exception!!

---

# Dynamics of $N$

We have
$$
\begin{align*}
N' &= (S+N)' \\
&= dN-dS\beta\frac{SI}{N}
+\gamma I+\beta\frac{SI}{N}-dI-\gamma I \\
&= dN-d(S+I) \\
&=0
\end{align*} 
$$
As a consequence, for all $t$, $N(t)\equiv N_0:=S_0+I_0$

---

# Proportions

$$
s=\frac{S}{N}\quad\quad i=\frac{I}{N}
$$
Remark that $s+i=(S+I)/N=1$. The derivative of $i$ is
$$
i' = \frac{I'N-IN'}{N^2}=\frac{I'}{N}-\frac{iN'}{N}
$$
Since $N'=0$, 
$$
i'=\frac{I'}{N}
$$
Substite the right hand term of $\eqref{sys:SIS_base_dI}$ in this equation, giving
$$
i'=\beta\frac{SI}{N^2}-d\frac{I}{N}-\gamma\frac{I}{N}=\beta si-(d+\gamma)i
$$

---

# The system in proportions

Since $s+i=1$, we can use $s=1-i$ in the latter equation, giving $i'=\beta(1-i)i-(d+\gamma)i$. As a consequence, the *system in proportion* is
$$
\begin{align}
s &= 1-i \tag{13a}\label{sys:SIS_proportion_ds} \\
i' &= \beta(1-i)i-(d+\gamma)i 
\tag{13b}\label{sys:SIS_proportion_di}
\end{align}
$$

Since $N$ constant, solutions of $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ are deduced directly from those of $\eqref{sys:SIS_proportion_ds}$-$\eqref{sys:SIS_proportion_di}$ and we now consider $\eqref{sys:SIS_proportion_ds}$-$\eqref{sys:SIS_proportion_di}$

---

Rewrite $\eqref{sys:SIS_proportion_di}$ as
$$
\begin{equation} 
\tag{14}\label{eq:SIS_i_as_Bernoulli}
i'-(\beta-(d+\gamma))i=-\beta i^2
\end{equation}
$$
This is a Bernoulli equation and the change of variables $u=i^{-1}$ gives the linear equation
$$
-u'-(\beta-(d+\gamma))u=-\beta
$$
so that finally
$$
\begin{equation}
\tag{15}\label{eq:SIS_true_Bernoulli}
u'+(\beta-(d+\gamma))u=\beta
\end{equation}
$$

---

An integrating factor is 
$$
\mu(t)=\exp\left(\int P(t)dt\right)=e^{(\beta-(d+\gamma))t}
$$
and thus
$$
\mu(t)u=\frac{\beta}{\beta-(d+\gamma)}e^{(\beta-(d+\gamma))t}+C
$$
for $C\in\mathbb{R}$, so finally
$$
u=\frac{\beta}{\beta-(d+\gamma)}+Ce^{-(\beta-(d+\gamma))t}
$$

---

The initial condition $i_0=I_0/N$ takes the form $u(0)=1/i_0$. Thus,
$$
u(0)=\frac{1}{i_0}=\frac{\beta}{\beta-(d+\gamma)}+C
$$
which implies that
$$
C=\frac{\beta-(d+\gamma)-i_0\beta}{i_0(\beta-(d+\gamma))}
$$

---

As a consequence, the solution to the linear equation $\eqref{eq:SIS_true_Bernoulli}$ is
$$
\begin{aligned}
u &= \frac{i_0\beta+(\beta-(d+\gamma)-i_0\beta)e^{-(\beta-(d+\gamma))t}}
{i_0(\beta-(d+\gamma))} \\
&= \frac{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}{i_0(\beta-(d+\gamma))}
\end{aligned}
$$
and that of $\eqref{eq:SIS_i_as_Bernoulli}$ is
$$
i(t)=\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$

---

In summary, the solution to the system in proportions is given by
$$
s(t)=1-\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$
and
$$
i(t)=\frac{i_0(\beta-(d+\gamma))}{i_0\beta(1-e^{-(\beta-(d+\gamma))t})
  +(\beta-(d+\gamma))e^{-(\beta-(d+\gamma))t}}
$$

---

From these solutions, there are two cases: 
 
- If $\beta-(d+\gamma)<0$, then $\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=+\infty$, so $\lim_{t\to\infty}s(t)=1$ and $\lim_{t\to\infty}i(t)=0$
- If $\beta-(d+\gamma)>0$, then $\lim_{t\to\infty}e^{-(\beta-(d+\gamma))t}=0$; thus, $\lim_{t\to\infty}s(t)=1-(\beta-(d+\gamma))/\beta$ and $\lim_{t\to\infty}i(t)=(\beta-(d+\gamma))/\beta$



---

# The basic reproduction number $\mathcal{R}_0$

Reformulate in epidemiological terms, using the *basic reproduction number*,
$$
\mathcal{R}_0=\frac{\beta}{d+\gamma}
$$
We have the following equivalencies
$$
\begin{gathered}
\mathcal{R}_0< 1 \Leftrightarrow \beta-(d+\gamma)< 0 \\
\mathcal{R}_0>1 \Leftrightarrow \beta-(d+\gamma)>0
\end{gathered}
$$
Also,
$$
\frac{\beta-(d+\gamma)}{\beta}=1-\frac{1}{\mathcal{R}_0}
$$

---

We have proved the following result

<div class="theorem">

For system $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$, the following alternative holds
 
- If $\mathcal{R}_0< 1$, then
  - $\lim_{t\to\infty}s(t)=1$
  - $\lim_{t\to\infty}i(t)=0$, the disease **goes extinct**
- If $\mathcal{R}_0>1$, then
  - $\lim_{t\to\infty}s(t)={1}/{\mathcal{R}_0}$
  - $\lim_{t\to\infty}i(t)=1-1/{\mathcal{R}_0}$, the disease becomes **endemic**
</div>

---

# $I^*$ as a function of $\mathcal{R}_0$

The higher $\mathcal{R}_0$, the higher the proportion of infectious individuals in the population

![width:550px center](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/R0.png)

---
 
 # Further remarks about $\mathcal{R}_0$

- $\mathcal{R}_0$ determines the propensity of a disease to become established in a population
- The aim of control policies is therefore to reduce $\mathcal{R}_0$ to values less than 1
- The "verbal" definition of $\mathcal{R}_0$ is *the average number of secondary infections produced by the introduction of an infectious individual in a completely naive population*
- Remark that for our basic model, $1/(d+\gamma)$ is the average time of sojourn in the $I$ compartment before death or recovery and $\beta$ is the probability of infection 

---

# The basic reproduction number $\mathcal{R}_0$

Indicator often used in epidemiology. Verbally

> average number of new cases generated when an infectious individual is introduced in a completely susceptible population
 
- If $\mathcal{R}_0<1$, then each infectious individual infects on average less than 1 person and the epidemic is quite likely to go extinct
- If $\mathcal{R}_0>1$, then each infectious individual infects on average more than 1 person and an epidemic is quite likely to occur

---

# Some values of $\mathcal{R}_0$ (estimated from data)
| Infection | Place | Period | $\mathcal{R}_0$ |
|:---|:---|:---|:---|
| Measles | Cirencester, England | 1947-50 | 13-14 |
|| England & Wales | 1950-68 | 16-18 |
|| Kansas, USA | 1918-21 | 5-6 |
|| Ontario, Canada | 1912-3 | 11-12 |
|| Willesden, England | 1912-3 | 11-12 |
|| Ghana | 1960-8 | 14-15 |
|| East Nigeria | 1960-8 | 16-17 |

---

# Classic way to compute $\mathcal{R}_0$
Take SIS $\eqref{sys:SIS_base_dS}$-$\eqref{sys:SIS_base_dI}$ normalised to $N=1$ 
$$
\begin{align*}
S' &= d-dS-\beta SI+\gamma I \\
I' &= \beta SI-(d+\gamma)I 
\end{align*}
$$
DFE: $(\bar S,\bar I)=(1,0)$
$$
J_{DFE}=\begin{pmatrix}
-d & \gamma-\beta\bar S \\
\beta\bar I & \beta\bar S-(d+\gamma)
\end{pmatrix}
=
\begin{pmatrix}
-d & \gamma-\beta \\
0 & \beta-(d+\gamma)
\end{pmatrix}
$$
When eigenvalues $-d$ and $\beta-(d+\gamma)$

$\Rightarrow$ LAS of the DFE is determined by the sign of $\beta-(d+\gamma)$

Find same $\mathcal{R}_0$ as before

---

# A more efficient way to $\mathcal{R}_0$: next generation matrix

Diekmann and Heesterbeek, characterised in ODE case by PvdD & Watmough (2002)

Consider only compartments $x$ with *infected individuals* and write
$$
x'=\mathcal{F}-\mathcal{V}
$$
 
- $\mathcal{F}$ flows into infected compartments because of new infections
- $\mathcal{V}$ other flows (with $-$ sign)

Compute the (Frechet) derivatives $F=D\mathcal{F}$ and $V=D\mathcal{V}$ with respect to the infected variables $x$ and evaluate at the DFE

Then
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
where $\rho$ is the spectral radius


---

# The main result of PvdD and Watmough (2002)

<div class="theorem">

Suppose the DFE exists. Let then
$$
\mathcal{R}_0=\rho(FV^{-1})
$$
with matrices $F$ and $V$ obtained as indicated. Assume conditions (A1) through (A5) hold. Then
- if $\mathcal{R}_0<1$, then the DFE is LAS
- if $\mathcal{R}_0>1$, the DFE is unstable
</div>

(We make conditions (A1)-(A5) explicit in [Practicum 02](2022_04_3MC_EpiModelling_P02_Analysis_LargeScaleModels.html) and discuss why it can be important to check they do hold true in [Lecture 09](https://julien-arino.github.io/3MC-course-epidemiological-modelling/2022_04_3MC_EpiModelling_L09_RecentMathematicalModels.html))

---

# Summary thus far
- An SIR *epidemic* model (the KMK SIR) in which the presence or absence of an epidemic wave is characterised by the value of $\mathcal{R}_0$
- An SLIAR *epidemic* model extending the KMK SIR
- An SIS *endemic* model in which the threshold $\mathcal{R}_0=1$ is such that when $\mathcal{R}_0<1$, the disease goes extinct, whereas when $\mathcal{R}_0>1$, the disease becomes established in the population
- Both the KMK SIR and the SIS are integrable in some sense. **This is an exception!!!**


---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->Effect of vaccination - Herd immunity

---

Take SIR model and assume the following
- Vaccination takes susceptible individuals and moves them directly into the recovered compartment, without them ever becoming infected/infectious
- Birth = death
- A fraction $p$ is vaccinated at birth
- $f(S,I,N)=\beta SI$

![width:600px center](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/SIR_simple_vacc_blackBG.png)

---

![width:800px center](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/SIR_simple_vacc_blackBG.png)

$$
\begin{align}
S' &= (1-p)dN-dS-\beta SI \tag{16a} \\
I' &= \beta SI -(d+\gamma)I \tag{16b} \\
R' &= pdN+\gamma I-dR \tag{16c}
\end{align}
$$

---

# Computation of $\mathcal{R}_0$
 
- DFE, SIR: 
$$
E_0:=(S,I,R)=(N,0,0)
$$
- DFE, SIR with vaccination
$$
E_0^v:=(S,I,R)=
\left((1-p)N,0,pN\right)
$$

Thus,
- In SIR case
$$
\mathcal{R}_0=\frac{\beta N}{d+\gamma}
$$
- In SIR with vaccination case, denote $\mathcal{R}_0^\textrm{v}$ and
$$
\mathcal{R}_0^\textrm{v}=(1-p)\mathcal{R}_0
$$

---

# Herd immunity

Therefore 
- $\mathcal{R}_0^\textrm{v}<\mathcal{R}_0$ if $p>0$
- To control the disease, $\mathcal{R}_0^\text{v}$ must take a value less than 1, i.e.,
$$
\tag{17}
\mathcal{R}_0^\text{v}<1 \iff p> 1-\frac{1}{\mathcal{R}_0}
$$

By vaccinating a fraction $p>1-1/\mathcal{R}_0$ of newborns, we thus are in a situation where the disease is eventually eradicated

This is *herd immunity*

