# Decision Tree Regression

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/",
            "Section 8 - Decision Tree Regression", sep = ""))

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

# Fitting the Decision Tree Regression to the Dataset
install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

# Predicting a new result with Decision Tree Regression
Y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualizing the Decision Tree Model results
library(ggplot2)
ggplot(data = dataset) +
  geom_point(aes(x = Level, y = Salary),
             colour = 'red') +
  geom_line(aes(x = Level, y = predict(regressor, data = dataset)),
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') + 
  ylab('Salary')

# Visualizing the Decision Tree Model results with higher prediction resolution
x_grid = seq(min(dataset$Level), max(dataset$Level), by = 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, data.frame(Level = x_grid))),
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') + 
  ylab('Salary')

