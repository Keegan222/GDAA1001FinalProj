library(dpylr)
library(plyr)

data <- X2019_dataset_en


data2 <- data %>%
  filter(C_MNTH!="UU",C_MNTH!="XX") %>%
  filter(C_WDAY!="U") %>% 
  filter(C_HOUR!="UU") %>%
  filter(C_VEHS!="UU",C_VEHS!="XX") %>%
  filter(C_CONF!="QQ",C_CONF!="UU",C_CONF!="XX") %>%
  filter(C_RCFG!="QQ",C_RCFG!="UU",C_RCFG!="XX") %>% 
  filter(C_WTHR!="U",C_WTHR!="X",C_WTHR!="Q") %>% 
  filter(C_RSUR!="U",C_RSUR!="X",C_RSUR!="Q") %>%
  filter(C_RALN!="U",C_RALN!="X") %>%
  filter(C_TRAF!="QQ",C_TRAF!="UU",C_TRAF!="XX") %>%
  filter(V_TYPE!="NN",V_TYPE!="QQ",V_TYPE!="UU",V_TYPE!="XX") %>%
  filter(V_YEAR!="NNNN",V_YEAR!="UUUU",V_YEAR!="XXXX") %>%
  filter(P_SEX!="N",P_SEX!="U",P_SEX!="X") %>%
  filter(P_AGE!="NN",P_AGE!="UU",P_AGE!="XX") %>%
  filter(P_PSN!="NN",P_PSN!="QQ",P_PSN!="UU",P_PSN!="XX") %>%
  filter(P_USER!="U")


count(data2$C_MNTH)
count(data2$C_WDAY)
count(data2$C_HOUR)
count(data2$C_VEHS)
count(data2$C_CONF)
count(data2$C_RCFG)
count(data2$C_WTHR)
count(data2$C_RSUR)
count(data2$C_RALN)
count(data2$C_TRAF)
count(data2$V_TYPE)
count(data2$V_YEAR)
count(data2$P_SEX)
count(data2$P_AGE)
count(data2$P_PSN)
count(data2$P_USER)
