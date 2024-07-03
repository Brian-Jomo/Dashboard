library(tidyverse)
library(here)
bakers_wide<-read.csv(here("rdata folder","bakers_wide.csv"))
bakers_wide %>%
newlongbakers<-bakers_wide%>%gather(key="spice",value="correct",cinnamon_1:nutmeg_3)
newwidebakers<-newlongbakers%>%spread(key=spice,value=correct)
bakers_wide<-long%>%
bakers_long<-pivot_longer(names_to="spice",values_to="correct",cinnamon_1:nutmeg_3)
bakers_wide<-pivot_longer(names_to="spice",values_to="correct")
#more than two variables of interest
pivot_longer<-pivot_longer(names_to=("spice","flavour"),
                           values_to="correct",
                           cinnamon_1:nutmeg_3,
                           names_sep="_")
