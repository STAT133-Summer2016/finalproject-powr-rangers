---
title       : Housing Affordability Over the Years
subtitle    : An Exploration into America's Housing Sector
author      : Nikolai, William, Sri, Lamb
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---






## Introduction: Motivation and Dataset

* Our data extends from 

* William's cleaning
* Sri's cleaning
* Plots
* Conclusion stuff


---


## Cleaning the Data


* 




---



## Variables 

Variables According to the HUD Document Data Set

Variables  | Meanings
---------- | --------
Burden | Household’s monthly housing cost divided by its monthly income
Per | Household Size 
ABLMED | Median Income Adjusted for # of Bedrooms
APLMED | Median Income Adjusted for # of Persons
ZSMHC | Monthly housing costs
ZINC2 | Household Income
Assisted | Asssisted Housing
Year | The Year of the Data
Region | Census Region
fmtincrelpovcat |HH Income Relative to Poverty Income 
fmtstructuretype | Structure Type
increlamipct | HH Income relative to AMI (Percent)
fmtcostmedrelamicat | CostMed Relative to Median Income 

---

## Household Income and Burden


```r
clean_years %>% 
  select(zinc2, year, region, fmtburden)%>% 
  filter(fmtburden != ".", fmtburden != "4 No Income") %>% 
  mutate(fmtburden = str_replace(fmtburden, "Greater than 50%", "50% or More")) %>% 
  group_by_("year", "fmtburden") %>%  
  summarise_(new_y = as.formula(
  paste0("~ median(","zinc2", ",na.rm=T)"))) %>% 
  
  
  ggplot(aes_string(x = "year", y = "new_y", color = "fmtburden")) + 
  geom_line(size = 1) + 
  labs(title = "Relationship between Household \nIncome and Burden", 
       y = "Household Income", x = "Year", color = "Burden") +
  scale_y_continuous(limits=c(0,NA),breaks=c(0,20000,40000,60000),labels=function(x){paste0(x/1000, "K")}) +
  scale_colour_brewer(palette = "Dark2") +
  theme_tufte()
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png)

---

## Monthly Housing Costs and Burden 


<img src="figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

---

## Regional Monthly Housing Costs and Burden


```r
  cleanyearsmonthly %>%  
  group_by_("year","region", "fmtburden") %>%  
  summarise_(new_y = as.formula(
    paste0("~ median(","zsmhc", ",na.rm=T)"))) %>% 
  ggplot(aes_string(x = "year", y = "new_y", color = "fmtburden")) + 
  geom_line(size = 1) + 
  facet_wrap(~region, labeller = as_labeller(regionNames)) + 
  labs(title = "Relationship between Monthly \nHousing Costs and Burden", 
       y = "Monthly Housing Costs ($)", x = "Year", color = "Burden") +
  scale_colour_brewer(palette = "Dark2") +
  theme_tufte()
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png)

---

## Median Income Among Differing Census Regions in 2013

<img src="figure/unnamed-chunk-6-1.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" style="display: block; margin: auto;" />

--- 

## Household Size and Burden


![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)


---

## Households and Poverty 

<img src="figure/unnamed-chunk-8-1.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" style="display: block; margin: auto;" />


---


## MORE GRAPHS

<img src="figure/unnamed-chunk-9-1.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" style="display: block; margin: auto;" />


---



## Concluding Thoughts

* Housing Affordability Has Decreased

* The 2007 Housing Bubble Crisis 

* Different Housing Regions Affected Differently 
  
  * Western and Northeast Regions Vs. South and Midwest

---


## Future Questions 

* Does the Data in some graphs keep showing a downward slope? 

* If we analyzed data from 2013 - 2016, would it show another potential, housing housing bubble?

* Our data is limited to 2013, so what is the housing situation most recently?


---

## Ask Us Anything



---
