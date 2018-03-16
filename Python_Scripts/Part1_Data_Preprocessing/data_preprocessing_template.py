# Data Preproccesing

# Importing Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Setting working directory
import os
path="/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing/Section" \
     " 2 -------------------- Part 1 - Data Preprocessing --------------------"
os.chdir(path)
print(os.getcwd())

# Importing the dataset
dataset = pd.read_csv('data.csv')
X = dataset.iloc[:, :-1].values
Y = dataset.iloc[:, 3].values

# Splitting the dataset into Training set and Testing set
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=0)

# Feature Scaling
""" from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test) """



