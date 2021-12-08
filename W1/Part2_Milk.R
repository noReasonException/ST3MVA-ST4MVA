#install.packages("flexclust")
#install.packages("cluster")
library("flexclust")
library("cluster")
#Introduction ==================================
milk <- read.csv("Milk.csv")  #Read CSV
head(milk) #Check the first few lines
attach(milk) #attach, now collums can be accessed as variable names

valMeaning = list(
  'The species of mammal the sample came from',
  'The fat content of the milk(%)',
  'The protein content of the milk(%)',
  'Ash or mineral content of the milk(%)',
  'Total solids(%)')
valNames = list(
  'Species',
  'Fat',
  'Protein',
  'Ash',
  'Total Solids')


milk[,1]<-as.character(milk[,1])
milk[9,1] <- "Cow Brown Swiss" #This datarow contains invalid characters, and 
#R to panic, this line fixes this
milkWithoutSpecies <- milk[,2:6]
stars(milkWithoutSpecies,labels=as.vector(milk[,1]),draw.segments = TRUE)

#Note down any species that you can identify
#->Donkey,Horse,Human
#->Camel,Cow .* , Goat
#->Whale,Seal Grey

#Look up the help file for the dist function. What distance method 
#is used by default?
#->dist(x, method = "euclidean", diag = FALSE, upper = FALSE, p = 2) : euclidean

my.dist.matrix <- dist(milkWithoutSpecies)
my.dist.matrix

my.cluster.analysis <- hclust(my.dist.matrix)
my.cluster.analysis
# Again, look up the help file for the hclust function, What linkage method is 
#used by default?
#->hclust(d, method = "complete", members = NULL) : 'complete' so 
#Furthest neighbour/Complete Linkage

plot(my.cluster.analysis)
#Cut at 40, 3 clusters
#Elephant, Dolphin

