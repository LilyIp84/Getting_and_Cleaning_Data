require(plyr)
setwd("./Project")

options(stringsAsFactors = FALSE)
options(scipen=10, digits = 2)

## Merge all  training and test data sets into one data set
trainData <- read.table("./train/X_train.txt")
trainLabel <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")
testData <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt")
testSubject <- read.table("./test/subject_test.txt")
features <- read.table("features.txt")
features <- features[[2]]
activityLabel <- read.table("activity_labels.txt")


##Add features as column names for the data
colnames(trainData) <- features
colnames(testData) <- features

##Add column names for subject and label data
colnames(testLabel) <- "Label"
colnames(trainLabel) <- "Label"
colnames(testSubject) <- "Subject"
colnames(trainSubject) <- "Subject"

##Keep only mean and standard deviation in the train and test data.
trainData <- trainData[,grep("mean|std",features)]
testData<- testData[,grep("mean|std",features)]

##Join all train data together and join all test data together
##train <- cbind(trainData, trainLabel, trainSubject)
##test <- cbind(testData, testLabel, testSubject)

## merge train and test data
allObservations <- rbind(trainData, testData)

##Join the training and test labels and join the activity names to them.
colnames(activityLabel) <- c("activityID", "activityName")
allLabels <- rbind(trainLabel, testLabel)
colnames(allLabels) <- "activityID"

allLabels <- join(allLabels, activityLabel, by = "activityID")
allLabels <- allLabels$activityName

##Join the training and test subjects and join the activity names to them.
allSubjects <- rbind(trainSubject, testSubject)
colnames(allSubjects) <- "activityID"
allSubjects <- join(allSubjects, activityLabel, by = "activityID")
allSubjects <- allSubjects$activityName

## Add processed labels to all Observations
allObservations <- cbind(allLabels, allSubjects, allObservations)

##clean up Label and subject column names
colnames(allObservations)[1] <- "Labels"

colnames(allObservations)[2] <- "Subjects"

##Derive a tidy data set with the average of each variable for each activity and each subject

tidy = aggregate(allObservations, by=list(Label = allObservations$Labels, 
                                          Subjects=allObservations$Subjects), mean)
##remove the additional Label and Subject column as it adds no value
tidy[,4] = NULL
tidy[,3] = NULL

## Write the tidy data set into a text file
write.table(tidy, "tidy.txt", sep="\t")
