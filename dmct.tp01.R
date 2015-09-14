library(ggplot2)

glx <- read.csv("http://astrostatistics.psu.edu/datasets/COMBO17.csv", header = T, stringsAsFactors = F)
str(glx)
#glx$e.W420FE viene como string, en notacion cientifica.
#Hago un as.numeric()

#Tarea 1: convierto como numeric
glx$e.W420FE<- as.numeric(glx$e.W420FE)


qplot(ApDRmag, data=glx)


p1 <- qplot(BjMAG, S280MAG-BjMAG, data = glx)
p2 <- qplot(BbMAG, S280MAG-BbMAG, data = glx)
grid.arrange(p1, p2, ncol=2)

#BjMAG
#BbMAG
#UjMAG
#UbMAG
#VjMAG
#VnMAG
#usMAG
#gsMAG
#rsMAG

#Tarea 2: Remuevo outliers
glx2<-glx[!apply(sapply(glx[,-1], function(x) abs(scale(x)) >= 3), 1, any), ]
nrow(glx2)
#[1] 2890


#Tarea 3: Remuevo rows con datos faltantes
faltantes <- apply(glx, 2, function(x) anyNA(x))
faltantes <- data.frame(faltantes)
faltantes <- data.frame(names(glx), faltantes[,1])
faltantes.list<- which(faltantes[,2] == TRUE)
faltantes.rows <- matrix(, nrow = 0, ncol = 1)
for (i in 1:length(faltantes.list) ) {
  faltantes.rows <- rbind(faltantes.rows, as.matrix(which(is.na(glx2[,faltantes.list[2]]))))
}

faltantes.rows <- unique(faltantes.rows)
glx3 <- glx2[-faltantes.rows,]
which(is.na(glx2[,faltantes.list[i]]))

