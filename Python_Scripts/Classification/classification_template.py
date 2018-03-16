# Classification Template

# Importing Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Setting working directory
import os
path = "/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder" \
    "/Part 3 - Classification/Section 14 - Logistic Regression"
os.chdir(path)
print(os.getcwd())
del(path)

# Importing the dataset
dataset = pd.read_csv('Social_Network_Ads.csv')
X = dataset.iloc[:,[2,3]].values
Y = dataset.iloc[:,4].values

# Splitting the dataset into Training set and Testing set
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.25, random_state=0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)

# Fitting Classifer to the Training Set
# Create classifier 

# Predicting the Test Set results
Y_pred = classifier.predict(X_test)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_true = Y_test, y_pred = Y_pred)
cm

# Visualizing the Training set results
from matplotlib.colors import ListedColormap
X_set, Y_set = X_train, Y_train
X1, X2 = np.meshgrid(np.arange(start = X_set[:,0].min() - 1, 
                               stop = X_set[:,0].max() + 1, 
                               step = 0.01),
                     np.arange(start = X_set[:,1].min() - 1, 
                               stop = X_set[:,1].max() + 1, 
                               step = 0.01))
plt.contourf(X1, X2, 
             classifier.predict(np.array([X1.ravel(), X2.ravel()]).T).reshape(X1.shape),
             alpha = 0.75, cmap = ListedColormap(('red', 'green')))
plt.xlim(X1.min(), X1.max())
plt.ylim(X2.min(), X2.max())
for i, j in enumerate(np.unique(Y_set)):
    plt.scatter(X_set[Y_set == j, 0], X_set[Y_set == j, 1],
                c = ListedColormap(('red', 'green'))(i), label = j)
plt.title('Classification (Test Set)')
plt.xlabel('Age')
plt.ylabel('Estimated Salary')
plt.legend()
plt.show()

# Visualizing the Testing set results
X_set, Y_set = X_test, Y_test
X1, X2 = np.meshgrid(np.arange(start = X_set[:,0].min() - 1, 
                               stop = X_set[:,0].max() + 1, 
                               step = 0.01),
                     np.arange(start = X_set[:,1].min() - 1, 
                               stop = X_set[:,1].max() + 1, 
                               step = 0.01))
plt.contourf(X1, X2, 
             classifier.predict(np.array([X1.ravel(), X2.ravel()]).T).reshape(X1.shape),
             alpha = 0.75, cmap = ListedColormap(('red', 'green')))
plt.xlim(X1.min(), X1.max())
plt.ylim(X2.min(), X2.max())
for i, j in enumerate(np.unique(Y_set)):
    plt.scatter(X_set[Y_set == j, 0], X_set[Y_set == j, 1],
                c = ListedColormap(('red', 'green'))(i), label = j)
plt.title('Classification (Test Set)')
plt.xlabel('Age')
plt.ylabel('Estimated Salary')
plt.legend()
plt.show()
