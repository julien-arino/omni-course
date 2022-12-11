---
marp: true
title: Environmental transmission of bacterial and fungal pathogens - Introduction
description: Julien Arino - OMNI/RÉUNIS & MfPH course on One Health Modelling for Emerging Infectious Diseases - Environmentally transmitted pathogens - Introduction
theme: default
class: invert
math: mathjax
paginate: false
size: 4:3
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
# <!--fit-->Environmental transmission of bacterial and <br>fungal pathogens - Introduction

December 2022 

Julien Arino ([julien.arino@umanitoba.ca](mailto:Julien.Arino@umanitoba.ca)) [![width:32px](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/GitHub-Mark-Light-64px.png)](https://github.com/julien-arino)

Department of Mathematics & Data Science Nexus
University of Manitoba*

<div style = "font-size:18px; margin-top:-10px; padding-bottom:30px;"></div>

Canadian Centre for Disease Modelling
NSERC-PHAC EID Modelling Consortium (CANMOD, MfPH, OMNI/RÉUNIS)

<div style = "text-align: justify; position: relative; bottom: -5%; font-size:20px;">
* The University of Manitoba campuses are located on original lands of Anishinaabeg, Cree, Oji-Cree, Dakota and Dene peoples, and on the homeland of the Métis Nation.</div>

---

# <!--fit-->Environmental transmission of<br> bacterial and fungal pathogens

## A.k.a. Environmentally transmitted pathogens (ETP)

Part 3 of the OMNI/RÉUNIS course

---

# Bibliographic resources

- Charles Gerba. Chapter on [Environmentally Transmitted Pathogens](https://doi.org/10.1016/B978-0-12-370519-8.00022-5) in [Environmental Microbiology](https://doi.org/10.1016/B978-0-12-370519-8.X0001-6). Where applicable, I follow the same order
- Lanzas et al, [On modelling environmentallytransmitted pathogens](https://doi.org/10.1098/rsfs.2019.0056)

---

<!-- _backgroundImage: "radial-gradient(red,30%,black)" -->
# Outline
- Common features to ETP
- Bacteria
- Parasites
- Viruses
- Fungi

---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->Common features to ETP

---

# <!--fit-->A wide variety of diseases and pathogens

Characteristic is that the pathogens replicate or survive in an abiotic environment

- Enteric diseases
- Food-borne diseases

Important to define precisely what it is we mean by ETP, since the *environment* can be taken to mean anything outside the body, allowing most pathogens to fall into this class

---

# Enteric diseases

Group of diseases associated with the ingestion of food or water contaminated by microorganisms and microbial toxins that attack the gastrointestinal tract

---

# The "celebrated" fecal-oral route ;)

Cannot remember who I heard using the expression originally... Joke aside, a common dissemination route for ETP

![center](https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/F-diagram-01.jpg/1280px-F-diagram-01.jpg)

---

![bg contain 95% invert](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/images_large_es-2017-02811q_0001.jpeg "From https://doi.org/10.1021/acs.est.7b02811")

---

![bg contain invert](https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Modified_F-Diagram.jpg/1280px-Modified_F-Diagram.jpg "From https://doi.org/10.1021/acs.est.7b02811")

---

# Climate change ... changes things

[Example](https://doi.org/10.1371/journal.ppat.1009503) of fungi

![center width:1200px invert](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/journal.ppat.1009503.g001.PNG)

---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->Environmentally transmitted bacteria

- Salmonella
- Escherichia coli
- Campylobacter
- Vibrio
- Helicobacter
- Legionella

--- 

![bg left:40%](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/SalmonellaNIAID_zoom.jpg "From https://en.wikipedia.org/wiki/Salmonella")

# Salmonella

Genus of Gram-negative bacteria (not reactive to the Gram staining method)

Most infections due to ingestion of food contaminated by animal or human feces (e.g., bad handwashing practices at food vendor)

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/SalmonellaTyphiFlagellarStain.jpg/1280px-SalmonellaTyphiFlagellarStain.jpg)

# Typhoid fever

Caused by *Salmonella Typhi*

Symptoms vary from mild to severe; usually begin six to 30 days after exposure

Spread by eating or drinking food or water contaminated with the feces of an infected person

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/E_coli_at_10000x%2C_original.jpg/1280px-E_coli_at_10000x%2C_original.jpg)

# Escherichia coli

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/ARS_Campylobacter_jejuni.jpg/768px-ARS_Campylobacter_jejuni.jpg)

# Campylobacter

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Vibrio_parahaemolyticus_01.jpg/1920px-Vibrio_parahaemolyticus_01.jpg)

# *Vibrio*

Genus of Gram-negative bacteria

Name comes from latin *vibro*, "to move rapidly to and fro, to shake, to agitate"

Several species cause foodborne infections:
- cholera
- vibriosis
- also involved in wound infections

Commonly found in salt water environments

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/9/9d/Cholera_bacteria_SEM.jpg)

# *Vibrio cholerae*

Transmitted through the ingestion of fecally contaminated food and water

Cholera remains prevalent in many parts of Central America, South America, Asia, and Africa.

See [CDC](https://www.cdc.gov/cholera/index.html), [WHO](https://www.who.int/health-topics/cholera) or [WHO cholera dashboards](https://www.who.int/activities/supporting-cholera-outbreak-response/interactive-summary-visuals-of-cholera-data-officially-reported-to-who-since-2000)

---

![bg left:50% invert](https://upload.wikimedia.org/wikipedia/commons/c/c7/Snow-cholera-map.jpg)

# <!--fit-->[London cholera epidemic of 1854](https://fr.wikipedia.org/wiki/Épidémie_de_choléra_de_Broad_Street)

Near Broad Street, London (UK)

Studied by [John Snow](https://en.wikipedia.org/wiki/John_Snow)

> I found that nearly all the deaths had taken place within a short distance of the [Broad Street] pump

---

![bg left:40%]()

# Vibriosis

---

![bg left:40%](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/EMpylori.jpg)

# Helicobacter

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/a/a7/Harmannella_entrapping_Legionella.png)

# Legionella

---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->Environmentally transmitted parasites

- Giardia lamblia
- Cryptosporidium parvum
- Naegleria fowleri
- Toxoplasma gondii
- Ascaris lumbricoides
- Taenia saginata

---

![bg left:60%](https://upload.wikimedia.org/wikipedia/commons/0/08/Giardia_lamblia_SEM_8698_lores.jpg)

# <!--fit--> Giardia lamblia

Flagellated microorganism of genus *Giardia*

Colonises small intestine

Causes diarrhea (giardiasis)

---

![bg contain invert](https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Giardia_life_cycle_en.svg/2116px-Giardia_life_cycle_en.svg.png)

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Cryptosporidium_parvum_01.jpg/1280px-Cryptosporidium_parvum_01.jpg)

# <!--fit-->Cryptosporidium parvum

---

![bg left:40%](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/Naegleria_fowleri_lifecycle_stages.jpg)


# Naegleria fowleri

A.k.a. "brain-eating amoeba"...

Shapeshifting amoeboflagellate excavate

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Toxoplasma_gondii.jpg/1024px-Toxoplasma_gondii.jpg)

# Toxoplasma gondii

---

![bg left:40%](https://cdn.britannica.com/05/182605-050-468F9404/handful-laboratory-technician-Kenya-worms-Ascaris-lumbricoides.jpg)

# <!--fit-->Ascaris lumbricoides

---

![bg contain invert](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Ascaris_lumbricoides_life_cycle.tif/lossless-page1-1058px-Ascaris_lumbricoides_life_cycle.tif.png)

---

![bg left:45% width:400px](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/tapeworm.png)

# Taenia saginata

Sometimes called [Charlie](https://youtu.be/TTyNNu1mIgY) ;)

---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->Environmentally transmitted viruses

- Adenoviruses
- Enteroviruses and paraechoviruses
- Hepatitis A virus (HAV)
- Hepatitis E virus (HEV)
- Rotaviruses
- Rhinoviruses 
- Influenza viruses
- Coronaviruses

---

![bg left:40%](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/Adenovirus_4.jpg)

# Adenoviruses

---

![bg left:40%]()

# Enteroviruses and paraechoviruses

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/f/f5/Hepatitis_A_virus_02.jpg)

# <!--fit-->Hepatitis A virus (HAV)

---

![bg left:40%]()

# Hepatitis E virus (HEV)

---

![bg left:40%]()

# Rotaviruses

---

![bg left:40%]()

# Rhinoviruses 

---

![bg left:40%]()

# Influenza viruses

---

![bg left:40%]()

# Coronaviruses

---

<!-- _backgroundImage: "linear-gradient(to bottom, red, black)" -->
# <!--fit-->Environmentally transmitted fungi

- Aspergillus
- Cryptococcus
- Coccidioides

<div style = "text-align: justify; position: relative; bottom: -30%; font-size:20px;">

Denham, Wambaugh & Brown. [How Environmental Fungi Cause a Range of Clinical Outcomes in Susceptible Hosts](https://doi.org/10.1016/j.jmb.2019.05.003), J Molecular Bio 2019.
</div>

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Aspergillus_niger_01.jpg/1280px-Aspergillus_niger_01.jpg)

# Aspergillus

Genus with 837 species

Named after *aspergillium* (holy water sprinkler), first observation in 1729 by Pier Antonio Micheli, biologist and ... priest

On the left: *aspergillus niger*

*Aspergillus fumigatus* causes >90% infections, in particular in individuals with an immunodeficiency

---

# Aspergillus fumigatus infections

Invasive pulmonary aspergillosis (IPA): fungi enter the lung, invade and damage lung tissue and enter blood vessels. CFR 50%-95% depending on speed of diagnosis, condition...

---

![bg left:40%](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Cryptococcus_neoformans_using_a_light_India_ink_staining_preparation_PHIL_3771_lores.jpg/1280px-Cryptococcus_neoformans_using_a_light_India_ink_staining_preparation_PHIL_3771_lores.jpg)

# Cryptococcus

---

![bg left:40%](https://raw.githubusercontent.com/julien-arino/omni-course-part1/main/FIGS/Coccidioidomycosis_-_PAS_stain_(5286000370).jpg)


# Coccidioides

---

![bg contain invert](https://upload.wikimedia.org/wikipedia/commons/1/19/Life_cycle_of_Coccidioides.PNG "From https://doi.org/10.1371/journal.ppat.1004762")


