
#Introduction ==================================
beetle <- read.csv("old/W1/data/Beetle.csv")  #Read CSV
head(beetle) #Check the first few lines
attach(beetle) #attach, now collums can be accessed as variable names

valMeaning = list(
  'Identification Number',
  'Fist join of fist tarsus',
  'Second join of fist tarsus',
  'Maximum width of head',
  'Maximum width of the aedeagus',
  'The front angle o fthe aedeagus',
  'The width of the aedeagus from the side')
valNames = list(
  'ID',
  'first.joint',
  'sec.joint',
  'head',
  'a.fore',
  'a.angle',
  'side')


first.joint #Here, the first collumn is directly accessible

beetle['first.joint'] #Also a way to access

beetle[2] #Also a way

beetle[2,1] #2nd row 1rst collum
beetle[2,] #Full second row
beetle[,2] #Full second collumn
#End of Introduction ==================================
#Using this matrix style notation, can you identify the code that would print 
#the front angle of the aedeagus for all the beetles in the dataset?

#->3 Ways of doing that
beetle['a.fore']
beetle[,5]
a.fore

#Exploratory Analysis(Run the next Code block all at once in order to work)
par(mfrow=c(3,3))
hist(beetle[,2],
     main=paste(valMeaning[2]," histogram"),
     xlab=valNames[2],
     ylab="Frequency")
hist(beetle[,3],
     main=paste(valMeaning[3]," histogram"),
     xlab=valNames[3],
     ylab="Frequency")
hist(beetle[,4],
     main=paste(valMeaning[4]," histogram"),
     xlab=valNames[4],
     ylab="Frequency")
hist(beetle[,5],
     main=paste(valMeaning[5]," histogram"),
     xlab=valNames[5],
     ylab="Frequency")
hist(beetle[,6],
     main=paste(valMeaning[6]," histogram"),
     xlab=valNames[6],
     ylab="Frequency")
hist(beetle[,7],
     main=paste(valMeaning[7]," histogram"),
     xlab=valNames[7],
     ylab="Frequency")

#From your histograms, can you identify any variables that might be particularly
#Useful in distinguishing groups of beetles within the dataset? Note them down

#->We can see that angle and fore have nice separators, these may be used later 
#to classify into different species

#Use the pairs function to produce a scatterplot matrix of the beetle data,
#make sure you do not include the ID number for each beetle in your plot(
#does it matter if a beetle is called beetle 1 or beetle 2?)
beetlesWithoutID <- beetle[,2:7]
par(mfrow=c(1,1))
pairs(beetlesWithoutID)
#Comment on any evident relationships between the variables, are any of these
#relationships suprising?
#-> First joint and second joint, thats trivial and expected
#-> a.fore  and side, trivial, variables dependent
#-> sec.joint and head, non trivial


#Consider the bivariate plots, can you identify any potential groupings of 
#observations?If so, how many groups do you think could be identified, and 
#whitch variables do you think would be key in distinguishing the groups?

#Chernoff's faces
library(aplpack)
par(mfrow=c(1,1))
faces(beetlesWithoutID)

#Whitch variable is used to determine the height of the mouth for each face?
#->"height of mouth  " "a.fore"  

#Star plots
par(mfrow=c(1,1))
stars(beetlesWithoutID,draw.segments = TRUE)

#Can you identify any groups of beetles from your plots?
#->Big Sec Joint(66-100)
#-> Big Head(33-66)
#-> Big All(0-33)
