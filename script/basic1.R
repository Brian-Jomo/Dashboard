#load package

library("tidyverse")
library(here)
#read in data
 beaches<-read.csv(here("rdata folder","sydneybeaches.csv"))
 view(beaches)
dim(beaches)
str(beaches)
glimpse(beaches)
summary(beaches)
head(beaches)
tail(beaches)
install.packages(skimr)
#load package
library(skimr)
skim(beaches)
library(readxl)
library(here)
company<-read.xlsx(here("rdata folder","company.xlsx"))
glimpse(beaches)
select_all(beaches,toupper)
select_all(beaches,tolower)
library(janitor)
clean_names(beaches)
names(beaches)
#  separate names by _
cleanbeaches<-clean_names(beaches)
cleanbeaches
names(cleanbeaches)
#for rename use new name =old name
cleanbeaches<-rename(cleanbeaches,ent=enterococci_cfu_100ml)
rename(cleanbeaches,ent=enterococci_cfu_100ml)
#select columns of interest
select(cleanbeaches,ent,council,site)
#select everything after a column of choice
select(cleanbeaches,ent,council,site,everything())
#pipe

