#install.packages('aplpack')
library(aplpack)
beetles <- read.csv("W1/data/Beetle.csv")
valMeaning = list(
  'Identification Number',
  'Fist join of fist tarsus',
  'Second join of fist tarsus',
  'Maximum width of head',
  'Maximum width of the aedeagus',
  'The front angle of the aedeagus',
  'The width of the aedeagus from the side')
valNames = list(
  'ID',
  'first.joint',
  'sec.joint',
  'head',
  'a.fore',
  'a.angle',
  'side')

varNames <- 
attach(beetles)
#==========================================================================================
#Having attached a dataset in R we can use the variable names in our functions.
#However it can also be useful to use matrix style notation to subset data or pick out
#individual observations.
#For example:
#  mydata[3,6]
#would print the observation from the third row and the sixth column in my dataset called
#mydata.
#Using this matrix style notation, can you identify the code that would print the front angle
#of the aedeagus for all of the beetles in the dataset? Note it down:

beetles[,6]
#==========================================================================================
#We are going to start with some basic univariate plots – histograms. The function is
#hist(variable name, , , ,)
#To refine your plots you can add some generic plotting options:
#  main= “This is your main title”
#xlab=“Label your x-axis”
#ylab=“Label your y-axis”
#col=“red” or where multiple colours are appropriate col=c(“red”,”blue”)
#google ‘R colours’ for a full list
#From your histograms can you identify any variables that might be particularly useful in
#distinguishing groups of beetles within the dataset? Note them down:
for(i in seq.int(2,7)){
  hist(beetles[,i],main=paste(valMeaning[i]),xlab=valNames[i])  
}
#->a.angle
#->a.fore
#->first.joint

#==========================================================================================
#Use the pairs function to produce a scatterplot matrix of the beetle data, make sure you
#do not include the ID number for each beetle in your plot (does it matter if a beetle is
#                                                           called beetle 1 or beetle 2?).

beetlesWithoutId<-beetles[,2:7]
pairs(beetlesWithoutId)

#=========================================================================================
#library(aplpack)
#The function we need is simply faces. Use the matrix notation to specify the variables
#that should be used to produce the plot. Note down your code:

faces(beetlesWithoutId)

#=========================================================================================

#Stars plots can often be more informative than Chernoff’s faces. To produce a stars plot
#simply use
#stars(..)

stars(beetlesWithoutId)