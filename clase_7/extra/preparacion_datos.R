library(car)
library(dplyr)

head(USPop)
USPop <- rename(USPop, año=year, poblacion=population)
USPop$poblacion <- USPop$poblacion*1e6
head(USPop)

write.csv(USPop, file="~/Downloads/censo_USA.csv", fileEncoding="UTF-8", row.names=FALSE)
                