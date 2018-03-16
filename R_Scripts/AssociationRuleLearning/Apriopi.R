# Apriopi Algorithm

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/",
            "Part 5 - Association Rule Learning/Section 28 - Apriori", sep = ""))

# Data Preprocessing
install.packages("arules")
library(arules)
# Importing data
dataset = read.csv("Market_Basket_Optimisation.csv", header = FALSE)
dataset = read.transactions("Market_Basket_Optimisation.csv", 
                            sep = ",",
                            rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 100)

# Training Apriopi on the dataset
rules = apriori(data = dataset,
                parameter = list(support = 0.004, confidence = 0.2))

# visualizing the results
inspect(sort(rules, by = 'lift')[1:10])
