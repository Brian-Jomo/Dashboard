library(tidyverse)
library(dplyr)
library(here)
library(janitor)
library(ggplot2)
library(ggbeeswarm)

survival<-read.csv(here("rdata folder","Survivald.csv"))
library(survival)
library(survminer)
library(flexsurv)
library(rms)
library(cmprsk)
library(mstate)
library(prodlim)
library(pec)
library(ipred)
library(coxed)
# fit the KP model for data
library("survival")
library("survminer")
data<-read.csv(here("rdata folder","survdatao.csv"))
summary(data)
library(skimr)
dim(data)
glimpse(data)
library (janitor)
clean_names()
surv_object<-Surv(time=data$Time,event=data$Death)
km_fit<-survfit(surv_object ~ 1)
print(summary(km_fit))
plot(km_fit,xlab="Time",ylab="Survival Probability", main="Kaplan Meier Survival Curve",col="green")
