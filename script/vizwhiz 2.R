
library(tidyverse)
library(here)
library(ggbeeswarm)
library(dplyr)
# read cleanbeaches data
DISTRICT<-read_csv(here("rdata folder","sydneybeaches.csv"))
glimpse(DISTRICT)
summary(DISTRICT)
filter(name)
# for rename use newname=old
rename<-(PREVALENCE=total Abortion-related services)
DISTRICT
# plotdata

DISTRICT%>%
  ggplot(aes(x=date, y=beachbugs))+
  geom_histogram()

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
# boxes and violins
plotdata %>%
  na.omit%>%
  ggplot(aes(X="score",y="passed"))
geom_boxplot()+
  coord_flip()

plotdata %>%
  na.omit%>%
  ggplot(aes(X="score",y="passed"))
geom_violin()+
  coord_flip()

plotdata %>%
  na.omit%>%
  ggplot(aes(X="score",y="passed"))
geom_boxplot()+
coord_flip()
#filtered for buggier than average for that site=true
plotdata %>%
  na.omit%>%
  filter(score="TRUE")
  ggplot(aes(X="score",y="passed"))
geom_violin()+
  facet_wrap(~score) # separate view of each variable
# histogram
hist(scores$name)

plotdata%>%
  na.omit() %>%
ggplot(aes(x="name"))+
  geom_histogram(binwidth = 1)
  



