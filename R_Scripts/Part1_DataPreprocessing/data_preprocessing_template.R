# Data Preprocessing

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing/Section ",
            "2 -------------------- Part 1 - Data Preprocessing --------------------", sep = ""))

# Importing data
dataset = read.csv("Data.csv")
dataset = dataset[,]

# Splitting the dataset into Training set and Testing set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])
