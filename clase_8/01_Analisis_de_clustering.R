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

# Hacemos gráfico de cómo cambia la suma de desviaciones cuadráticas como función del numero de grupos
wssplot(vinos.stand, nc=6) 

# Hacemos un gráfico 2D para visualizar los cluster
clusplot(vinos.stand, k.means.fit$cluster, main='Representación 2D del clustering',
         color=TRUE, shade=TRUE,
         labels=2, lines=0)

# 
url <- "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_8/data/vinos_analisis_quimico_tipos.csv"
vinos_tipos <- read.csv(url, fileEncoding="UTF-8")
View(vinos_tipos)

table(vinos_tipos[,1],k.means.fit$cluster)

# Clustering jerárquico
#
# Se busca construir una jerarquía de grupos. 
# En general, las mezclas y divisiones son determinadas de forma avara (Que una clase se lleve todo).
# Los resultados del agrupamiento jerárquico son usualmente presentados en un dendrograma.

# Los métodos jerárquico usan una matriz de distancia como entrada para el algoritmo de clustering.
# Empleamos una distancia Euclideana
d <- dist(vinos.stand, method = "euclidean")

# La función hclust() permite hacer análisis de cluster basado en un conjunto de disimilitudes
# Se puede emplear el criterio de Ward, que consiste en el decrecimiento en la varianza para los grupos que están siendo mezclados
H.fit <- hclust(d, method="ward.D")

# Hacemos un gráfico del tipo dendograma
plot(H.fit)
# Aplicamos una división en 3 grupos
groups <- cutree(H.fit, k=3)
# Dibujamos el dendograma con los bordes de color rojo marcando los grupos
rect.hclust(H.fit, k=3, border="red") 

# Evaluamos la matriz de confusión
table(vinos_tipos[,1],groups)
