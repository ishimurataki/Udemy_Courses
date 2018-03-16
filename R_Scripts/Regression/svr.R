# SVR

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/",
            "Section 7 - Support Vector Regression (SVR)", sep = ""))

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

# Fitting the SVR Model to the Dataset
install.packages('e1071')
library(e1071)

regressor = svm(formula = Salary ~ .,
                data = dataset,
                type = 'eps-regression')
summary(regressor)

# Predicting a new result with Regression Model
Y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualizing the Regression Model results
library(ggplot2)
ggplot(data = dataset) +
  geom_point(aes(x = Level, y = Salary),
             colour = 'red') +
  geom_line(aes(x = Level, y = predict(regressor, data = dataset)),
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') + 
  ylab('Salary')

# Visualizing the Regression Model results with higher prediction resolution
x_grid = seq(min(dataset$Level), max(dataset$Level), by = 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, data.frame(Level = x_grid))),
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') + 
  ylab('Salary')
