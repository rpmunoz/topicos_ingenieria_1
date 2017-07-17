#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

#Cargamos las librerias ggplot2 y dplyr
library(ggplot2)
library(dplyr)

url="https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_5/data/INE_situacion_fuerza_de_trabajo_missing.csv"
trabajo=read.csv(url, fileEncoding="UTF-8")

head(trabajo)

summary(trabajo)
View(trabajo)

trabajo$Fecha
trabajo$Fuerza.de.trabajo
trabajo$Desocupados.total



ind <- which( trabajo$Fecha == '' )
ind
levels(trabajo[50,'Fecha'])

trabajo$Type <- as.character(fixed$Type)
trabajo[33,'Fecha'] <- "2012-09"
trabajo[50,'Fecha'] <- "2014-02"
trabajo[67,'Fecha'] <- "2015-07"

levels(trabajo$Fecha)[33] <- "2012-09"

trabajo$Año <- factor(trabajo$Año)
trabajo$Mes <- factor(trabajo$Mes, levels = unique(trabajo$Mes))

ggplot(trabajo, aes(x=Año, y=Fuerza.de.trabajo, color=Año)) +
  geom_boxplot()

ggplot(trabajo, aes(x=Mes, y=Fuerza.de.trabajo, group=Año, color=Año)) +
  geom_line() +
  theme(axis.text.x = element_text(angle=90, hjust=1))

ggplot(trabajo, aes(x=Mes, y=Desocupados.total, group=Año, color=Año)) +
  geom_line() +
  theme(axis.text.x = element_text(angle=90, hjust=1))


