# Curso "Topicos de Especializacion 1"
# Prueba 2
# Fecha: 07-08-2017

# Escriba su nombre en la siguiente linea
# Nombre: 

#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

#Cargamos las librerias ggplot2 y dplyr
library(ggplot2)
library(dplyr)

url="https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/prueba_2/data/venta_casas.csv"
casas=read.csv(url, fileEncoding="UTF-8")
View(casas)


# Actividad 1
# -----------
# Haremos un an�lisis exploratorio del dataframe casas usando las librerias ggplot y dplyr.
# Siga las instrucciones enumeradas y escriba el codigo que utiliz� debajo de cada n�mero.

# 1. Use el dataframe casas y haga un gr�fico de cajas usando el n�mero de habitaciones
# en el eje X y el precio en el eje Y. Deben aparecer varias cajas en el gr�fico.


# 2. Use el dataframe casas y haga un gr�fico de puntos usando el �rea �til en metros cuadrados
# en el eje X y el precio en el eje Y.


# 3. Determine el n�mero de las casas que se vendieron para cada c�digo postal.
# Presente el resultado como una tabla o lista y ordene de mayor a menor usando el n�mero de casas.

group_by() %>%
summarise(n_casas=n()) %>%
arrange()

# 4. Anote el codigo postal que ten�a el mayor n�mero de casas que se vendieron.
# Use la funci�n filter() de la librer�a dplyr para seleccionar solo las casas que
# tienen este codigo postal. Almacene este nuevo dataframe como casas_codigo


# 5. Use el dataframe casas_codigo reci�n construido y haga un gr�fico de puntos usando el �rea �til
# en metros cuadrados en el eje X y el precio en el eje Y.


# Actividad 2
# -----------
# Construiremos un modelo lineal para predecir el precio de las casas como funci�n de
# m�ltiples variables

# 1. Use el dataframe casas y la funci�n lm() para construir un modelo lineal simple.
# Use la columna precio como variable Y y la columna area_m2_util como variable X. 
# Haga un gr�fico de puntos y muestre con una l�nea de color el modelo.


# 2. Use el dataframe casas_codigo y la funci�n lm() para construir un modelo lineal simple.
# Use la columna precio como variable Y y la columna area_m2_util como variable X. 
# Haga un gr�fico de puntos y muestre con una l�nea de color el modelo.
# �C�mo se compara el valor de R^2 entre modelo de la pregunta 1 y �ste?


# 3. Use el dataframe casas y la funci�n lm() para construir un modelo lineal avanzado.
# Use la columna precio como variable Y y todas las columnas que usted estime conveniente
# como variables X del modelo.
# Haga un gr�fico de puntos y muestre con una l�nea de color el modelo.
# �C�mo se compara el valor de R^2 entre modelo de la pregunta 1 y �ste?