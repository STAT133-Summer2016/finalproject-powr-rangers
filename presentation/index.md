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




```
## Error: '../mydeck/clean_years.csv' does not exist in current working directory ('/Users/Lamb/Documents/GitHub/finalproject-powr-rangers/presentation').
```


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

```
## Error in eval(expr, envir, enclos): object 'clean_years' not found
```

---

## Monthly Housing Costs and Burden 



```
## Error in eval(expr, envir, enclos): object 'clean_years' not found
```

```
## Error in eval(expr, envir, enclos): object 'cleanyearsmonthly' not found
```

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

```
## Error in eval(expr, envir, enclos): object 'cleanyearsmonthly' not found
```

---

## Median Income Among Differing Census Regions in 2013


```
## Error in eval(expr, envir, enclos): object 'clean_years' not found
```

```
## Error in tbl_vars(y): object 'median_incomes' not found
```

```
## Error in map_df$zinc2_median: object of type 'closure' is not subsettable
```

--- 

## Household Size and Burden



```
## Error in eval(expr, envir, enclos): object 'clean_years' not found
```


---

## Households and Poverty 


```
## Error in eval(expr, envir, enclos): object 'clean_years' not found
```


---


## MORE GRAPHS


```
## Error in eval(expr, envir, enclos): object 'clean_years' not found
```


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
