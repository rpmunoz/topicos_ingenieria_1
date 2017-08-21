library(dplyr)
data(wine, package='rattle')

head(wine)
wine <- rename(wine, Tipo=Type, Alcohol=Alcohol, Acido.Malico=Malic, Cenizas=Ash, Alcalinidad=Alcalinity, Magnesio=Magnesium, Fenoles=Phenols, Flavonoides=Flavanoids, NoFlavonoides=Nonflavanoids, Proantocianidinas=Proanthocyanins, Tono=Hue, Dilucion=Dilution, Prolina=Proline)
head(wine)

write.csv(wine, file="~/Downloads/vinos_analisis_quimico.csv", fileEncoding="UTF-8", row.names=FALSE)
