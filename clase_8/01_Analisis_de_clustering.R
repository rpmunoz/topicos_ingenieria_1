#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

#Cargamos las librerias ggplot2 y dplyr
library(ggplot2)
library(dplyr)

# Leer archivo desde la web
url <- "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_8/data/vinos_analisis_quimico.csv"
vinos <- read.csv(url, fileEncoding="UTF-8")
View(vinos)

# En todo proceso de análisis multidimensial, es importante que normalizemos las variables
# Para ello se emplea la función scale
vinos.stand <- scale(vinos)

# La función kmeans permite hacer análisis de agrupaciones o clustering de datos.
# El parámetro de input corresponde al número de grupos
k.means.fit <- kmeans(vinos.stand, 2)