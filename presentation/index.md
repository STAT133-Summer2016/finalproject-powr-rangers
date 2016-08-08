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

Combined Years:

- Dataset is split into fifteen datasets, one for each odd year between 1985 and 2013
- To standardize the data used data from 2003 - 2013
- Reorder the columns to exactly match that of our base (2003 onward)
- Combine every list of datasets into single dataset

Clean Data:

- Initally removed NAs, expressed column in read_csv
- Set column names to lowercase, removed quotations
- Created column for owning and renting data (1= own, 2= rent)
- Write to csv (same for combined years)

---



## Variables According to the HUD Document Data Set 

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

<img src="figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

---

## Monthly Housing Costs and Burden 


<img src="figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

---

## Regional Monthly Housing Costs and Burden

<img src="figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

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


## Income Compared to Area's Median by House TypeS

<img src="figure/unnamed-chunk-9-1.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" style="display: block; margin: auto;" />


---

## Burden Based on Median Housing Cost with Assistance

<img src="figure/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" style="display: block; margin: auto;" />


---

## MORE GRAPHS

<img src="figure/unnamed-chunk-11-1.png" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" style="display: block; margin: auto;" />

- Adjusted income per persons
- Bracketed by HUD indexes (0.70 for 1 person, 0.80 for 2, 1.00 for 4)
- Spike around 2010 associated with financial crisis


---


## Median Income Adjusted for Number of Bedrooms By Region


<img src="figure/unnamed-chunk-12-1.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" style="display: block; margin: auto;" />

Adjusted income per bedroom

Bracketedby HUD indexes (0.70 for 0, 0.90 for 2, 1.04 for 3)

More discrepancy in burden levels between the Midwest/South and Northeast/West 
  
  - Larger homes in the Midwest/South

Purhasing parity shoudl be higher in midwest/south, not expressed in data

---

## Concluding Thoughts

Housing Affordability Has Decreased

The 2007 Housing Bubble Crisis and it's Consequences

Census Regions Differences 
  
  - Western and Northeast Regions Vs. South and Midwest

---


## Future Questions 

* Does the Data in some graphs keep showing a downward slope? 

* If we analyzed data from 2013 - 2016, would it show another potential, housing housing bubble?

* Our data is limited to 2013, so what is the housing situation most recently?


---

## Ask Us Anything



---
