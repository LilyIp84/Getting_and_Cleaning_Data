setwd("./Project")

options(stringsAsFactors = FALSE)
options(scipen=10, digits = 2)

## Merge training and test data sets into one data set
trainData <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")
testData <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt")
testSubject <- read.table("./test/subject_test.txt")
features <- read.table("features.txt")
features <- features[[2]]
activityLabel <- read.table("activity_labels.txt")
activityLabel <- activityLabel[[2]]

allObservations <- rbind(trainData, testData)

##Add features as column names for allObservations
colnames(allObservations) <- features


