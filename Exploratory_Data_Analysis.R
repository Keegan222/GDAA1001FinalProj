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
#install.packages('patchwork')
library(patchwork)

#Install and load hexbin for working with large packages
#install.packages('hexbin')
library(hexbin)

#Creates a "stats" data frame that holds meta statistics about the data (for example, count, mean, etc)
stats <- data.frame
stats <- as.data.frame(summary(data2$Weather), col.names = "count")

#Counts of each category of injury severity for each variable
Count_Month <- count(data2, vars = c('Month','InjurySeverity'))

Count_Weekday <- count(data2, vars = c('Weekday','InjurySeverity'))

#Hour is numeric - figure out how to handle numeric variables later?

#Vehicles is numeric - figure out how to handle numeric variables later?

Count_Weather <- count(data2, vars = c('Weather','InjurySeverity'))

Count_RoadSurface <- count(data2, vars = c('RoadSurface','InjurySeverity'))

Count_RoadAlignment <- count(data2, vars = c('RoadAlignment','InjurySeverity'))

Count_Traffic <- count(data2, vars = c('Traffic','InjurySeverity'))

Count_VehicleType <- count(data2, vars = c('VehicleType','InjurySeverity'))

#VehicleYear is numeric - figure out how to handle numeric variables later?

Count_PersonSex <- count(data2, vars = c('PersonSex','InjurySeverity'))

#PersonAge is numeric - figure out how to handle numeric variables later?

Count_PersonPosition <- count(data2, vars = c('PersonPosition','InjurySeverity'))

Count_UserType <- count(data2, vars = c('UserType','InjurySeverity'))

Count_collisionType <- count(data2, vars = c('collisionType','InjurySeverity'))

#Some experimental GGplots (will clean up/fix later)

InjurySeverity.colors <- c('Fatality' = 'brown1', 'Injury' = 'darkgoldenrod1', 'No injury' = 'darkseagreen4')

#Month
monthHist <- ggplot(data2, aes(x=Month,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)+

#Weekday
weekdayHist <- ggplot(data2, aes(x=Weekday,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#Hour
hourHist <- ggplot(data2, aes(x=Hour,fill=InjurySeverity))+
  geom_histogram(bins=24)+
  scale_fill_manual(values=InjurySeverity.colors)

#Vehicles
numVehiclesHist <- ggplot(data2, aes(x=Vehicles,fill=InjurySeverity))+
  geom_histogram(bins=24)+
  scale_fill_manual(values=InjurySeverity.colors)

#RoadConfig
roadConfigHist <- ggplot(data2, aes(x=RoadConfig,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#Weather
weatherHist <- ggplot(data2, aes(x=Weather,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#RoadSurface
roadSurfaceHist <- ggplot(data2, aes(x=RoadSurface,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#RoadAlignment
roadAlignmentHist <- ggplot(data2, aes(x=RoadAlignment,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#Traffic
trafficHist <- ggplot(data2, aes(x=Traffic,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#VehicleType
vehTypeHist <- ggplot(data2, aes(x=VehicleType,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#VehicleYear
vehYearHist <- ggplot(data2, aes(x=VehicleYear,fill=InjurySeverity))+
  geom_histogram(bins=100)+
  scale_fill_manual(values=InjurySeverity.colors)

#PersonSex
sexHist <- ggplot(data2, aes(x=PersonSex,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#PersonAge
ageHist <- ggplot(data2, aes(x=PersonAge,fill=InjurySeverity))+
  geom_histogram()+
  scale_fill_manual(values=InjurySeverity.colors)

#PersonPosition
ggplot(data2, aes(x=PersonPosition,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#UserType
ggplot(data2, aes(x=UserType,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#collisionType
ggplot(data2, aes(x=collisionType,fill=InjurySeverity))+
  geom_histogram(stat="count")+
  scale_fill_manual(values=InjurySeverity.colors)

#Histograms for time/day/month
timeHists <- monthHist+weekdayHist+hourHist & theme(legend.position = "bottom")
timeHists + plot_layout(guides = "collect")

#Histograms for demographics
demoHists <- sexHist + ageHist & theme(legend.position = "bottom")
demoHists + plot_layout(guides = "collect")

#Histograms for road & weather conditions
weatherRoadCondHists <- weatherHist + roadSurfaceHist & theme(legend.position = "bottom")
weatherRoadCondHists + plot_layout(guides = "collect")

#Histograms for vehicle info
vehicleInfoHists <- vehTypeHist + vehYearHist & theme(legend.position = "bottom")
vehicleInfoHists + plot_layout(guides = "collect")

#Histograms for road info
roadInfoHists <- roadAlignmentHist + trafficHist + roadConfigHist & theme(legend.position = "bottom")
roadInfoHists + plot_layout(guides = "collect")

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



Count_Month %>%
  filter(InjurySeverity == "Fatality") %>%
  ggplot(aes(x=Month,y=freq,fill=InjurySeverity))+
           geom_bar(position="dodge",stat="identity")


