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

# Esta tabla contiene información del uso de redes sociales de 30.000 estudiantes de USA
# Se eligieron las 36 palabras que fueron repetidas multiples veces en las publicaciones
# Las palabras incluyen football, sexy, kissed, bible, shopping, death, and drugs.
# El valor de cada columna corresponde al numoer de veces que aparece cada valor

# Actividad 1
# -----------
#
# 1. Determine el número de valores ausentes que existe en cada columna.
# Elimine cualquier fila (registro) que contenga al menos un valor ausente y reemplace antigua tabla estudiantes

# 2. Aplique la funcion scale() solamente a las columnas basketball hacia adelante (rango de columnas [5:40])
# Puede usar la función lapply() y también as.data.frame(). Guarde esta matriz de normalizacion como estudiantes.stand

# 3. Use la variable anteriormente calculada estudiantes.stand y haga un análisis de K-means usando la función kmeans()

# 4. Determine el número óptimo de clusters. Justifique su respuesta

# 5. Use la función par() y pie() para hacer gráficos de torta para cada uno de los clusters que identificó anteriormente.
# Repita cuantas veces quiera la lineas de abajo
par(mfrow=c(X,Y))
pie(colSums(interests[teen_clusters$cluster==1,]),cex=0.5)
