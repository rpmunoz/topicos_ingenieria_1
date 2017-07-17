#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

#Cargamos las librerias ggplot2 y dplyr
library(ggplot2)
library(dplyr)

# Leer archivo desde la web
url="https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_5/data/INE_situacion_fuerza_de_trabajo_missing.csv"
trabajo=read.csv(url, fileEncoding="UTF-8")

# Encabezado del dataframe
head(trabajo)

# Resumen y visualizar datos usando una tabla
summary(trabajo)
View(trabajo)

# Revisar columna Fecha y notar que aparecen celdas con conteido vacío
# Notar la frase "85 Levels" al final. Significa que R considero esta columna como varible cualitativa
# y creó etiquetas
trabajo$Fecha
class(trabajo$Fecha)

# Primero notamos que las reconoce como etiquetas y que no las cosidera commo fechas
trabajo$Fecha <- as.character(trabajo$Fecha)
class(trabajo$Fecha)

trabajo$Fecha <- as.Date(trabajo$Fecha, "%y-%m")

ind <- which( trabajo$Fecha == '' )
ind
trabajo[ind,'Fecha']


trabajo[ind,'Fecha']

trabajo$Type <- as.character(fixed$Type)
trabajo[33,'Fecha'] <- "2012-09"
trabajo[50,'Fecha'] <- "2014-02"
trabajo[67,'Fecha'] <- "2015-07"

levels(trabajo$Fecha)[33] <- "2012-09"

trabajo$Año <- factor(trabajo$Año)
trabajo$Mes <- factor(trabajo$Mes, levels = unique(trabajo$Mes))


# Calular porcentaje de datos perdidos
pMiss <- function(x){sum(is.na(x))/length(x)*100}
apply(trabajo,2,pMiss)

ggplot(trabajo, aes(x=Año, y=Fuerza.de.trabajo, color=Año)) +
  geom_boxplot()

ggplot(trabajo, aes(x=Mes, y=Fuerza.de.trabajo, group=Año, color=Año)) +
  geom_line() +
  theme(axis.text.x = element_text(angle=90, hjust=1))

ggplot(trabajo, aes(x=Mes, y=Desocupados.total, group=Año, color=Año)) +
  geom_line() +
  theme(axis.text.x = element_text(angle=90, hjust=1))


