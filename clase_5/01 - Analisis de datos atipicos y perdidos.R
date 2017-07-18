#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

#Cargamos las librerias ggplot2 y dplyr
library(ggplot2)
library(dplyr)

# Leer archivo desde la web
url <- "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_5/data/INE_situacion_fuerza_de_trabajo_missing.csv"
trabajo <- read.csv(url, fileEncoding="UTF-8")
trabajo_orig <- trabajo

# Encabezado del dataframe
head(trabajo)

# Resumen y visualización de datos usando una tabla
summary(trabajo)
View(trabajo)

# Revisar columna Fecha y notar que aparecen celdas con contenido vacío
# Notar la frase "85 Levels" al final. Significa que R considero esta columna como varible cualitativa
# y creó etiquetas
trabajo$Fecha
class(trabajo$Fecha)

# Primero notamos que las reconoce como etiquetas y que no las cosidera commo fechas
trabajo$Fecha <- as.Date(trabajo$Fecha, "%Y-%m-%d")
class(trabajo$Fecha)

# Volvemos a imprimir un resumen del dataframe
summary(trabajo)

# Existen múltiples maneras de identificar y corregir valores perdidos

# 1. Usar funciones simples para determinar el procentaje de los valores perdidos en cada columna

# Creamos la funcion pMiss para determinar el porcentaje de valores perdidos respecto al total
pMiss <- function(x) { round(sum(is.na(x))/length(x)*100, digits=2) }
apply(trabajo,2,pMiss)

# 1.1 Analizamos la columna Fecha
# Buscamos las Fechas que contienen valores NA, los cuales corresponden a valores perdidos
ind <- which( is.na(trabajo$Fecha) )
ind
trabajo[ind,'Fecha']

# Hacemos reemplazo manual de los valores de Fecha
trabajo[4,'Fecha'] <- "2010-04-01"
trabajo[33,'Fecha'] <- "2012-09-01"
trabajo[50,'Fecha'] <- "2014-02-01"
trabajo[67,'Fecha'] <- "2015-07-01"

# 1.2 Analizamos la columna Fuerza.de.trabajo
# Buscas los valores de Fuerza.de.trabajo que contienen valores NA
summary(trabajo$Fuerza.de.trabajo)

ind <- which( is.na(trabajo$Fuerza.de.trabajo) )
ind
trabajo[ind,'Fuerza.de.trabajo']

# ¿Es posible reemplazar los valores así de fácil como lo hicimos con Fecha?

# A) Una laternativa es simplemente reemplazar esos valores NA con el promedio o mediana de la columna
trabajo$Fuerza.de.trabajo <- trabajo_orig$Fuerza.de.trabajo

mean(trabajo$Fuerza.de.trabajo)
# Entrega NA pues la función mean por defecto entrega NA cuando un valor tiene NA
mean(trabajo$Fuerza.de.trabajo, na.rm=TRUE)
# Reemplazar los valores usando el promedio
trabajo[ind,'Fuerza.de.trabajo'] <- mean(trabajo$Fuerza.de.trabajo, na.rm=TRUE)
summary(trabajo$Fuerza.de.trabajo)

# B) Otra alternativa es usar un modelo predictivo
trabajo$Fuerza.de.trabajo <- trabajo_orig$Fuerza.de.trabajo

# Hacemos un gráfico de línea usando Fecha y Fuerza.de.trabajo
plot1 <- ggplot(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo)) +
  geom_line() +
  theme(axis.text.x = element_text(angle=90, hjust=1))
plot1

lmfit <- lm(Fuerza.de.trabajo ~ Fecha, data=trabajo)
# Otra manera es usar explicitamente las columnas
# lmfit <- lm(trabajo$Fuerza.de.trabajo ~ ., data = subset(trabajo, select=Fecha))

trabajo$Fuerza.de.trabajo.predict <- predict(lmfit, newdata=trabajo)
plot1 + geom_line(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo.predict), linetype="dashed", color="red")

# ggplot incorpora una función para graficar rápidamente un modelo
ggplot(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo)) +
  geom_line() +
  geom_smooth(method = "lm", linetype="dashed", color="red", se = FALSE)
  theme(axis.text.x = element_text(angle=90, hjust=1))

# ¿Cuan bueno es el ajuste del modelo y = a + b*x?
summary(lmfit)

# Podriamos usar un polinomio de grado 3
lmfit <- lm(Fuerza.de.trabajo ~ poly(Fecha,3), data=trabajo)

trabajo$Fuerza.de.trabajo.predict <- predict(lmfit, newdata=trabajo)
plot1 + geom_line(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo.predict), linetype="dashed", color="red")

# También podriamos usar 
library(splines)

# Usar splines del tipo cúbicas
splinefit = lm(Fuerza.de.trabajo ~ ns(Fecha, knot=median(Fecha)), data=trabajo)

trabajo$Fuerza.de.trabajo.predict <- predict(splinefit, newdata=trabajo)
plot2 <- plot1 + geom_line(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo.predict), linetype="dashed", color="red")
plot2

# Usar splines con grado 5
splinefit = lm(Fuerza.de.trabajo ~ bs(Fecha, df=5), data=trabajo)
summary(splinefit)

trabajo$Fuerza.de.trabajo.predict <- predict(splinefit, newdata=trabajo)
plot1 + geom_line(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo.predict), linetype="dashed", color="red")

# Cuando el modelo sea satisfactorio, entonces reemplazamos los valores NA de Fuerza.de.trabajo usando la columna predict
trabajo[ind,'Fuerza.de.trabajo'] <- trabajo[ind,'Fuerza.de.trabajo.predict']

# 1.3 Notamos que existen dos valores atípicos en Fuerza.de.trabajo

rms <- sqrt( sum(resid(splinefit)^2)/(length(resid(splinefit))) )
ind <- which(abs(trabajo$Fuerza.de.trabajo - trabajo$Fuerza.de.trabajo.predict) > 3*rms)
ind
trabajo[ind,'Fuerza.de.trabajo']

plot3 <- plot2 + geom_point(data=trabajo[ind,], aes(x=Fecha, y=Fuerza.de.trabajo), color="Blue")
plot3

# Una solución es definirlos como NA y leguo construir modelos
trabajo$Fuerza.de.trabajo <- trabajo_orig$Fuerza.de.trabajo
trabajo[ind,'Fuerza.de.trabajo']=NA

splinefit <- lm(Fuerza.de.trabajo ~ bs(Fecha, df=5), data=trabajo)
summary(splinefit)

trabajo$Fuerza.de.trabajo.predict <- predict(splinefit, newdata=trabajo)
plot1 <- ggplot(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo)) +
  geom_line() +
  theme(axis.text.x = element_text(angle=90, hjust=1))
plot2 <- plot1 + geom_line(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo.predict), linetype="dashed", color="red")
plot2

ind <- which(is.na(trabajo$Fuerza.de.trabajo))
ind
trabajo[ind,'Fuerza.de.trabajo'] <- trabajo[ind,'Fuerza.de.trabajo.predict']

plot1 <- ggplot(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo)) +
  geom_line() +
  theme(axis.text.x = element_text(angle=90, hjust=1))
plot2 <- plot1 + geom_line(data=trabajo, aes(x=Fecha, y=Fuerza.de.trabajo.predict), linetype="dashed", color="red")
plot2

# 2. Usar la librería VIM para visualizar y corregir los valores perdidos

# Instalamos la libreria VIM: Visualization and Imputation of Missing Values
#install.packages('VIM')
#install.packages('VIMGUI')

library(VIM)
aggr_plot <- aggr(trabajo, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE,
                  labels=names(trabajo), cex.axis=.7, gap=3, ylab=c("Histograma de valores perdidos","Patrón"))



