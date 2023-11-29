
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


data2 <- data2 %>%
  select(-c(C_CONF))

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

# Assign names for road config
data2 <- data2 %>% 
  mutate(C_RCFG = recode(C_RCFG,
                         "1" = "Non-Intersection",
                         "2" = "Intersection - 2 public roadways",
                         "3" = "Intersection - parking, driveway etc.",
                         "4" = "Railroad level crossing",
                         "5" = "Bridge, overpass, viaduct",
                         "6" = "Tunnel or underpass",
                         "7" = "Passing or climbing lane",
                         "8" = "Ramp",
                         "9" = "Traffic circle",
                         "10" = "Express lane of a freeway",
                         "11" = "Collector lane of a freeway",
                         "12" = "Transfer lane of a freeway"))

# Assign names for road surfaces

data2 <- data2 %>% 
  mutate(C_RSUR = recode(C_RSUR,
                         "1" = "Dry, normal",
                         "2" = "Wet",
                         "3" = "Snow",
                         "4" = "Slush, wet snow",
                         "5" = "Icy",
                         "6" = "Sand/gravel/dirt",
                         "7" = "Muddy",
                         "8" = "Oil",
                         "9" = "Flooded"))

# Assign names for road alignment

data2 <- data2 %>% 
  mutate(C_RALN = recode(C_RALN,
                         "1" = "Straight and level",
                         "2" = "Straight with gradient",
                         "3" = "Curved and level",
                         "4" = "Curved with gradient",
                         "5" = "Top of hill or gradient",
                         "6" = "bottom of hill or gradient"))

# assign names for traffic config

data2 <- data2 %>% 
  mutate(C_TRAF = recode(C_TRAF,
                         "1" = "Traffic signals fully operational",
                         "2" = "Traffic signals in flashing mode",
                         "3" = "Stop sign",
                         "4" = "Yield sign",
                         "5" = "Warning sign",
                         "6" = "Pedestrian crosswalk",
                         "7" = "Police officer",
                         "8" = "School guard, flagman",
                         "9" = "School crossing",
                         "10" = "Reduced speed zone",
                         "11" = "No passing zone sign",
                         "12" = "Marking on the road",
                         "13" = "School bus - signal lights flashing",
                         "14" = "School bus - signal lights not flashing",
                         "15" = "Railway crossing with signals, gates",
                         "16" = "Railway crossing with signs only",
                         "17" = "Control device not specified",
                         "18" = "No control present"))

# assign names for vehicle types

data2 <- data2 %>% 
  mutate(V_TYPE = recode(V_TYPE,
                         "1" = "Light duty vehicle",
                         "5" = "Panel/cargo van",
                         "6" = "Other trucks and vans",
                         "7" = "Unit trucks > 4536 kg",
                         "8" = "Road tractor",
                         "9" = "School bus",
                         "10" = "Smaller school bus",
                         "11" = "Urban and intercity bus",
                         "14" = "Motorcycle and moped",
                         "16" = "Off road vehicles",
                         "17" = "Bicycle",
                         "18" = "Purpose-built motorhome",
                         "19" = "Farm equipment",
                         "20" = "Construction equipment",
                         "21" = "Fire engine",
                         "22" = "Snowmobile",
                         "23" = "Streetcar"))


# assign names for person position

data2 <- data2 %>% 
  mutate(P_PSN = recode(P_PSN,
                        "11" = "Driver",
                        "12" = "Front row, center",
                        "13" = "Front row, right outboard",
                        "21" = "Second row, left outboard",
                        "22" = "Second row, center",
                        "23" = "Second Row, right outboard",
                        "31" = "Third row, left outboard",
                        "32" = "Third row, center",
                        "33" = "Third row, right outboard",
                        "96" = "Position unknown, but on-board",
                        "97" = "Sitting on someone's lap",
                        "98" = "Outside passenger compartment",
                        "99" = "Pedestrian"))



# assign names for person user

data2 <- data2 %>% 
  mutate(P_USER = recode(P_USER,
                         "1" = "Motor vehicle driver",
                         "2" = "Motor vehicle passenger",
                         "3" = "Pedestrian",
                         "4" = "Bicyclist",
                         "5" = "Motorcyclist"))







names(data2) <- c("Month", "Weekday", "Hour", "Vehicles", 
                   "RoadConfig", "Weather", "RoadSurface", 
                  "RoadAlignment", "Traffic", "VehicleType", 
                  "VehicleYear", "PersonSex", "PersonAge", 
                  "PersonPosition", "InjurySeverity", "UserType","CollisionType")




  
#=======
# Rename the variables using the alias
names(data2) <- c("Month", "Weekday", "Hour", "Vehicles", "RoadConfig", "Weather", "RoadSurface", 
                            "RoadAlignment", "Traffic", "VehicleType", 
                            "VehicleYear", "PersonSex", "PersonAge", 
                            "PersonPosition", "InjurySeverity", "UserType", "collisionType")

# Grouping the categorical variables
grouped_data <- data2 %>%
  group_by(Month, Weekday, Hour, Vehicles, RoadConfig, Weather, RoadSurface, 
           RoadAlignment, Traffic, VehicleType, VehicleYear, PersonSex, 
           PersonPosition, InjurySeverity, UserType)

# Create 3 equally sized subsets of our data containing the 3 factors of our target variable


fatalSet <- data2 %>%
  filter(InjurySeverity == "Fatality") %>%
  sample_n(900)

injurySet <- data2 %>%
  filter(InjurySeverity == "Injury") %>%
  sample_n(900)

noInjurySet <- data2 %>%
  filter(InjurySeverity == "No injury") %>%
  sample_n((900))

# Bind the three sets together to create the sampled data set

sampled_data <- bind_rows(fatalSet,injurySet,noInjurySet, .id = NULL)



# Randomly sample 5000 rows from the grouped data
#sampled_data <- data2 %>%
#  sample_n(5000, replace = FALSE)

# Check the structure of the sampled data
str(sampled_data)

#>>>>>>> 30dd258dd1b5a422ca4b791416270f4e8f4597c7
