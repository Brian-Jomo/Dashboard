---
title: "flexdash"
author: "Bramack"
date: "2024-07-01"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r}
library(flexdashboard)
library(tidyverse)
library(here)
```
```{r}

 
library(flexdashboard)
library(ggplot2)
data <- read.csv(here("rdata folder","shndata.csv"))

```
```{r}
 # Verify the data structure
str(data)
ggplot(data, aes(x = factor(1:4), y = Annual_HIV_cohort_reports_generate)) +
  geom_bar(stat = "identity") +
  labs(x = "Quarter", y = "Percentage", title = "Annual HIV Cohort Reports")
ggplot(data, aes(x = factor(1:4), y = National_DQA_reports)) +
  geom_bar(stat = "identity") +
  labs(x = "Quarter", y = "Percentage", title = "National DQA Reports")
 ggplot(data, aes(x = factor(1:4), y = County_specific_DQA_DQI_reports)) +
  geom_bar(stat = "identity") +
  labs(x = "Quarter", y = "Percentage", title = "County-Specific DQA/DQI Reports")
 ggplot(data, aes(x = factor(1:4), y = Enhanced_skills)) +
  geom_bar(stat = "identity") +
  labs(x = "Quarter", y = "Percentage", title = "Enhanced Skills and Capabilities")

```

