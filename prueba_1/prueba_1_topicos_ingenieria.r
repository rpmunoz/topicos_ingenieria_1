#En caso de usar un Mac, ejecute 
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#En caso de usar Windows, ejecute
Sys.setlocale("LC_ALL", 'Spanish_Chile.1252')

#Cargamos las librerias ggplot2 y dplyr
library(ggplot2)
library(dplyr)

file="https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/prueba_1/data/INE_situacion_fuerza_de_trabajo.csv"
trabajo=read.csv(file, fileEncoding="UTF-8")

# Actividad 1
# -----------
# Realizaremos un análisis descriptivo del dataframe trabajo usando funciones nativas de R
# y la libreria dplyr. Siga las instrucciones enumeradas y escriba el codigo que utilizó
# debajo de cada número

# 1. Imprima el encabezado (primeras lineas) del dataframe trabajo

# 2. Determine el rango de años que cubren los datos usando las funciones min() y max()

# 3. Imprima un resumen con el análisis descriptivo del dataframe trabajo, usando todas las columnas. 

# 4. Use la función group_by() de la librería dplyr y calcule el número promedio de personas
# desocupadas por año. Imprima los resultados en forma de tabla

# 5. Cree una columna llamada Tasa.desempleo que exprese la tasa de desempleo como porcentaje
# Use las columnas Desocupados.total y Fuerza.de.trabajo

# 6. Use la función group_by() de la librería dplyr y calcule la tasa de desempleo promedio
# por año. Imprima los resultados en forma de tabla

# Actividad 2
# -----------
# Realizaremos una análisis exploratorio del dataframe trabajo usando la librería ggplot2.
# Siga las instrucciones enumeradas y escriba el codigo que utilizó debajo de cada número

# 1. Haga un gráfico de caja usando el Año en eje X y Tasa.desempleo en el eje Y. Deberían
# aparecer 8 cajas.

# 2. Haga un gráfico de barras usando la Fecha en el eje X y Tasa.desempleo en el eje Y.
# Puede usar la siguiente función para rotar las etiquetas del eje X y hacer
# theme(axis.text.x = element_text(angle = 90, hjust = 1))

# 3. Haga un gráfico de barras usando el Año en el eje X y Tasa.desempleo en el eje Y. Agruparemos
# los datos usando la columna Mes y asignaremos un color a cada Mes. Investigue acerca del uso de los comandos
# group y fill de ggplot que van dentro del comando aes()
# En caso de querer ordernar los Meses de la leyenda use el siguiente comando
# trabajo$Mes <- factor(trabajo$Mes, levels = unique(trabajo$Mes))

# 4. Haga un gráfico de puntos usando la Fecha en el eje X y Tasa.desempleo en el eje Y.
# Puede usar la siguiente función para rotar las etiquetas del eje X y hacer
# theme(axis.text.x = element_text(angle = 90, hjust = 1))

# 5. Haga un gráfico de líneas usando el Mes en el eje X y Tasa.desempleo en el eje Y. Agruparemos
# los datos usando la columna Año y asignaremos un color a cada Año. Investigue acerca del uso de los comandos
# group y fill de ggplot que van dentro del comando aes()
# En caso de querer ordernar los Meses de la leyenda use el siguiente comando
# trabajo$Mes <- factor(trabajo$Mes, levels = unique(trabajo$Mes))

# 6. Use el comando group_by para calcular la tasa de desempleo promedio por año. Guarde este dataframe
# como trabajo_anual

# 7. Use el dataframe trabajo_anual y haga un gráfico de barras usando Año en el eje X y Tasa de desempleo
# promedio en el eje Y

# 8. Use el dataframe trabajo_anual y Haga un gráfico de puntos usando la Fecha en el eje X y Tasa.desempleo en el eje Y
