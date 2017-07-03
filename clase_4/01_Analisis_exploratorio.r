
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

library(datasets)
library(dplyr)
library(ggplot2)

options(repr.plot.width = 6, repr.plot.height = 4)

calidad_aire = read.csv("https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_4/data/nyc_calidad_aire.csv")
head(calidad_aire)

summary(calidad_aire$Viento)

ggplot(calidad_aire, aes(x = Mes, y = Viento)) +
        geom_boxplot()

calidad_aire$Mes <- factor(calidad_aire$Mes,
                           labels = c("Mayo", "Junio", "Julio", "Agosto", "Septiembre"))

ggplot(calidad_aire, aes(x = Mes, y = Viento)) +
        geom_boxplot(fill=I("blue")) +
        ggtitle("Gráfico de cajas para la variable Velocidad del viento") + 
        xlab("Mes") +
        ylab("Velocidad del viento (kmh)")

ggplot(calidad_aire, aes(Viento)) +
    geom_histogram(bins=12, fill=I("blue")) +
    ggtitle("Distribución de la variable Velocidad del viento") + 
    xlab("Velocidad viento (kmh)") +
    ylab("Frecuencia absoluta") +
    geom_rug()

head(mtcars)

ggplot(data = mtcars, aes(as.factor(cyl))) +
    geom_bar(stat="count", fill=I("blue")) +
    xlab("Número de válvulas") +
    ylab("Frencuencia absoluta")



salarios <-read.csv("https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_4/data/salarios_hombres_usa.csv") 
head(salarios)

salarios_muestra <- salarios[1:100,] # usamos las primeras 100 filas

ggplot(salarios_muestra, aes(experiencia, sueldo)) + geom_point(aes(colour = sindicalizado))

ggplot(salarios_muestra, aes(x = sindicalizado, y = sueldo)) +
        geom_boxplot(fill=I("blue"))


