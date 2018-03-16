# Random Forest Regression

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/",
            "Section 9 - Random Forest Regression", sep = ""))

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

# Fitting the Random Forest Regression Model to the Dataset
install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1],
                         y = dataset[,2],
                         ntree = 500)

# Predicting a new result with Random Forest Regression Model
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualizing the Random Forest Regression Model results with higher prediction resolution
x_grid = seq(min(dataset$Level), max(dataset$Level), by = 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, data.frame(Level = x_grid))),
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') + 
  ylab('Salary')
