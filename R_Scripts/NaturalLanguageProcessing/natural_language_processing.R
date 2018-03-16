# Natural Language Processing 

# Setting working directory
setwd(paste("/Users/takanaoishimura/Desktop/Udemy/Machine Learning A-Z Template Folder/",
            "Part 7 - Natural Language Processing/Section 36 - Natural Language Processing", sep = ""))

# Importing the dataset
dataset = read.delim(file = "Restaurant_Reviews.tsv",
                     sep = "\t", quote = '', stringsAsFactors = FALSE)
dataset_original = read.delim(file = "Restaurant_Reviews.tsv",
                              sep = "\t", quote = '', stringsAsFactors = FALSE)

# Cleaning the texts
install.packages('tm')
install.packages('SnowballC')
library(tm)
library(SnowballC)
corpus = VCorpus(VectorSource(dataset$Review))
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removeNumbers)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords())
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, stripWhitespace)

# Creating the Bag of Words model
dtm = DocumentTermMatrix(corpus)
dtm = removeSparseTerms(dtm, 0.999)
dataset = as.data.frame(as.matrix(dtm))
dataset$Liked = dataset_original$Liked

# Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked, levels = c(0,1))

# Splitting the dataset into Training set and Testing set
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting random forest classification model to the Training Set
install.packages('randomForest')
library(randomForest)
classifier = randomForest(x = training_set[-692],
                          y = training_set$Liked,
                          ntree = 10)

# Predicting the Test Set results
Y_pred = predict(classifier, newdata = test_set[-692])

# Making the Confusion Matrix
cm = table(test_set[,692], Y_pred)