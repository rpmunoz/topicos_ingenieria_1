#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

#Cargamos las librerias ggplot2 y dplyr
library(ggplot2)
library(dplyr)
library(cluster)

# Leer archivo desde la web
url <- "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_8/data/vinos_analisis_quimico.csv"
vinos <- read.csv(url, fileEncoding="UTF-8")
View(vinos)

# En todo proceso de análisis multidimensial, es importante que normalizemos las variables
# Para ello se emplea la función scale
vinos.stand <- scale(vinos)

# La función kmeans permite hacer análisis de agrupaciones o clustering de datos.
# El parámetro de input, k, corresponde al número de grupos
# Guardamos el resultado en la variable k.means.fit
k.means.fit <- kmeans(vinos.stand, 2)

# Podemos ver los parámetros que contiene la variable k.means.fit
attributes(k.means.fit)

# El atributo cluster corresponde al Id único del cluster que se le asigna a cada elemento de la tabla
k.means.fit$cluster

# El atributo centers corresponde al valor central de cada uno de los grupos
k.means.fit$centers

# También es posible ver el número de elementos en cada grupo
k.means.fit$size

# Una pregunta interesante es saber cuál es el valor óptimo para el parámetro k
# Una regla es escoger un número de clusters de tal manera que al agregar otro cluster los resultados del modelo no mejoran
# Uno puede graficar el porcentaje de la varianza que es explicado por el número de clusters vs el número de clusters
# El primer cluster aportará gran cantidad de información (alta varianza), pero en algún punto la ganancia será marginal

wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Número de clusters",
       ylab="Suma desviaciones cuadráticas dentro de grupos")}

wssplot(vinos.stand, nc=6) 

clusplot(vinos.stand, k.means.fit$cluster, main='2D representation of the Cluster solution',
         color=TRUE, shade=TRUE,
         labels=2, lines=0)
