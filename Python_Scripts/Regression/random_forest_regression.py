# Random Forest Regression 

# Set working directory
import os
path="/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/Part 2 - " \
     "Regression/Section 9 - Random Forest Regression"
    
os.chdir(path)
print(os.getcwd())
del path 

# Importing Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values #Include":2" to ensure that X is initiated as a matrix
Y = dataset.iloc[:, 2].values

# Splitting the dataset into Training set and Testing set
""" from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=0) """

# Feature Scaling
""" from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test) """

# Fitting Random Forest Regression Model to the Dataset
from sklearn.ensemble import RandomForestRegressor
regressor = RandomForestRegressor(n_estimators = 300,
                                  random_state = 0)
regressor.fit(X,Y)

# Predicting a new results with Random Forest Regression
Y_pred = regressor.predict(6.5)

# Visualizing the Random Forest Regression results (for higher resolution and smoother curve)
X_grid = np.arange(min(X), max(X), 0.01)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, Y, color = 'red')
plt.plot(X_grid, regressor.predict(X_grid), color = 'blue')
plt.title('Truth or Bluff (Regression Model)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()