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
milkSpecies <- milk[,1]
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

#CutTree
my.clusters<-cutree(my.cluster.analysis,3)
#Plot Single scatter
plot(x=fat,y=protein,pch=c(8,17,19)[my.clusters])
text(fat,protein-0.5,labels=milkSpecies,cex=0.4)
#Even better, plot all scatters
pairs(milkWithoutSpecies,col=c("#bc5090","#ff6361","#ffa600")[my.clusters])

#Are your clusters distinct(not overlapping) on your plot? What can you infer 
#about the milk content properties of your clusters?
#-> Some combinations overlap, other dont, a nice separation 
#-> Is between Fat,Protein | Lactose,Fat |Fat, Ash|Fat,total solids
#-> Every group's distance is less than equal on the join point
#OOps, i did already the next question. 

