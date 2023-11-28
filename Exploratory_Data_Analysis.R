#Exploratory data analysis for data

#Load required packages
library(tidyverse)
library(RColorBrewer)
library(GGally)
library(data.table)
library(sf)
library(ggspatial)
library(tmap)
library(grid)
library(gridExtra)
library(psych)

#Install and load hexbin for working with large packages
#install.packages('hexbin')
library(hexbin)

#Creates a "stats" data frame that holds meta statistics about the data (for example, count, mean, etc)
stats <- data.frame
stats <- as.data.frame(summary(data2$Weather), col.names = "count")

#Counts of each category of injury severity for each variable
Count_PersonSex <- count(data2, vars = c('PersonSex','InjurySeverity'))

Count_Weather <- count(data2, vars = c('Weather','InjurySeverity'))

Count_Month <- count(data2, vars = c('Month','InjurySeverity'))

Count_VehicleYear <- count(data2, vars = c('VehicleYear','InjurySeverity'))



#Some experimental GGplots (will clean up/fix later)
ggplot(data2, aes(x=Hour,fill= cut(Hour,24)))+
  geom_histogram(bins=24)

ggplot(data2)+
  geom_bar(aes(x=Hour, fill = InjurySeverity), position = "dodge")

ggplot(data2)+
  geom_bar(aes(x=Weather, fill = InjurySeverity), position = "dodge")

ggplot(data2)+
  geom_bar(aes(x=RoadConfig, fill = InjurySeverity), position = "dodge")

ggplot(data2)+
  geom_bar(aes(x=RoadSurface, fill = InjurySeverity), position = "dodge")

ggplot(data2, aes(x=PersonSex, color=PersonSex)) +
  geom_histogram(fill="white", position="dodge")+
  theme(legend.position="top")


