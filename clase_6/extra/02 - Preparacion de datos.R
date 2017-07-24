library(plyr)

house = read.table("http://www.rossmanchance.com/iscam2/data/housing.txt", header = T, sep = "\t")
head(house)

house <- rename(house, c("sqft"="area_m2", "price"="precio", "City"="ciudad", "bedrooms"="habitaciones", "baths"="baños"))
head(house)

house$area_m2 <- round(house$area_m2*0.092903,1)
house$precio <- house$precio*400
head(house)
View(house)

write.csv(house, file="~/Downloads/precios_casas_USA.csv", fileEncoding="UTF-8", row.names=FALSE)
