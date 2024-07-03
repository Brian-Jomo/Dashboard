# data manipulation with dpryl
library(dplyr)
# sample data
Bramack<-tibble(id=1:5,
                name=c("Alice","Bob","Carol","Dave", "Eve"),
                score=c(85,90,88,95,80))
library (tidyverse)
library(here)
#Filter rows where score is greater than 85
filtered_data<- Bramack %>%
  filter(score > 85)
#select specific columns
selected_data<- Bramack%>%
  select(id,score)
# add new column with mutate
mutated_data<- Bramack %>%
  mutate(passed=score>85)
# summarise data
summary_data <-Bramack %>%
  summarize(avg_score=mean(score),
            max_score=max(score))
library (ggplot2)
# sample data
Bramack<-tibble(id=1:5,
                name=c("Alice","Bob","Carol","Dave", "Eve"),
                score=c(85,90,88,95,80))
# Basic scatter plot
ggplot(Bramack,aes(x=id,y=score))
geom_point()
 #Bar plot
ggplot(Bramack,aes(x=id,y=score))
geom_bar(stat="identity")
# tidying data with tidyr
Bramack<-tibble(id=1:5,
                name=c("Alice","Bob","Carol","Dave", "Eve"),
                score=c(85,90,88,95,80))
# convert wide data to long format
long_data <- Bramack %>%
  pivot_longer(cols=starts_with("score"),names_to = "subject", values_to="score")
#spread long data back to wide format
spread_data<-long_data%>%
  pivot_wider(names_from=subject,values_from = score)
write_csv(mutated_data,here("script","mutated_data.csv"))