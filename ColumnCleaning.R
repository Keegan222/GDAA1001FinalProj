# Convert column types

data2$P_ISEV <- as.factor(data2$P_ISEV)   # 3 target factors, no injury, injury, and fatality


data2$C_MNTH <- as.factor(data2$C_MNTH)
data2$C_WDAY <- as.factor(data2$C_WDAY)
data2$C_HOUR <- as.factor(data2$C_HOUR)
# C_VEHS stays numeric
data2$C_CONF <- as.factor(data2$C_CONF) #C_CONF needs grouping
data2$C_RCFG <- as.factor(data2$C_RCFG)  # consider grouping
data2$C_WTHR <- as.factor(data2$C_WTHR) # consider grouping
data2$C_RSUR <- as.factor(data2$C_RSUR) # consider grouping
data2$C_RALN <- as.factor(data2$C_RALN) # consider grouping
data2$C_TRAF <- as.factor(data2$C_TRAF) # consider grouping
data2$V_TYPE <- as.factor(data2$V_TYPE)
data2$V_YEAR <- as.factor(data2$V_YEAR)
data2$P_SEX <- as.factor(data2$P_SEX)
data2$P_AGE <- as.numeric(data2$P_AGE)
data2$P_PSN <- as.factor(data2$P_PSN)
data2$P_USER <- as.factor(data2$P_USER)

# Rename the variables using the alias
names(data2) <- c("Month", "Weekday", "Hour", "Vehicles", 
                            "Confidence", "RoadConfig", "Weather", "RoadSurface", 
                            "RoadAlignment", "Traffic", "VehicleType", 
                            "VehicleYear", "PersonSex", "PersonAge", 
                            "PersonPosition", "IncidentSeverity", "UserType")


# Grouping the categorical variables
grouped_data <- data2 %>%
  group_by(Month, Weekday, Hour, Vehicles, Confidence, RoadConfig, Weather, RoadSurface, 
           RoadAlignment, Traffic, VehicleType, VehicleYear, PersonSex, PersonAge, 
           PersonPosition, IncidentSeverity, UserType)


# Randomly sample 5000 rows from the grouped data
sampled_data <- data2 %>%
  sample_n(5000, replace = FALSE)

# Check the structure of the sampled data
str(sampled_data)

