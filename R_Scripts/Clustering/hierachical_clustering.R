# Hierachical Clustering

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/",
            "Part 4 - Clustering/Section 25 - Hierarchical Clustering", sep = ""))

# Importing data
dataset = read.csv("Mall_Customers.csv")
X = dataset[4:5]

# Using the dendogram to find the optimal number of clusters
dendogram = hclust(d = dist(X, method = "euclidean"),
                   method = 'ward.D')
plot(dendogram,
     main = "Dendogram",
     xlab = "Customers",
     ylab = "Euclidean Distances")

# Fitting the Heirachical Clustering to the dataset
hc = hclust(d = dist(X, method = "euclidean"),
            method = 'ward.D')
y_hc = cutree(tree = hc,
              k = 5)

# Visualizing the clusters
library(cluster)
clusplot(x = X, 
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE, 
         labels = 4, 
         plotchar = FALSE,
         span = TRUE,
         main = paste("Clusters of Clients"),
         xlab = "Annual Income",
         ylab = "Spending Score")


