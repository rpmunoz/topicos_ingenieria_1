#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

library(dplyr)
library(ggplot2)

# El lenguaje R permite construir modelos matemáticos tanto lineales como no lineales

url = "https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_7/data/censo_chile.csv"
censo = read.csv(url, fileEncoding="UTF-8")
head(censo)

# Hacemos un gráfico de puntos para visualizar los datos
plot1 <- ggplot(censo, aes(x=año, y=poblacion)) +
  geom_point() +
  theme(axis.text.x = element_text(angle=45, hjust=1))
plot1

# 1. MODELO LINEAL - Polinomios

# En general, los modelos lineales son los más fáciles de entender y modelar.
# En R se emplea la función lm() para construir modelos lineales.
help(lm)

# Partimos usando un modelo lineal simple para ver como población depende de año
lmfit = lm(poblacion ~ año, data=censo)

# Usemos el modelo lineal que acabamos de construir y construyamos la columna poblacion.predict
censo$poblacion.predict <- predict(lmfit, newdata=censo)

#Graficamos los datos originales y el modelo lineal
plot1 + geom_line(data=censo, aes(x=año, y=poblacion.predict), linetype="dashed", color="red")

summary(lmfit)
# Podemos ver que el Multiple R-squared es 0.86, lo cual indica que el modelo no es óptimo
# El p-value es mucho menor que 0.05, por lo cual podemos rechazar la hipotesis nula que \beta=0
# De esta manera, existe una relación significativa entre las variables en el modelo lineal

# El Adjusted R-squared toma en cuenta el hecho de agregar más variables al modelo y que por simple
# change mejore el valor de R-suared. Se usa el factor (N-1)/(N-k-1) donde
# N = número de observaciones y k = número de variables

# Que tal si probamos un polinomio de grado 2

lmfit <- lm(poblacion ~ poly(año,2), data=censo)
summary(lmfit)
# El valor de R^2 mejora notablemente respecto a usar un polinomio de grado 1

censo$poblacion.predict <- predict(lmfit, newdata=censo)
plot1 + geom_line(data=censo, aes(x=año, y=poblacion.predict), linetype="dashed", color="red")
# Podemos notar que modelo en general es bueno, pero todavía tiene residuos grandes

# 2. MODELO LINEAL - Splines

library(splines)

# Usaremos la función bs(), la cual permite generar una matriz de funciones bases del tipo B-splines.
# El parámetro df= corresponde a los grados de libertad
# https://es.wikipedia.org/wiki/B-spline

lmfit <- lm(poblacion ~ bs(año, df=3), data=censo)
summary(lmfit)
# Podemos notar que el modelo construido usando splines de grado 3 es mucho mejor que
# un polinomio de orden 3

censo$poblacion.predict <- predict(lmfit, newdata=censo)
plot1 + geom_line(data=censo, aes(x=año, y=poblacion.predict), linetype="dashed", color="red")

# Las splines suelen usarse para modelar datos con variaciones tanto locales como globales.
#  

# 3. MODELO NO LINEAL - 

# A diferencia de los modelos lineales, la mayoría de los modelos no lineales requieren especificar
# valores inciales para los parámetros del modelo

help(nls)

# Partimos usando un polinomio de grado 2 como ecuación de la función nls()
# Los tres argumentos más importantes son la ecuación, los valores iniciales y el dataframe
mfit <- nls(poblacion ~ theta1 + theta2*año + theta3*año^2, start=list(theta1=5e6, theta2=15e6, theta3=5e6), data=censo)
summary(mfit)

censo$poblacion.predict <- predict(mfit, newdata=censo)
plot1 + geom_line(data=censo, aes(x=año, y=poblacion.predict), linetype="dashed", color="red")

# Un modelo ampliamente usado para estudiar el crecimiento de poblaciones en ecología
# corresponde al modelo de crecimiento logístico
#https://en.wikipedia.org/wiki/Logistic_function

mfit <- nls(poblacion ~ theta1/(1 + exp(-(theta2 + theta3*año))), data=censo)
summary(mfit)

# En esta ecuación theta1 se le llama la asímtota, y se llama así pues es el valor al cual
# tiende el sistema con un año muy grande. Es por ello que usaremos el maximo de la población
# como valor de theta1 

theta1.start=1.5*max(censo$poblacion)

# Para determinar valores iniciales de los otros dos parámetros, una manera es despejando los
# valores de theta1 hacia la izquierda y dejando solamente theta2 y theta3 a la derech
# https://github.com/rpmunoz/topicos_ingenieria_1/blob/master/clase_7/images/equation%20logistic%20growth.png

# Ecuación despejada:  log( Y/theta1/ (1-Y/theta1) ) ~ theta2 + theta3 * X

lm(logit(poblacion/theta1.start) ~ año, censo)

theta2.start=-42
theta3.start=0.021

mfit <- nls(poblacion ~ theta1/(1 + exp(-(theta2 + theta3*año))), start=list(theta1=theta1.start, theta2=theta2.start, theta3=theta3.start), data=censo, trace=TRUE, control = list(maxiter = 50))
summary(mfit)

   