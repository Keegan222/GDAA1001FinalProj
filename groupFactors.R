# 4 groups for variable C_CONF

data_clean <- data2 %>%
  mutate(numCars = (ifelse(data2$C_CONF <= 10, 'Single Vehicle',
                           ifelse(data2$C_CONF>20 & data2$C_CONF <30, '2 Vehicles',
                                  ifelse(data2$C_CONF>30 & data2$C_CONF<40,'2 Vehicles Head On','2 Vehicles Parked')))))



