# Curso "Topicos de Especializacion 1"
# Taller 3
# Fecha: 21-08-2017

# Escriba los nombres de los integrantes en el siguiente bloque
# Integrante 1: 
# Integrante 2: 
# Integrante 3: 

#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

#Cargamos las librerias ggplot2 y dplyr
library(ggplot2)
library(dplyr)
library(cluster)

# Leer archivo desde la web
url <- "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_8/data/redes_sociales_estudiantes_USA.csv"
estudiantes <- read.csv(url, fileEncoding="UTF-8")
View(estudiantes)