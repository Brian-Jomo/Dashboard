# bar plots
library(ggplot2)
library(ggbeeswarm)
library(here)
#use geom_bar for plotting frequency
plotdata_new%>%
  na.omit%>%
  ggplot(aes(x=year))+
  geom_bar()+
  facet_wrap(~site)
#use geom_col for plotting frequency
plotdata_new%>%
  na.omit%>%
  ggplot(aes(x=year,y=beachbugs))+
  geom_col()+
  facet_wrap(~site)
#checking what geom_col is plotting 
plotdata_new%>%
  na.omit%>%
  group_by(year)%>%
  summarise(totalbeachbugs=sum(beachbugs))
library(tidyverse)
library(dplyr)
plotdata_new%>%
  na.omit%>%
  group_by(year,site)%>%
  summarise(meanbugs=mean(beachbugs))%>%
              ggplot(aes(x=year,y=meanbugs)+
              geom_col()+
                facet_wrap(~site)
#what about error bars
plotdata_new%>%
  na.omit%>%
  group_by(year,site)%>%
  summarise(meanbugs=mean(beachbugs),
            sd=sd(beacbugs),
            n=n(),
            stderr=sd/sqrt(n))%>%
  ggplot(aes(x=site,y=mean))+
  geom_col()+
  coord_flip()+
  geom_errorbar(aes(x=site,ymin=mean-stderr,ymax=mean+stderr))
# correlation/scatter plots
rain<-read.csv(here("rdata folder","rain_temp_beachbugs.csv"))
rain%>%
na.omit()%>%
  filter(beachbugs>500)%>%
  ggplot(aes(x=rain_mm,y=beachbugs,color=temp_airport)+
  geom_point()+
  geom_smooth()
