
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

x = 10
x

x <- 10
x

y=10
y

{
    y=20
    y
}

median(y = 1:10)
y

y <- 10
y

{
    y <- 20
    y
}

median(y <- 1:10)
y

10 > 5

10 < 5

edad = c(35, 37, 30, 45, 40, 36, 45, 32, 52, 42, 30, 48 )
edad

mean(edad)
median(edad)
sd(edad)

region = c("Arica y Parinacota","Tarapacá","Antofagasta","Atacama","Coquimbo","Valparaíso","Metropolitana de Santiago","Libertador General Bernardo O'Higgins","Maule","Biobío","La Araucanía","Los Ríos","Los Lagos","Aisén del General Carlos Ibáñez del Campo","Magallanes y de la Antártica Chilena")
poblacion = c(308271,205566,551627,292054,714856,1859312,7150480,903248,1073635,2025995,933537,380618,835829,106893,158828)
superficie = c(17446.20,41632.60,126048.80,74806.30,40967.80,12646.28,15547.00,16583.30,30340.30,37068.70,31842.30,18577.60,48583.30,107449.40,1392783.70)

class(region)
class(poblacion)
class(superficie)

chile = matrix(c(poblacion,superficie), ncol=2, byrow=FALSE)
chile

class(chile)

colnames(chile)=c("poblacion","superficie")
rownames(chile)=region
chile

chile[order(chile[,"poblacion"],decreasing=TRUE),]

chile[order(chile[,"superficie"],decreasing=FALSE),]

chile[,'poblacion']/chile[,'superficie']

densidad = poblacion/superficie
densidad

chile <- cbind(chile, densidad)
chile

codigo_region <- c("XV","I","II","III","IV","V","XIII","VI","VII","VIII","IX","XIV","X","XI","XII")
class(codigo_region)

chile <- cbind(chile, codigo_region)
chile

class(chile)

chile[,'poblacion']/chile[,'superficie']

class(chile[,'poblacion'])
class(chile[,'superficie'])

region <- c("Arica y Parinacota","Tarapacá","Antofagasta")
poblacion <- c(308271,205566,551627)
superficie <- c(17446.20,41632.60,126048.80)
codigo_region <- c("XV","I","II")

# Podemos definir los labels de los elements usando names
chile = list(region, poblacion, superficie, codigo_region)
names(chile) = c("region","poblacion","superficie","codigo_region")
chile

# O directamente al momento de definir la lista
chile = list(region=region, poblacion=poblacion, superficie=superficie, codigo_region=codigo_region)
chile

chile["region"]

chile[c("region","poblacion")]

chile["poblacion"]/chile["superficie"]

chile[["poblacion"]]/chile[["superficie"]]

region <- c("Arica y Parinacota","Tarapacá","Antofagasta")
poblacion <- c(308271,205566,551627)
superficie <- c(17446.20,41632.60,126048.80)
codigo_region <- c("XV","I","II")

chile <- data.frame(poblacion, superficie, codigo_region)
colnames(chile) <- c("poblacion","superficie","codigo_region")
rownames(chile) <- region
chile

chile["poblacion"]

chile["densidad"] <- chile["poblacion"]/chile["superficie"]
chile

region = c("Arica y Parinacota","Tarapacá","Antofagasta","Atacama","Coquimbo","Valparaíso","Metropolitana de Santiago","Libertador General Bernardo O'Higgins","Maule","Biobío","La Araucanía","Los Ríos","Los Lagos","Aisén del General Carlos Ibáñez del Campo","Magallanes y de la Antártica Chilena")
poblacion = c(308271,205566,551627,292054,714856,1859312,7150480,903248,1073635,2025995,933537,380618,835829,106893,158828)
superficie = c(17446.20,41632.60,126048.80,74806.30,40967.80,12646.28,15547.00,16583.30,30340.30,37068.70,31842.30,18577.60,48583.30,107449.40,1392783.70)
codigo_region <- c("XV","I","II","III","IV","V","XIII","VI","VII","VIII","IX","XIV","X","XI","XII")

chile <- data.frame(poblacion, superficie, codigo_region)
colnames(chile) <- c("poblacion","superficie","codigo_region")
rownames(chile) <- region
chile

chile[order(poblacion),]

chile[order(-poblacion),]

colMeans(chile["poblacion"])

colMeans(chile[1:2])

apply(chile["poblacion"], 2, mean)

apply(chile["poblacion"], 2, sd)

apply(chile["poblacion"], 2, sum)

summary(chile)


