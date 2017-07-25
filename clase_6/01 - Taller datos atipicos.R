# Curso "Topicos de Especializacion 1"
# Taller 1
# Fecha: 17-07-2017

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

# Leer archivo desde la web
url <- "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_6/data/INE_situacion_fuerza_de_trabajo_missing.csv"
trabajo <- read.csv(url, fileEncoding="UTF-8")
View(trabajo)

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

# Actividad 1
# -----------

# 1. Analice toda las columnas del dataframe trabajo. Indique el número de valores perdidos y el porcentaje
# que representa de cada columna. Identifique los indices e imprima los indices de los valores perdidos de cada columna.

# 2. Corrija los valos perdidos de las columnas Fecha, Año y Mes de manera manual.

# 3. Analice las columnas Fuerza.de.trabajo y Desocupados.total y cree un modelo lineal de los datos
# usando la columna Fecha en el eje X. Puede usar Polinomios o Splines. Grafique sus resultados

# 4. Inditifique los valores atípicos de las columnas Fuerza.de.trabajo y Desocupados.total.
# Reemplace estos valores por NA y vuelva a construir los modelos

# 5. Use los modelos anteriormente construidos y complete todos los valores perdidos y outliers
# del dataframe trabajo usando la función predict de R

# Actividad 2
# -----------

# 1. Una vez reparadao el dataframe trabajo, cree una nueva columna llamada Tasa.desempleo que corresponda
# a la división entre las columnas Desocupados.total y Fuerza.de.trabajo

# 2. Cree un modelo que permita predecir la columna Tasa.desempleo como función de la Fecha. Use este modelo
# para predecir la tasa de desempleo para los meses de Marzo y Abril del 2017.

# 3. Use el archivo publicado por el Instituto Nacional de estadísticas y compare la estimación que usted hizo
# Marzo y Abril del 2017 con los valores reales. Use las dos siguientes líneas para recuperar los valores reales.
url_ine <- "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/prueba_1/data/INE_situacion_fuerza_de_trabajo.csv"
trabajo_ine <- read.csv(url_ine, fileEncoding="UTF-8")