# K-Means CLustering

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/",
            "Part 4 - Clustering/Section 24 - K-Means Clustering", sep = ""))

# Importing data
dataset = read.csv("Mall_Customers.csv")
X = dataset[4:5]

# Using the elbow method to find optimal number of clusters
set.seed(6)
wcss = vector()
for(i in 1:10){
  wcss[i] = sum(kmeans(X,i)$withinss)
}
plot(1:10, wcss, type = 'b', 
     main = paste("Clusters of Clients"),
     xlab = "Number of Clusters",
     ylab = "WCSS")

# Applying k-means to dataset
set.seed(29)
kmeans = kmeans(X, 5, iter.max = 10, nstart = 10)

# Visualizing the Clusters
library(cluster)
clusplot(x = X, 
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE, 
         labels = 4, 
         plotchar = FALSE,
         span = TRUE,
         main = paste("Clusters of Clients"),
         xlab = "Annual Income",
         ylab = "Spending Score")


