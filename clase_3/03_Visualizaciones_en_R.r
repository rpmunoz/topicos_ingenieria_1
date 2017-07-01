
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

library(dplyr)
library(ggplot2)

options(repr.plot.width = 6, repr.plot.height = 4.5)

file="https://raw.githubusercontent.com/rpmunoz/topicos_ingenieria_1/master/clase_3/data/chile_demographic.csv"
chile = read.csv(file)

head(chile)

ggplot(chile, aes(x=RegionID, y=Poblacion)) +
    geom_point(shape=1)      # Use hollow circles

chile %>%
group_by(RegionID, Region) %>%
summarise(n_comuna=n(), Poblacion=sum(Poblacion), Superficie=sum(Superficie)) -> chile_region

chile_region

ggplot(chile_region, aes(x=RegionID, y=Poblacion)) +
    geom_point(shape=16, colour = "red", fill="red", size = 3)

ggplot(chile_region, aes(x=RegionID, y=Poblacion)) +
    geom_point(shape=16, colour = "red", fill="red", size = 3) +
    geom_smooth(method='lm', se=FALSE)

ggplot(chile_region, aes(x=RegionID, y=Poblacion)) +
    geom_point(shape=16, colour = "red", fill="red", size = 3) +
    geom_smooth(method='lm', se=FALSE, formula= y ~ poly(x, 2))

ggplot(chile, aes(Poblacion)) +
    geom_histogram(bins=30)

qplot(chile$Poblacion, geom="histogram", bins=30) 

ggplot(chile, aes(Poblacion)) +
    geom_histogram(bins=20)

ggplot(chile, aes(Poblacion)) +
    geom_histogram(bins=30, fill=I("blue")) +
    ggtitle("Disitribución de Población en Chile") + 
    xlab("Nº habitantes") +
    ylab("Frecuencia absoluta")


qplot(chile$Poblacion, geom="histogram", bins=30,
      main = "Disitribución de Población en Chile", 
      xlab = "Nº habitantes",
      ylab = "Frecuencia absoluta",
      fill=I("blue"))

ggsave("figures/histograma_poblacion_chile.pdf", width = 16, height = 12, units = "cm")

ggplot(chile_region, aes(x=Region, y=Poblacion)) +
    geom_bar(stat="identity")

ggplot(chile_region, aes(x=Region, y=Poblacion)) +
    geom_bar(stat="identity") +
    theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

chile_region$Region <- factor(chile_region$Region, levels = chile_region$Region)

ggplot(chile_region, aes(x=Region, y=Poblacion)) +
    geom_bar(stat="identity") +
    theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

ggplot(chile_region, aes(x=Region, y=Poblacion)) +
    geom_bar(stat="identity", fill=I("blue")) +
    theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

ggsave("figures/grafico_barras_poblacion_chile.pdf", width = 16, height = 12, units = "cm")

ggplot(chile, aes(x=Poblacion, y=IDH_2005)) +
    geom_point(shape=16, colour = "red", fill="red", size = 3) +
    geom_smooth(method='lm', se=FALSE)

ggplot(chile, aes(x=Poblacion, y=IDH_2005, group=Region, shape=Region, color=Region)) +
    geom_point(size = 3) + scale_shape_manual(values=seq(0,15)) +
    theme(legend.position = c(0.8, 0.3), legend.text=element_text(size=5)) +
    guides(shape=guide_legend(override.aes=list(size=2)))




