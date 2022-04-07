#The aim of this analysis is to establish which species have similar milk compositions. An
#example application of such analysis would be: If an elephant was rejected by its mother
#in a Zoo, would it be better to rear the baby on say goat’s or cow’s milk (assuming there
#isn’t a stock of elephant milk)? Choosing a species with a similar milk composition could
#result in no/fewer complications

#install.packages('flexclust')
#install.packages('cluster')
#-----------------------------------------------------------------------------------------
#Initialization
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
milkWithoutSpecies <- milk[,2:6]

#-----------------------------------------------------------------------------------------
#Before we jump into cluster analysis let’s produce some stars glyphs to see if we can
#identify any similar species. Before your stars code you need to tell R to treat the
#species variable as a character variable (text) so it can be used as the labels in your plot,
#the code for this is given below

stars(milk[,2:6],draw.segments = T,labels = milk[,1])
#Simmilar Milk Compositions
#->Cow XXX , Zebu, Goat , Sheep ,
#->Donkey, Horse , Human
#->Seal Gray,Whale



#Clustering
#Look up the help file for the dist function. What distance method is used by default?
?dist
#->euclidean
#Again, look up the help file for the hclust function. What linkage method is used by default?
?hclust
#complete (furthest neighbour)

distanceMatrix<-dist(milkWithoutSpecies)
analysis <- hclust(distanceMatrix)
plot(analysis,labels = milk[,1])
cut2 <- cutree(analysis,4)

#Comment on your dendrogram (where would you cut, how many clusters would be the
#result, are there any surprising groupings etc.).

#Polar bear and Whale? wow
#will cut to 4

cut2 #In whitch cluster the ith elements belongs to?

#explore the clusters

pairs(milkWithoutSpecies,pch=c(8,17,19)[cut2],col=c("#bc5090","#ff6361","#ffa600")[cut2])
#Are your clusters distinct (not overlapping) on your plot? What can you infer about the
#milk content properties of your clusters?
#From your plots can you identify any key characteristics of your clusters? Are the
#clusters be more easily distinguishable for some variables
#->Some overlapping, some now, depends on the variable
#->ash vs fat separates well
#->total_solids vs fat separates well

#-----other clustering algorithms--------------------------------------------------
#From looking at the help files for the functions dist and hclust you should be aware
#that your analysis has been based on Euclidean distances, and furthest
#neighbour/complete linkage algorithm.
#Repeat your cluster analysis, but use the nearest neighbour/single linkage method to
#form your clusters. You can copy, paste and adapt your previous code, but please call
#your resulting matrices and vectors different names.
#How many clusters do you think there are, considering your new dendrogram
?hclust
distanceMatrixS<-dist(milkWithoutSpecies)
analysisS <- hclust(distanceMatrixS,method='single')
plot(analysisS,labels = milk[,1])
cut2S <- cutree(analysisS,4)

#->3 clusters?
#Use the table function and the two vectors created from using the cutree function to
#produce a cross-tabulation of your clustering solutions

table(cut2,cut2S)
