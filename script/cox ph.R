# Load packages
library(tidyverse)
library(here)
library(survival)
library(survminer)
library()
# read data
dataN<-read.csv(here("rdata folder","coxd.csv"))
names(dataN)
view(dataN)
summary(dataN)
# change "over40" and "MMLevel factors
dataN$over40<-as.factor(dataN$OVER40)
dataN$MisMatch<-as.factor(dataN$MisMatch)
# check a summary
summary(dataN)
# attach the data
attach(dataN)
# COX PROPORTIONAL HAZARD MODEL
library(survival)
cox.mod<-coxph(Surv(TIME,STATUS)~OVER40+ MisMatch+t.score+AGE)
summary(cox.mod)
#hazard ratio=expcoef
# testing the model significance
#concordance[i.e. comparing two individuals to see who has long survival time so  reality=model prediction on there survival rate]
#likelihood ratio test
#wald test
#score(logrank)test
#log rank test (used to test hypothesis i.e. survival distribution of two samples especially in cilinical trials)
#exp(coef)=hazard function
# comparinfg nested models using log rank test(drop mismatch)
cox.mod2<-coxph(Surv(TIME,STATUS)~OVER40)
# do the LRT
anova(cox.mod2,cox.mod,test="LRT")
# how to check linearity( for the model that used NUM X's) 
# MARTINGALE residuals
plot(predict(cox.mod),residuals(cox.mod, type="martingale"),
     xlab="fitted values",ylab="Martingale residuals",main="Residual plots", las=1)
# add a line ax y=residual=0
abline(h=0)
# fit a smoother thru the points
lines(smooth.spline(predict(cox.mod),
                    residuals(cox.mod,type="martingale")),col="red")
# results=nonlinear
# and checking linearity using DEVIANCE residuals
plot(predict(cox.mod),residuals(cox.mod, type="deviance"))
# add a line ax y=residual=0
abline(h=0)
# fit a smoother thru the points
lines(smooth.spline(predict(cox.mod),residuals(cox.mod, type="deviance")),col="red")
# results of graph=nonlinear
# checking proportional hazard assumption
# test for prop hazards using Schoenfeld test for PH
#H0:HAZARDS Are prop
#h1:hazards are not prop
#will return Test fOR EACH X, AND for overall model
cox.zph(cox.mod)
# test if corfficient of variables changes over time
# if it changes over time -> non prop hazard
#(HR changes over time)
# we can see a plot of these as well .,..(one plot for
# each parameter) these are plots of "changes in b 0ver
# time",if we let "b" vary over time recall,...... if "b" varies over time,this 
# means that there is no PH! the effect is constant over time .... it varies!
### pay less attention to the extremes,as line is senstive here...
# so, split screen in 2*1
par(mfrow=c(2,1)) # plot 1 graph per time[1]
plot(cox.zph(cox.mod)[1])
abline(h=0,col=2)
# [dashed lines are confidence interval]
# next
plot(cox.zph(cox.mod)[2])
abline(h=0 , col=2)
