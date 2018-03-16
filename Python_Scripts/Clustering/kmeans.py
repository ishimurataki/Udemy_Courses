# K-Means Clustering

# Importing Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Setting working directory
import os
path = "/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder" \
    "/Part 4 - Clustering/Section 24 - K-Means Clustering"
os.chdir(path)
print(os.getcwd())
del(path)

# Importing the dataset
dataset = pd.read_csv("Mall_Customers.csv")
X = dataset.iloc[:, [3,4]].values

# Using the elbow method to find optimal number of clusters
from sklearn.cluster import KMeans
wcss = []
for i in range(1,11):
    kmeans = KMeans(n_clusters = i,
                    init = 'k-means++',
                    max_iter = 300, 
                    n_init = 10,
                    random_state = 0)
    kmeans.fit(X)
    wcss.append(kmeans.inertia_)
plt.plot(range(1,11), wcss)
plt.title('The Elbow Method')
plt.xlabel('The number of clusters')
plt.ylabel('WCSS')
plt.show()

# Applying K-means to the dataset
kmeans = KMeans(n_clusters = 5,
                init = 'k-means++',
                max_iter = 300,
                n_init = 10,
                random_state = 0)
y_kmeans = kmeans.fit_predict(X)

# Visualizing the clusters
colors = ['red', 'blue', 'green', 'cyan', 'magenta']
for i in range(0, 5):
    plt.scatter(X[y_kmeans == i, 0], 
                X[y_kmeans == i, 1], 
                c = colors[i], 
                label = 'Cluster ' + str(i+1))
plt.scatter(kmeans.cluster_centers_[:,0], 
            kmeans.cluster_centers_[:,1], 
            s = 300, 
            c = 'yellow',
            label = 'Centroids')
plt.title('Clusters of Clients')
plt.xlabel('Annual Income (k$)')
plt.ylabel('Spending Score (1-100)')
plt.legend()
plt.show()
    
    
    


