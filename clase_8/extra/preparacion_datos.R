library(dplyr)
data(wine, package='rattle')

head(wine)
wine <- rename(wine, Tipo=Type, Alcohol=Alcohol, Acido.Malico=Malic, Cenizas=Ash, Alcalinidad=Alcalinity, Magnesio=Magnesium, Fenoles=Phenols, Flavonoides=Flavanoids, NoFlavonoides=Nonflavanoids, Proantocianidinas=Proanthocyanins, Tono=Hue, Dilucion=Dilution, Prolina=Proline)

wine <- wine[sample(nrow(wine)),]

wine %>%
  select(Tipo) -> wine_type
head(wine_type)

wine %>%
  select(-Tipo) -> wine
head(wine)

write.csv(wine, file="../data/vinos_analisis_quimico.csv", fileEncoding="UTF-8", row.names=FALSE)
write.csv(wine_type, file="../data/vinos_analisis_quimico_tipos.csv", fileEncoding="UTF-8", row.names=FALSE)
