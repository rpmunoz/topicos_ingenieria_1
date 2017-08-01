# Curso "Topicos de Especializacion 1"
# Taller 2
# Fecha: 31-07-2017

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
url <- "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_7/data/precios_casas_USA.csv"
casas <- read.csv(url, fileEncoding="UTF-8")
View(casas)

# Con el fin de conocer las relaciones existentes entre cada par de variables podemos representar
# una matriz de diagramas de dispersiÃ³n.
pairs(casas)

# TambiÃ©n es posible modificar el comportamiento del panel inferior del diagrama e imprimir los valores
# de correlaciÃ³n
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {
  usr <- par("usr")
  on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- cor(x, y)
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  text(0.5, 0.5, txt)
}

attach(casas)
pairs(cbind(precio, area_m2, habitaciones, baÃ±os), lower.panel = panel.cor, pch = 18)

# Actividad 1
# -----------

# 1. Construya un modelo de regresión lineal usando la columna precio como valor dependiente (Y)
# y las siguientes variables como predictoras. Para cada una de las siguiente letras construya
# un modelo lineal, imprima un resumen del modelo y determine el coeficiente de correlación
#
# A) Considere solamente la columna area_m2
# B) Considere solamente la columna habitaciones
# C) Considera de manera simultánea las columnas area_m2 y habitaciones

# 2. De acuerdo a los resultados de la anterior pregunta, determine cuál fue el mejor modelo
# que construyó

# 3. Experimente aplicando operaciones lineales sobre las variables predictoras presentadas en
# la pregunta 1 y proponga un nuevo modelo lineal. Puede crear nuevas columnas o aplicar directamente
# funciones sobre columnas ya existentes.


