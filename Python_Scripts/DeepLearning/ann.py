# Artificial Neural Network

# Installing Theano
# pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git

# Installing Tensorflow
# Install Tensorflow from the website: https://www.tensorflow.org/versions/r0.12/get_started/os_setup.html

# Installing Keras
# pip install --upgrade keras

# Importing Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Setting working directory
import os
path = "/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder" \
    "/Part 8 - Deep Learning/Section 39 - Artificial Neural Networks (ANN)"
os.chdir(path)
print(os.getcwd())
del(path)

# Importing the dataset
dataset = pd.read_csv('Churn_Modelling.csv')
X = dataset.iloc[:, 3:13].values
Y = dataset.iloc[:, 13].values

# Encoding categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelEncoder_X_1 = LabelEncoder()
X[:, 1] = labelEncoder_X_1.fit_transform(X[:, 1])
labelEncoder_X_2 = LabelEncoder()
X[:, 2] = labelEncoder_X_2.fit_transform(X[:, 2])

onehotencoder = OneHotEncoder(categorical_features = [1])
X = onehotencoder.fit_transform(X).toarray()
X = X[:, 1:]

# Splitting the dataset into Training set and Testing set
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.20, random_state=0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)

# Creating the Artificial Neural Network:
import keras
from keras.models import Sequential
from keras.layers import Dense

# Initializing the ANN
classifier = Sequential()

# Adding the input layer and the first hidden layer
classifier.add(Dense(output_dim = 6, 
                     init = "uniform", 
                     activation = 'relu',
                     input_dim = 11))

# Adding the second hidden layer
classifier.add(Dense(output_dim = 6, 
                     init = "uniform", 
                     activation = 'relu'))

# Adding the output layer
classifier.add(Dense(output_dim = 1, 
                     init = "uniform", 
                     activation = 'sigmoid'))

# Compiling the ANN
classifier.compile(optimizer = 'adam', 
                   loss = "binary_crossentropy",
                   metrics = ['accuracy'])

# Fit the ANN to the training set
classifier.fit(X_train, Y_train, 
               batch_size = 10, 
               nb_epoch = 100)

# Predicting the Test Set results
Y_pred = classifier.predict(X_test)
Y_pred = (Y_pred > 0.5)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_true = Y_test, y_pred = Y_pred)
cm
