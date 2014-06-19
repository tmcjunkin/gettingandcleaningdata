#README for Course Project - Getting and Cleaning Data



##Data Collection

A full description of the study can be found here - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project can be found here - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The study, "Human Activity Recognition Using Smartphones," recorded 30 subjects performing six activities through time using a waist-mounted
smartphone with embedded sensors that recorded a whole host of things I do not understand.

The participants were divided up randomly into a test group (with nine participants), and a training group (with 21 participants).

##The Data

Participant results were divided into two main data sets: test and train.

For each set, there were three separate files that contained all the pertinent data:

1. Data with the actual results for the 561 measurement variables (X_test and X_train)
2. Data with the activities in which the participants were engaged when the measurements were taken (Y_test and Y_train)
3. Data with the subject IDs for each each measurement observation (subject_test and subject_train)

There were additional data sets that described the measurement variable names (features.txt), and that described the activity codes (activity_labels.txt)

For the test data, there were 2,947 observations for 9 participants.

For the train data, there were 7,352 observations for 21 participants.

##The Assignment

For this course project, we were asked to:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

##My Solution

The solution is defined in the R script, run_analysis.R.