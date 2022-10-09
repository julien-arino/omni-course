---
marp: true
title: Course organisation
description: Julien Arino - 3MC Course Epidemiological Modelling - Lecture 00 - Course organisation
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

<!-- _backgroundImage: "linear-gradient(to top, #85110d, 1%, black)" -->
# OMNI course (Part I)  organisation

# Introduction to Mathematical Epidemiology

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
- About Part I of the course
- This week's lectures
- A few remarks about terminology
- Mathematical epidemiology

---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->About Part I of the course

## (One Health Modelling for Emerging Infectious Diseases)

---

# <!--fit-->An Introduction and three Themes

0. Introduction
1. Coronaviruses
2. Influenza
3. Environmental transmission of bacterial and fungal pathogens

Each block is 3 weeks, running from the week of 11 October 2022 to the week of 23 January 2023

Except for the Introduction, each block finishes with a week of group work and presentations of the result of group work

---

# <!--fit-->Tutorials, assigned work, etc.

0. Introduction co-taught by several of us

Each Theme block is taught by one instructor:
1. Coronaviruses: Marina Freire-Gormaly
2. Influenza: Assefa Woldegebriel
3. Environmental transmission: Julien Arino

Each block will have assignments, tutorials, etc. The instructor for that block will give you details

---

# <!--fit-->This week's lectures - Outline 
- A (super) brief introduction to mathematical epidemiology (rest of these slides)
- Introduction to compartmental models in epidemiology
  - The SIR epidemic model of Kermack and McKendrick
  - The SIS endemic model
- Numerical methods for epidemiological models
  - Solving ODE
  - Simulating continuous time Markov chains

---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->A few remarks about terminology

---

# Incidence versus Prevalence

**Incidence**: number of new cases in a population generated within a certain time period

**Prevalence**: number of cases of a disease at a single time point in a population

$\implies$ $I(t)$ in an epidemiological model is **prevalence**, not **incidence**

(I will come back to that) 

---

# Exposition versus Exposed

- Some bright bulb (not sure who) in days of yore: let's call **exposed** someone who has contracted the disease but is not yet showing symptoms ($\implies$ SEIR model)

- "Real" epidemiologist: let's trace people who were exposed to the virus, i.e., people having come into contact with the virus (whether they have contracted the disease or not)

- Interestingly, I have embarked on a quixotic quest to make people use $L$ instead of $E$, only to be told by real epidemiologists that they don't care :)

---

# Epidemic curves

- Used to record the occurrence of new cases as a function of time
- When not too many cases, usually "individualised" (bar plots)
- When number of cases is large, continuous curve

---

![bg contain](https://media.springernature.com/full/springer-static/image/art%3A10.1038%2Fs41591-020-1092-0/MediaObjects/41591_2020_1092_Fig1_HTML.png?as=webp "https://doi.org/10.1038/s41591-020-1092-0")

---

![bg contain](https://www.science.org/cms/10.1126/science.abf8832/asset/c20b60b8-4867-4cbb-80ba-a4e6a80135e1/assets/graphic/371_27_f1.jpeg "https://doi.org/10.1126/science.abf8832")

---

# Some more terminology

- **Epidemic**: diseases that are *visited upon* a population
- **Pandemic**: epidemic that has spread across a large region, e.g., multiple continents or worldwide
- **Endemic**: diseases that *reside within* a population
- We don't say "panendemic"

---

# WHO pandemic (influenza) [phases](https://www.ncbi.nlm.nih.gov/books/NBK143061/)

<style>
    .heatMap {
        overflow:scroll;
    }
    .heatMap th {
        background: grey;
    }
    .heatMap tr:nth-child(1) { background: green;}
    .heatMap tr:nth-child(2) { background: green;}
    .heatMap tr:nth-child(3) { background: yellow;}
    .heatMap tr:nth-child(4) { background: yellow;}
    .heatMap tr:nth-child(5) { background: orange;}
    .heatMap tr:nth-child(6) { background: red;}
</style>

<div class="heatMap">

| Period | Phase | Description |
|:---|:---:|:---|
| Interpandemic | 1 | No animal influenza virus circulating among animals has been reported to cause infection in humans |
| | 2 | Animal influenza virus circulating in domesticated or wild animals known to have caused infection in humans and therefore considered a specific potential pandemic threat |
| Pandemic alert | 3 | Animal or human-animal influenza reassortant virus has caused sporadic cases or small clusters of disease in people, but has not resulted in H2H transmission sufficient to sustain community-level outbreaks |
| | 4 | Human-to-human transmission of an animal or human-animal influenza reassortant virus able to sustain community-level outbreaks has been verified |
| | 5 | Same identified virus has caused sustained community-level outbreaks in at least 2 countries in 1 WHO region |
| Pandemic | 6 | In addition to criteria in Phase 5, same virus has caused sustained community-level outbreaks in at least 1 other country in another WHO region |

</div>

---

![bg](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/World_Health_Organisation_regional_offices.svg/1280px-World_Health_Organisation_regional_offices.svg.png)

---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->Mathematical Epidemiology

---

# Domain is quite old ..

.. but has only become a thing in recent years!

---

![bg right:40%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/Bernoulli-1760-first_page.jpg)

# Daniel Bernoulli (1760)

- [BNF scan](https://gallica.bnf.fr/ark:/12148/bpt6k3558n/f220.item) or [pdf](https://julien-arino.github.io/assets/pdf/Bernoulli-1760.pdf)
- Probably the first epidemic model
- About petite vérole (smallpox) inoculation

---

![bg left:30%](https://raw.githubusercontent.com/julien-arino/3MC-course-epidemiological-modelling/main/FIGS/RonaldRoss_WellcomeCollection.jpg)
# Ross (early 1900)

- On 20 August 1897, observed malaria parasites in the gut of a mosquito fed several days earlier on a malaria positive human
- Nobel Prize for Medicine 1902
- Started considering malaria eradication using mathematical models; for some history, read [this 2012 paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3320609/pdf/ppat.1002588.pdf)

---

# Kermack and McKendrick (1927+)

- We spend more time on this later
- Groundbreaking set of papers starting in 1927
  - We will see one particular case, the most well known, but I point out here and point out in Lecture 02 that this is just the tip of the iceberg of their work

---

# Some activity later, but not much until 1990s

- In recent years, explosion
- Since the beginning of COVID-19: just nuts..

---

# <!--fit-->Some landmarks in mathematical epidemiology (IMBO)

- Macdonald. The epidemiology and control of malaria. 1957
- Baroyan, Rvachev et al. Deterministic epidemic models for a territory with a transport network. Kibernetika, 1967
- Hethcote & Yorke. Gonorrhea Transmission Dynamics and Control. LNBM 56, 1984
- Anderson & May. Infectious diseases of humans: dynamics and control. 1991
- Capasso. Mathematical Structures of Epidemic Systems. LNBM 97, 1993
- Hethcote. The mathematics of infectious diseases. SIAM Review, 2000
- van den Driessche & Watmough. Reproduction numbers and sub-threshold endemic equilibria for compartmental models of disease transmission. MBS, 2002

---

# Computational epidemiology - A more recent trend

- Some rare numerical work $\leq$ 1980s, mostly simulation of math models
  - Baroyan, Rvachev et al. [Computer modelling of influenza epidemics for the whole country (USSR)](https://doi.org/10.2307/1426167). *Advances in Applied Probability* (1971)
  - Flahault, Letrait et al.[Modelling the 1985 influenza epidemic in France](https://doi.org/10.1002/sim.4780071107). *Statistics in Medicine* (1988)
- More and more frequent now, to the point that some modelling studies are purely simulation-based

---

# Network / Agent-based models (ABM)

## ABM

- Early in the life of these models, they were called IBM (individual-based models)
- Over the years, a "philosophical" distinction has emerged:
  - IBM are mathematical models that consider individuals as the units; e.g., DTMC, CTMC, branching processes, etc.
  - ABM are computational models whose study is, for the most part, only possible numerically 

## ABM vs Network models

- Network models endow vertices with simple systems and couple them through graphs
- Can be ABM, but some networks can also be studied analytically

---

# <!-- fit -->Use of data in epidemiology - Undergoind a transformation

- Epidemiology has long relied on data
- Many developments in statistics originate there
- Data has traditionally been better for chronic diseases than for infectious ones
- Near-real-time surveillance of infectious diseases ongoing since the 1980s (e.g., Réseau Sentinelles)
- SARS-CoV-1 saw the beginning of a move towards real-time emerging infectious disease data
- With SARS-CoV-2, the system has really progressed a lot, both in terms of "citizen science" and governmental initiatives