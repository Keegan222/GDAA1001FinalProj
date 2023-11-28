
# Group column before converting to factor

data2 <- data2 %>%
  mutate(numCars = (ifelse(data2$C_CONF <= 10, 'Single Vehicle',
                           ifelse(data2$C_CONF>20 & data2$C_CONF <30, '2 Vehicles',
                                  ifelse(data2$C_CONF>30 & data2$C_CONF<40,'2 Vehicles Head On','2 Vehicles Parked')))))


# Convert column types

data2$P_ISEV <- as.factor(data2$P_ISEV)   # 3 target factors, no injury, injury, and fatality
data2$C_MNTH <- as.factor(data2$C_MNTH)
data2$C_WDAY <- as.factor(data2$C_WDAY)
data2$C_HOUR <- as.numeric(data2$C_HOUR)
# C_VEHS stays numeric
data2$C_CONF <- as.factor(data2$C_CONF) #C_CONF needs grouping
data2$C_RCFG <- as.factor(data2$C_RCFG)  # consider grouping
data2$C_WTHR <- as.factor(data2$C_WTHR) # consider grouping
data2$C_RSUR <- as.factor(data2$C_RSUR) # consider grouping
data2$C_RALN <- as.factor(data2$C_RALN) # consider grouping
data2$C_TRAF <- as.factor(data2$C_TRAF) # consider grouping
data2$V_TYPE <- as.factor(data2$V_TYPE)
data2$V_YEAR <- as.numeric(data2$V_YEAR)
data2$P_SEX <- as.factor(data2$P_SEX)
data2$P_AGE <- as.numeric(data2$P_AGE)
data2$P_PSN <- as.factor(data2$P_PSN)
data2$P_USER <- as.factor(data2$P_USER)
data2$numCars <- as.factor(data2$numCars)

#<<<<<<< HEAD


#data2 <- data2 %>%
#  select(-c(C_CONF))

#Assign names for Injury Severity
data2 <- data2 %>% 
  mutate(P_ISEV = recode(P_ISEV,
                         "1" = "No injury",
                         "2" = "Injury",
                         "3" = "Fatality"))

#Assign names for months
data2 <- data2 %>% 
  mutate(C_MNTH = recode(C_MNTH,
                        "1" = "Jan",
                        "2" = "Feb",
                        "3" = "Mar",
                        "4" = "Apr",
                        "5" = "May",
                        "6" = "Jun",
                        "7" = "Jul",
                        "8" = "Aug",
                        "9" = "Sep",
                        "10" = "Oct",
                        "11" = "Nov",
                        "12" = "Dec"))

#Assign names for weekdays
data2 <- data2 %>% 
  mutate(C_WDAY = recode(C_WDAY,
                        "1" = "Mon",
                        "2" = "Tue",
                        "3" = "Wed",
                        "4" = "Thu",
                        "5" = "Fri",
                        "6" = "Sat",
                        "7" = "Sun"))

#Assign names for weather
data2 <- data2 %>% 
  mutate(C_WTHR = recode(C_WTHR,
                         "1" = "Clear & sunny",
                         "2" = "Cloudy, no precipitation",
                         "3" = "Raining",
                         "4" = "Snowing",
                         "5" = "Freezing rain, sleet, hail",
                         "6" = "Visibility limitation",
                         "7" = "Strong wind"))


names(data2) <- c("Month", "Weekday", "Hour", "Vehicles", "CollisionConfig", 
                   "RoadConfig", "Weather", "RoadSurface", 
                  "RoadAlignment", "Traffic", "VehicleType", 
                  "VehicleYear", "PersonSex", "PersonAge", 
                  "PersonPosition", "InjurySeverity", "UserType","CollisionType")




  
#=======
# Rename the variables using the alias
names(data2) <- c("Month", "Weekday", "Hour", "Vehicles", 
                            "CollisionConfig", "RoadConfig", "Weather", "RoadSurface", 
                            "RoadAlignment", "Traffic", "VehicleType", 
                            "VehicleYear", "PersonSex", "PersonAge", 
                            "PersonPosition", "InjurySeverity", "UserType")

# Grouping the categorical variables
grouped_data <- data2 %>%
  group_by(Month, Weekday, Hour, Vehicles, RoadConfig, Weather, RoadSurface, 
           RoadAlignment, Traffic, VehicleType, VehicleYear, PersonSex, 
           PersonPosition, InjurySeverity, UserType)


# Randomly sample 5000 rows from the grouped data
sampled_data <- data2 %>%
  sample_n(5000, replace = FALSE)

# Check the structure of the sampled data
str(sampled_data)

#>>>>>>> 30dd258dd1b5a422ca4b791416270f4e8f4597c7
