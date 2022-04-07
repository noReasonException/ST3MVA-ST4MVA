milk <- read.csv("W1/Data/Milk.csv")  #Read CSV
head(milk) #Check the first few lines

pa <- milk[,2:6]

pairs(pa)
