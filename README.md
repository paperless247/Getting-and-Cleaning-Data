# Getting and Cleaning Data Course Project

## Introduction

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set, and to prepare tidy data that can be used for later analysis.

I have three files in this github repo:
- README.md (this file)
- CodeBook.md describes the variables, the data, and any transformations
- run_analysis.R is R script to create tiny data

## run_analysis.R

### Before running the script:

Do the following steps before running the script!

1. Make sure run_analysis.R in the current work directory
2. Check if you have subfolder "UCI HAR Dataset" with more subfolders and files
  + If you do not have the subfolder
    + Download the file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    + Unzip the zip file in the current work directory
    + Make sure you have subfolder "UCI HAR Dataset" in the work directory with dir()
  + If you have the subfolder "UCI HAR Dataset", you are ready to run run_analysis.R

### Running the script

run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set ("tidydata.txt") with the average of each variable for each activity and each subject. 

**Running run_analysis.R**, you will get the following output:

1. You will see the measurements on the mean and standard deviation for each measurement
2. New file tidydata.txt in the current work directory


## Processing steps

1. Read the data sets
  - Read training set, its labels, and its subjects
  - Rename some variables to match them between data sets
  - cbind() to combine them into one data set "train"
  - Do the same steps to create data set "test"
  - Read activity file (6 activities)
  - Read feature file (561 features)

2. Merges the training and the test sets to create one data set.
  - rbind() to combine train and test data sets into dat
  - remove interim data sets

3. Extracts only the measurements on the mean and standard deviation for each measurement.
  - apply() to calculate the mean and sd
  - print on the screen

4. Uses descriptive activity names to name the activities in the data set
  - Rename the activity codes with activity names after matching with activity data
  
5. Appropriately labels the data set with descriptive variable names. 
  - Rename the variables with features

6. Creates tidy data set ("tidydata.txt")
  - Group the data for each activity and subject
  - Calculate the mean
  - Appropriately label the new data set
  - write the data set to "tidydata.txt"


## Notes

- X_* - feature values (one row of 561 features for a single activity)
- Y_* - activity identifiers (for each row in X_*)
- subject_* - subject identifiers for rows in X_*

