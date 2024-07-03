library(tidyverse)
library(dplyr)
library(here)
bramackd<-read.csv(here("rdata folder","rain_temp_beachbugs.csv"))
# bar plots
library(ggplot2)
library(ggbeeswarm)
library(here)
#use geom_bar for plotting frequency
bramackd%>%
  na.omit%>%
  ggplot(aes(x=date))+
  geom_bar()+
  facet_wrap(~site)
#use geom_col for plotting frequency
bramackd%>%
  na.omit%>%
  ggplot(aes(x=date,y=beachbugs))+
  geom_col()+
  facet_wrap(~site)
#checking what geom_col is plotting 
bramackd%>%
  na.omit%>%
  group_by(date)%>%
  summarise(totalbeachbugs=sum(beachbugs))
library(tidyverse)
library(dplyr)
bramackd%>%
  na.omit%>%
  group_by(date,site)%>%
  summarise(meanbugs=mean(beachbugs))%>%
              ggplot(aes(x=date,y=meanbugs))+
              geom_col()+
                facet_wrap(~site)
#what about error bars
bramackd%>%
  na.omit%>%
  group_by(date,site)%>%
  summarise(meanbugs=mean(beachbugs),
            sd=sd(beacbugs,na.rm=FALSE),
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
  ggplot(aes(x=rain_mm,y=beachbugs,color=temp_airport))+
  geom_point()+
  geom_smooth()
#set ur favourite plot theme.......
theme_set(theme_classic())
rain<-read.csv(here("rdata folder","rain_temp_beachbugs.csv"))
rain%>%
  na.omit()%>%
  filter(beachbugs>500)%>%
  ggplot(aes(x=rain_mm,y=beachbugs,color=temp_airport))+
  geom_point()+
  geom_smooth()
# distinguish variability by colors
theme_set(theme_classic())
rain<-read.csv(here("rdata folder","rain_temp_beachbugs.csv"))
theme_set(theme_classic())
rain%>%
  na.omit()%>%
  filter(beachbugs>500)%>%
  ggplot(aes(x=rain_mm,y=beachbugs,color=temp_airport))+
  geom_point()+
  geom_smooth()
scale_colour_gradient(low="green",high="red")
# use a pallette of setting colors
display.brewer.all()
theme_set(theme_classic())
rain%>%
  na.omit()%>%
  filter(beachbugs>500)%>%
  ggplot(aes(x=rain_mm,y=beachbugs,color=temp_airport))+
  geom_point()+
  geom_smooth()+
scale_colour_distiller(palette="RdYlBu")
# adding titles and changing labels using labs
theme_set(theme_classic())
rain%>%
  na.omit()%>%
  filter(beachbugs>500)%>%
  ggplot(aes(x=rain_mm,y=beachbugs,color=temp_airport))+
  geom_point()+
  geom_smooth()+
  scale_colour_distiller(palette="RdYlBu")+
  labs(title="MEAN ENTEROCCI LEVELS AT EASTERN AT EASTERN
       SUBURBS AS A RESULT OF RAIN AND TEMPERATURES",
       subtitle = "ONLY DAY>500",
       caption="data from https://www.environment.nsw.gov.au/beachapp/
       report_enterococci.aspx",
       x="Rainfall (mm)",
       y="Mean enterococci levels")
library(ggplot2)
library(magick)
library(beepr)
# plot graph for gif
rain%>%
  na.omit()%>%
  filter(beachbugs>500)%>%
  ggplot(aes(x=rain_mm,y=beachbugs,color=temp_airport))+
  geom_point()+
  geom_smooth()+
  scale_colour_distiller(palette="RdYlBu")+
  labs(title="MEAN ENTEROCCI LEVELS AT EASTERN AT EASTERN
       SUBURBS AS A RESULT OF RAIN AND TEMPERATURES",
       subtitle = "ONLY DAY>500",
       caption="data from https://www.environment.nsw.gov.au/beachapp/
       report_enterococci.aspx",
       x="Rainfall (mm)",
       y="Mean enterococci levels")
ggsave("beaches.png")
# find a gif u want and save it as .gif file.read the image file into rstudio
beachplot<-image_read("beaches.png")
wizgif<-image_read("Rplot06.png")
# put the baechplot and wizgif together
frames<-image_composite(beachplot,wizgif,offset="+0+0")
# animate the frames
library(beepr)
animation<-image_animate(frames,fps = 10)
image_write(animation,"beachwiz.gif")