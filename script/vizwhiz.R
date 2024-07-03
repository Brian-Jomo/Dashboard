# load packages
library(tidyverse)
library(here)
library(ggbeeswarm)
# read cleanbeaches data
plotdata<-read_csv(here("Environment","plotdata_new.csv"))
# plotdata
plotdata%>%
  ggplot(aes(x=date,y=site))+
  geom_jitter()+
 coord_flip()

# replotting data by geom_jitter
mutated_data%>%
  ggplot(aes(x=name,y=score))+
  geom_jitter()
# replotting by quasirandom
#coerce year to be factor rather that interger
mutated_data$score<-as.factor(mutated_data$score)
#glimpse to check it did the right thing
glipmse(mutated_data)
# facet wrap
mutated_data%>%
  ggplot(aes(x=name,y=score,color=score))+
  geom_jitter()+
  facet_wrap(~ site)
# combining ggplot with filter
mutated_data%>%
  filter(score<80)%>%
  ggplot(aes(x=name,y=score,color=score))+
  geom_point()+
  facet_wrap(~ score)
# incase of missing variable use na.omit()
mutated_data%>%
  na.omit()%>%
  filter(score<80)%>%
  ggplot(aes(x=name,y=score,color=score))+
  geom_point()+
  facet_wrap(~ score)
# when interested in two variables
mutated_data%>%
  na.omit()%>%
  filter(score<80)%>%
  filter(score%IN% c("age","size"))%>%
  ggplot(aes(x=name,y=score,color=score))+
  geom_point()+
  facet_wrap(~ score)
# how to get ggplots out of r..
ggsave(here("output","data name.png"))
  
