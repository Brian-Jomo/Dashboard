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
skimr(beaches)
select_all(beaches,toupper)
select_all(beaches,tolower)
library(janitor)
clean_names(beaches)
names(beaches)
#  separate names by _
cleanbeaches<-clean_names(beaches)
cleanbeaches
names(cleanbeaches)
#for rename use new name =old name/
cleanbeaches<-rename(cleanbeaches,beachbugs=enterococci_cfu_100ml)
rename(cleanbeaches,beachbugs=Enterococci_cfu_100ml)
#select columns of interest
select(cleanbeaches,beachbugs,council,site)
#select everything after a column of choice
select(cleanbeaches,beachbugs,council,site,everything())
#pipe %>%
cleanbeaches<-beaches%>%
  clean_names()%>%
  summary()
  rename(beachbugs=enterococci_cfu_100ml)
write_csv(cleanbeaches,"cleanbeaches.csv")
#which has the most extreme levels of bugs




worstent<-cleanbeaches %>% arrange(desc(beachbugs))

worstcoogee<-cleanbeaches %>% 
  filter(site=="Coogee Beach")%>%
  arrange(-beachbugs)
#lets compare max bug values across different beaches

cleanbeaches %>%
  filter(site %in% c("Coogle Beach","Bondi Beach"))%>%
  arrange(desc(beachbugs))

cleanbeaches %>%
  filter(site %in% c("Coogle Beach","Bondi Beach"))%>%
  group_by(site)%>%
(summarise(maxbugs=max(beachbugs,na.rm=TRUE),
          meanbugs=Mean(beachbugs,na.rm=TRUE),
          medianbugs=Median(beachbugs,na.rm=TRUE),
          Sd=Sd(beachbugs,na.rm=TRUE)))
#summary for all
cleanbeaches %>%
  group_by(site)%>%
  (summarise(maxbugs=max(beachbugs,na.rm=TRUE),
             meanbugs=Mean(beachbugs,na.rm=TRUE),
             medianbugs=Median(beachbugs,na.rm=TRUE),
             Sd=Sd(beachbugs,na.rm=TRUE)))
# lets compare by council
cleanbeaches %>%
  group_by(council)%>%
  (summarise(maxbugs=max(beachbugs,na.rm=TRUE),
             meanbugs=Mean(beachbugs,na.rm=TRUE),
             medianbugs=Median(beachbugs,na.rm=TRUE),
             Sd=Sd(beachbugs,na.rm=TRUE)))

cleanbeaches %>%
  group_by(site,council)%>%
  (summarise(maxbugs=max(beachbugs,na.rm=TRUE),
             meanbugs=Mean(beachbugs,na.rm=TRUE),
             medianbugs=Median(beachbugs,na.rm=TRUE),
             Sd=Sd(beachbugs,na.rm=TRUE)))
# creating new enviroment
Councilcomparison<-cleanbeaches %>%
  group_by(council)%>%
  (summarise(maxbugs=max(beachbugs,na.rm=TRUE),
             meanbugs=Mean(beachbugs,na.rm=TRUE),
             medianbugs=Median(beachbugs,na.rm=TRUE),
             Sd=Sd(beachbugs,na.rm=TRUE)))
#compute new variables
separate <-glimpse(cleanbeaches)
testdate<-cleanbeaches%>%
  separate(date,c("day","month","year"), remove=TRUE)
#unite function
unite<-cleanbeaches%>%unite(council_site,council:site,remove=TRUE)
#use mutate to transform beachbugs data
summary(cleanbeaches)
plotdata<-cleanbeaches%>%
  mutate(logbeachbugs=log(beachbugs))
#use mutate to computer to compute new logicaL Variable
plotdata<-cleanbeaches%>% 
  mutate(beachbugsdiff=beachbugs-lag(beachbugs))
# use mutate to compute new logical variable
cleanbeaches%>%
  mutate(buggier=beachbugs>mean(beachbugs,na.rm=TRUE))
meanbugs=mean(cleanbeaches$beachbugs,na.rm=TRUE)

#   pipe%>%
plotdata_new<-cleanbeaches%>%
  separate(date,c("day","month","year"),remove=FALSE)%>%
  mutate(logbeachbugs=log(beachbugs))%>%
  mutate(buggier_all=beachbugs>mean(beachbugs,na.rm=TRUE))

plotdata_new%>%
  na.omit%>%
  filter(buggier_all=="TRUE")%>%
  ggplot(aes(x=site,y=logbeachbugs))+
  geom_boxplot()+
  geom_quasirandom(aes(colour=council))+
facet_wrap(~site)+
coord_flip()
ggsave("output",plotdata_new.png")
plotdata_new%>%
  na.omit%>%
  filter(buggier_all=TRUE)%>%
  ggplot(aes(x=site,y=beachbugs))+
  geom_histogram()+
  geom_quasirandom(aes(colour=council))+
facet_wrap(~site)+
coord_flip()

# plotdata
plotdata%>%
  na.omit%>%
  ggplot(aes(x=site,y=logbeachbugs))+
  geom_jitter()+
  geom_quasirandom(aes(colour=council))+
  coord_flip()

  #write cleaned data .csv
write_csv(beaches,here("rdatafolder","plotdata_new.csv"))

