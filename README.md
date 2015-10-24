# Getting_and_Cleaning_Data
## Assignment
The goal is to prepare tidy data that can be used for later analysis.
The run.analysis_R script will achieve the following.

1. Download the data into R
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement using the features data set and grep. 
4. Uses descriptive activity names to name the activities in the data set using activity data set and joining that with the labels and subjects
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is achieved by using the aggregate function in plyr package.

The codebook.md will explain the transformations performed and the variables in creating the tidy data set.
