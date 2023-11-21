#library(dplyr)

data <- X2019_dataset_en
as.factor(data$C_WTHR)
(filter(data$C_WTHR==1))
summarise(data$C_WTHR)
data %>%
  group_by(C_WTHR) %>%
  summarise(count = length(C_WTHR))

data %>%
  group_by(C_RALN) %>%
  summarise(count = length(C_RALN))

