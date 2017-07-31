# Curso "Topicos de Especializacion 1"
# Taller 3
# Fecha: 31-07-2017

# Escriba los nombres de los integrantes en el siguiente bloque
# Integrante 1: 
# Integrante 2: 
# Integrante 3: 

#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

library(dplyr)
library(ggplot2)

# El lenguaje R permite construir modelos matemáticos tanto lineales como no lineales

url = "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_7/data/censo_USA.csv"
censo = read.csv(url, fileEncoding="UTF-8")
head(censo)

# Hacemos un gráfico de puntos para visualizar los datos
plot1 <- ggplot(censo, aes(x=año, y=poblacion)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1))
plot1

## Actividad 1
# -----------

# Construya un modelo lineal para predecir el valor de la población usando el año.
# Puede hacer experimentos con diferentes modelos y dejarlos en el script.
# Elija el modelo que considere más correcto y argumente porqué

## Actividad 2
# -----------

# Construya un modelo no lineal para predecir el valor de la población usando el año.
# Siga el ejemplo del modelo no linea basado en el modelo de logistic growth

