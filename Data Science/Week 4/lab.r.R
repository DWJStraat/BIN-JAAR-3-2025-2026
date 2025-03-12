#1

install.packages('class')
install.packages('ggplot2')
install.packages("AppliedPredictiveModeling")
library(class)
library(ggplot2)
library(AppliedPredictiveModeling)

#2

data(abalone)
#a
dimensions <- dim(abalone)
# 4177 x 9

#b
names(which(sapply(abalone, class) == "factor"))
# Type is a categorical variable

#c
prop.table(table(abalone$Type))
# F = 0.313...
# I = 0.321...
# M = 0.366...

#d
names(abalone)[2:9]
# all eight

# 3
library(class)

test_size <- 850
dataset <- scale(abalone[,-1])
test_x <- subset(dataset[1:test_size,])
train_x <- subset(tail(dataset, nrow(dataset) - test_size))
train_y <- tail(abalone$Type, nrow(abalone) - test_size)
test_y <- abalone$Type[1:test_size]
model <- knn(
  train = train_x,
  test = test_x,
  cl = train_y,
  k = 5,
  l = 3,
  prob = FALSE,
  use.all = TRUE
)

#a
classification_table <- table(Truth = model, Prediction = test_y)
classification_table
false_positive <- classification_table[4] + classification_table[6]
false_negative <- classification_table[2] + classification_table[8]
# 131 false positive, 44 false negative

#b
correct <- classification_table[1] +
  classification_table[5] +
  classification_table[9]
total <- sum(classification_table)
accuracy <- correct / total
# 0.4574468

#d Not that great- less accurate than tossing a proverbial coin

#e
test_size <- 400

test_x <- subset(dataset[1:test_size,])
train_x <- subset(tail(dataset, nrow(abalone) - test_size))
train_y <- tail(abalone$Type, nrow(abalone) - test_size)
test_y <- abalone$Type[1:test_size]
model <- knn(
  train = train_x,
  test = test_x,
  cl = train_y,
  k = 5,
  l = 3,
  prob = FALSE,
  use.all = TRUE
)
classification_table <- table(Truth = test_y, Prediction = model)
correct <- classification_table[1] +
  classification_table[5] +
  classification_table[9]
total <- sum(classification_table)
accuracy <- correct / total
accuracy
# Improved to 0.4939024

# e
# No, non-numerical data points are impossible to transform into numerical
# without introducing bias.

# 4
library(tidyverse)
test_size <- 850
test_x <- subset(abalone[1:training_size,], select = -c(Type))
train_x <- subset(tail(abalone, nrow(abalone) - test_size),
                  select = -c(Type))
train_y <- tail(abalone$Type, nrow(abalone) - test_size)
test_y <- abalone$Type[1:training_size]
set.seed(9999999)
output_list <- list()
for (k in seq(1, 50)) {
  model <- knn(
    train = train_x,
    test = test_x,
    cl = train_y,
    k = k,
    l = 3,
    prob = FALSE,
    use.all = TRUE
  )
  classification_table <- table(Truth = test_y, Prediction = model)
  correct <- classification_table[1] +
    classification_table[5] +
    classification_table[9]
  total <- sum(classification_table)
  accuracy <- correct / total
  output_list[[k]] <- accuracy
}
output <- data.frame(matrix(unlist(output_list), nrow=length(output_list)))
colnames(output) <- c("Accuracy")
output <- tibble::rowid_to_column(output, "ID")
plot <- ggplot(aes(x = ID, y = Accuracy), data = output)+ geom_point()
plot
#a
# -log

#b
# high k = high accuracy

#5
install.packages('ISLR')
library('ISLR')
data(Caravan)
#6
# A
summary(Caravan)
nrow(Caravan)


nrow(Caravan)
# 5822 individuals

# B
