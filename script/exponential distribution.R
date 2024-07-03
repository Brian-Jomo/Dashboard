library(survival)
library(tidyverse)
library(survminer)
library(flexsurv)
ovarian<-read.csv("d:/youtube_data/ovarian.csv")
data(ovarian)
data("cancer", package ="survival")
ovarian.sorted<-ovarian[order(ovarian$futime),]
ovarian.sorted$event<-1
# how to get the optimal lambda of exponential distribution
exp(fit1$coefficients)
fit1<-flexsurvreg(Surv(futime, event)~1, data = ovarian.sorted,dist = "exp") 
fit2<-survreg(Surv(futime, event)~1, data = ovarian.sorted, dist = "exp")
exp(-fit2$coefficients)
