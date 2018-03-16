# Simple Linear Regression

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/", 
            "Part 2 - Regression/Section 4 - Simple Linear Regression", sep = ""))

# Importing data
dataset = read.csv("Salary_Data.csv")
dataset = dataset[,]

# Splitting the dataset into Training set and Testing set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

# Fitting simple linear regression to the Training Set
regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_set)
summary(regressor)

# Predicting the Test Set results
Y_pred = predict(regressor, data = test_set$YearsExperience)

# Visualizing the Training Set results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, 
                 y = training_set$Salary),
             color = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, 
                y = predict(regressor, data = training_set$YearsExperience)),
            color = 'blue') +
  ggtitle("Salary vs Experience (Training Set)") + 
  xlab("Years of Experience") + 
  ylab("Salary ($)")

# Visualizing the Testing Set results
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, 
                 y = test_set$Salary),
             color = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, 
                y = predict(regressor, data = training_set$YearsExperience)),
            color = 'blue') +
  ggtitle("Salary vs Experience (Training Set)") + 
  xlab("Years of Experience") + 
  ylab("Salary ($)")
