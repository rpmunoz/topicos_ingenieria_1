
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

library(dplyr)

file="data/chile_demographic.csv"

chile = read.csv(file)

chile

chile_region <- group_by(chile, Region)
summarise(chile_region, n_comuna=n())

summarise(chile_region, n_comuna=n(), poblacion=sum(Poblacion))

chile %>%
group_by(Region) %>%
summarise(n_comuna=n(), poblacion=sum(Poblacion))








