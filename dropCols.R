library(readr)
library(dplyr)
data <- read_csv("Data/2019_dataset_en.csv")
good_columns <- data %>%
  select(-c(C_YEAR, C_SEV, V_ID, P_ID, P_SAFE, C_CASE))
