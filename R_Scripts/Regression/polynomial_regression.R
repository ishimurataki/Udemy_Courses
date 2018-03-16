# Data Preprocessing

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/",
            "Section 6 - Polynomial Regression", sep = ""))

# Importing data
dataset = read.csv("Position_Salaries.csv")
dataset = dataset[,c(2,3)]

# Splitting the dataset into Training set and Testing set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

# Fitting Linear Regression Model to the Dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)
summary(lin_reg)

# Fitting Polynomial Regression Model to the Dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
pol_reg = lm(formula = Salary ~ .,
             data = dataset)
summary(poly_reg)

# Visualizing the Linear Regression results
library(ggplot2)
ggplot(data = dataset) +
  geom_point(aes(x = Level, y = Salary),
             colour = 'red') +
  geom_line(aes(x = Level, y = predict(lin_reg, data = dataset)),
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') + 
  ylab('Salary')

# Visualizing the Polynomial Regression results
ggplot(data = dataset) +
  geom_point(aes(x = Level, y = Salary),
             colour = 'red') +
  geom_line(aes(x = Level, y = predict(pol_reg, data = dataset)),
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') + 
  ylab('Salary')

# Predicting a new result with Linear Regression 
y_pred = predict(lin_reg, data.frame(Level = 6.5))

# Predicting a new result with Polynomial Regression
y_pred = predict(pol_reg, data.frame(Level = 6.5,
                                     Level2 = 6.5^2,
                                     Level3 = 6.5^3,
                                     Level4 = 6.5^4))

