library(dplyr)
library(ggplot2)

file="data/home_data.csv"
casas=read.csv(file, fileEncoding="UTF-8")

head(casas)

casas <- select(casas, date, price, bedrooms, bathrooms, sqft_living, sqft_lot, floors, yr_built, zipcode)
casas <- rename(casas, fecha=date, precio=price, habitaciones=bedrooms, baños=bathrooms, area_m2_util=sqft_living, area_m2_construida=sqft_lot, pisos=floors, año_construida=yr_built, codigo_postal=zipcode)
casas$area_m2_util <- round(casas$area_m2_util*0.092903,1)
casas$area_m2_construida <- round(casas$area_m2_construida*0.092903,1)
casas$precio <- casas$precio*500
casas$fecha <- as.Date(casas$fecha, "%Y%m%d")

head(casas)
write.csv(casas, file="data/venta_casas.csv", fileEncoding="UTF-8", row.names=FALSE)

                