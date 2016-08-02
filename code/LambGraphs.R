

##### BRANCH NAMES: LambTesting



##### Cleaning data for monthly costs
cleanyears <- read_csv("clean_years.csv", col_types = "cicciiciiciiidicidicddddddiidddddddddddddddddididididididididididididididicccccccccccccccccccccccccd") %>% 
  select(year, zsmhc, region, fmtburden) %>% 
  filter(fmtburden != ".") %>% 
  mutate(fmtburden = str_replace(fmtburden, "Greater than 50%", "50% or More"))



##### Cleaning data for household income
cleanyearsmonthly <- read_csv("clean_years.csv", col_types = "cicciiciiciiidicidicddddddiidddddddddddddddddididididididididididididididicccccccccccccccccccccccccd") %>% 
  select(zinc2, year, region, fmtburden)%>% 
  filter(fmtburden != ".") %>% 
  mutate(fmtburden = str_replace(fmtburden, "Greater than 50%", "50% or More"))


regionNames = c("1" = "Northeast", "2" = "Midwest", "3" = "South", "4" = "West")


#### Monthly Housing Costs

####overall graph

cleanyears %>%  

  group_by_("year", "fmtburden") %>%  
  summarise_(new_y = as.formula(
    paste0("~ median(","zsmhc", ",na.rm=T)"))) %>% 
  
  ggplot(aes_string(x = "year", y = "new_y", color = "fmtburden")) + 
  geom_line() + 
  labs(title = "Relationship between Monthly \nHousing Costs and Burden", 
       y = "Monthly Housing Costs", x = "Year", color = "Burden") 


### faceted by region
  cleanyears %>%  
  
  group_by_("year","region", "fmtburden") %>%  
  summarise_(new_y = as.formula(
    paste0("~ median(","zsmhc", ",na.rm=T)"))) %>% 

 
  ggplot(aes_string(x = "year", y = "new_y", color = "fmtburden")) + 
  geom_line() + 
  facet_wrap(~region, labeller = as_labeller(regionNames)) + 
  labs(title = "Relationship between Monthly \nHousing Costs and Burden", 
       y = "Monthly Housing Costs", x = "Year", color = "Burden") 


###### Household Income
  ####overall graph
cleanyearsmonthly %>%  
    group_by_("year", "fmtburden") %>%  
  summarise_(new_y = as.formula(
    paste0("~ median(","zinc2", ",na.rm=T)"))) %>% 
  

  ggplot(aes_string(x = "year", y = "new_y", color = "fmtburden")) + 
  geom_line() + 
  labs(title = "Relationship between Household \nIncome and Burden", 
       y = "Household Income", x = "Year", color = "Burden") 

  ### faceted by region 
  cleanyearsmonthly %>%  
  group_by_("year","region", "fmtburden") %>%  
  summarise_(new_y = as.formula(
    paste0("~ median(","zinc2", ",na.rm=T)"))) %>% 

  ggplot(aes_string(x = "year", y = "new_y", color = "fmtburden")) + 
  geom_line() + 
  facet_wrap(~region, labeller = as_labeller(regionNames)) +
  labs(title = "Relationship between Household \nIncome and Burden", 
       y = "Household Income", x = "Year", color = "Burden") 

  
  