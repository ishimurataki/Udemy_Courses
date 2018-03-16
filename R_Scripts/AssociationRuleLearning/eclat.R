# Eclat Algorithm

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/",
            "Part 5 - Association Rule Learning/Section 29 - Eclat", sep = ""))

# Data Preprocessing
# install.packages("arules")
library(arules)
# Importing data
dataset = read.csv("Market_Basket_Optimisation.csv", header = FALSE)
dataset = read.transactions("Market_Basket_Optimisation.csv", 
                            sep = ",",
                            rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 100)

# Training Apriopi on the dataset
rules = eclat(data = dataset,
              parameter = list(support = 0.004, minlen = 2))

# visualizing the results
inspect(sort(rules, by = 'support')[1:10])

