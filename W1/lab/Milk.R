#install.packages('flexclust')
#install.packages('cluster')
library(aplpack)

milk <- read.csv("W1/data/Milk.csv")

valMeaning = list(
  'The species of mammal the sample came from',
  'The fat content of the milk (%',
  'The protein content of the milk (%)',
  'Ash or mineral content of the milk (%',
  'Total solids (%)')

valNames = list(
  'species',
  'fat',
  'protein',
  'ash',
  'tot_solids')

milk[9,1]<-"Cow Brown Swiss"
attach(milk)

milk[,1] <- as.character(milk[,1])
stars(milk[,2:6],draw.segments = T,labels = milk[,1])
milkWithoutSpecies <- milk[,2:6]
#Clustering

distanceMatrix<-dist(milkWithoutSpecies)
analysis <- hclust(distanceMatrix)
plot(analysis,labels = milk[,1])

cut2 <- cutree(analysis,2)
cut2 #In whitch cluster the ith elements belongs to?



