myData <- read.csv("W2/data/Countries.csv")
attach(myData)


noNames <- myData[,3:13]
noId <- myData[,2:13]

#Note down any particularly interesting points from your exploratory analysis
summary(noNames)

#Scales are very different, we should consider using correlation insteand of cov
#matrix.
#Also measurement units are different.


#Real Answer
#Railways and Airports have extremes, mean 18015 vs max 225750 for railways and 
#mean 790 , max 14k for airports(USA)
#Also, some regions underrepresented
#Africa          Asia        Europe   Middle.East North.America       Oceania 
#8             9             9             3             3             2 
#South.America 
#4 
table(noId[,1])
#Finally , some relationships using pairs
pairs(noNames)
#Literacy vs life expectancy
#aged under 14 vs high unemployment
#

round(cov(noNames),2)
#no spatial data
#Different scales 
#Different measurement units

#---------------------------------PCA------------------------------
my.pca <- prcomp(noNames,scale=T)
my.pca
#What default output from your analysis is produced by printing your object 
#->Unscaled 
# -> sqrt of eigenvalues + PCA's
my.lambdas <- my.pca$sdev^2
my.lambdas

#λ1=4.37367709 
#λ2=2.60683233 
#λ3=#1.44464096 
#λ4=0.88939989 
#λ5=0.63179233 
#λ6=0.47092390 
#λ7=0.26467701 
#λ8=0.15695296 
#λ9=0.11949640 
#λ10=0.02325272 
#λ11=0.01835443

#Why are there eleven eigenvalues and principal components?
#->Because k=11 , n>k
#What additional output to you obtain by using the summary function
summary(my.pca)
#->Proportion of variance and Cumulative proportion of variance
#Consider your summary output, focusing on the cumulative proportions how many principal components should be interpreted
#->3 or 4 could be argued, less than 3 is to small variance, more than 4 , the gains of the extra dimension 
#->cannot justify the extra dimension
#-> Also -> we can keep all pc's with variance >1 if we work with corellation matrix, thats because mean of variance = 1
#-> if we keep >1 , we keep the biggest variances -> this suggests to keep PCA's 1 to 3
plot(my.pca,type='b',pch=19)

#---------------------------------Loadings Plots -------------------------------------------
#Plot PC1 vs PC2 and intepret
plot(my.pca$rotation[,1:2],main = 'PC1 v PC2')
abline(v=mean(my.pca$rotation[,1]),h=mean(my.pca$rotation[,2]),lty=1,col='grey')
text(my.pca$rotation[,1],my.pca$rotation[,2]+0.02,rownames(my.pca$rotation),cex=0.8)
my.pca$rotation

#Done
countries.scores <- predict(my.pca)[,1:3]
plot(countries.scores[,1:2])
