library(caTools)
library(rpart)
library(rpart.plot)

#import ficheiro .csv
encontros_dataset <- read.csv("encontros.csv", header = TRUE, sep = ",")
View(encontros_dataset)
