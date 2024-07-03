# load packages
library(tidyverse)
library(here)
library(ggbeeswarm)
# read cleanbeaches data
plotdata<-read_csv(here("script","cleanbeaches.csv"))
# plotdata-point
mutated_data%>%
ggplot(aes(x=name,y=score))+
geom_point()
# replotting data by geom_jitter
mutated_data%>%
  ggplot(aes(x=name,y=score))+
  geom_jitter()
# replotting by quasirandom

