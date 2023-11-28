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

#Install and load hexbin for working with large packages
install.packages('hexbin')
library(hexbin)

ggplot(data2)+
  geom_bar(aes(x=Hour, fill = InjurySeverity), position = "dodge")
