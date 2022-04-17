countries <- read.csv("W2/data/Countries.csv")

head(countries)




pure <- countries[,3:12]

pureCorr<-cor(pure)

eigenvectors <- (eigen(pureCorr))$vectors

eigenvectors

pureM <- data.matrix(pure)


eigenvectors



data.matrix(scale(pure))%*%eigenvectors

scale(pure)[1,]%*%eigenvectors[,1]



#-------


pca <- prcomp(pure,scale. = T)
pre <- predict(pca)

pre

