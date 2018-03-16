# Artificial Neural Network

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/",
            "Part 8 - Deep Learning/Section 39 - Artificial Neural Networks (ANN)", sep = ""))

# Importing data
dataset = read.csv("Churn_Modelling.csv")
dataset = dataset[,4:14]

# Encoding the categorical variables as factors
dataset$Geography = as.numeric(factor(dataset$Geography,
                                      levels = c("France", "Germany", "Spain"),
                                      labels = c(1,2,3)))
dataset$Gender = as.numeric(factor(dataset$Gender,
                                   levels = c("Female", "Male"),
                                   labels = c(1,2)))

# Splitting the dataset into Training set and Testing set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Exited, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-11] = scale(training_set[-11])
test_set[-11] = scale(test_set[-11])

# Fitting the ANN to the Training Set
# install.packages("h2o")
library(h2o)
h2o.init(nthreads = -1)

# Predicting the Test Set results
Y_pred = predict(classifier, newdata = test_set[-3])

# Making the Confusion Matrix
cm = table(test_set[,3], Y_pred)