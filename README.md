==================================================================
Analysis of Human Activity Recognition Using Smartphones Dataset
==================================================================
Version 1.0

run_analysis.R is the R script which to collect, work with, and clean UCI HAR Dataset. 
It is to prepare tidy data that can be used for later analysis. 


### The raw data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
* A full description is available at the site where the data was obtained: [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are the data for the project.


### How to use run_analysis.R

Before read the script, make sure you have all the raw data. If not, download and unzip in your working directory. Then in your R environment, read the script. It will generate an output file named tidydata2.txt. That is the tidy data!


### What the script will do

run_analysis.R does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 

* To pick up measurements on the mean and standard deviation, I grep the keyword by "mean" or "std" from all columns.
* grep("mean|std", columnname, value = TRUE)

3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


### The related files

The Analysis includes the following files:
- 'ReadMe.md'
- 'CodeBook.md': CodeBook for the independent tidy data set with the average of each variable for each activity and each subject. 
- 'run_analysis.R': the R script which to collect, work with, and clean UCI HAR Dataset. 

