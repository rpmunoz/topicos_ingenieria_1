# Curso "Topicos de Especializacion 1"
# Taller 3
# Fecha: 28-08-2017

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
# Elimine cualquier fila (registro) que contenga al menos un valor ausente y actualice la tabla estudiantes

# 2. Aplique la funcion scale() solamente a las columnas basketball hacia adelante (rango de columnas [5:40])
# Puede definir la variable estudiantes_features que contendrá solamente estas columnas.
# Puede usar la función lapply() y también as.data.frame(). Guarde esta matriz de normalizacion como estudiantes.norm

# 3. Indique el rango de valores de la columan basketball en la matriz estudiantes.norm y explique qué método o función
# aplicó la funcion scale() sobre el conjunto de datos.

# 4. Use la variable estudiantes.norm y haga un análisis de K-means usando la función kmeans()

# 5. Determine cuál es el número óptimo de clusters y justifique su respuesta

# 6. Use la función par() y pie() para hacer gráficos de torta para cada uno de los clusters que identificó anteriormente.
# Apóyese en las siguientes líneas de código, reemplace los ... por un número valido y repita cuantas veces quiera
par(mfrow=c(...,...))
pie(colSums(estudiantes_features[estudiantes_clusters$cluster==...]),cex=0.5)

# 7. Indifique cada uno de los clusters anteriores con algún nombre que usted estime conveniente.
# ¿Porqué la información de estos clusters sería relevante?
