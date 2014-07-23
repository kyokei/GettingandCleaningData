# read
features <- read.table("./UCI HAR Dataset/features.txt")
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

trainingset <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features[,2])
sprintf("trainingset:%d,%d",dim(trainingset)[1],dim(trainingset)[2])

traininglabels <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names="Activity")
sprintf("traininglabels:%d,%d",dim(traininglabels)[1],dim(traininglabels)[2])

trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="Subject")
sprintf("trainsubject:%d,%d",dim(trainsubject)[1],dim(trainsubject)[2])

testset <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features[,2])
sprintf("testset:%d,%d",dim(testset)[1],dim(testset)[2])

testlabels <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names="Activity")
sprintf("testlabels:%d,%d",dim(testlabels)[1],dim(testlabels)[2])

testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="Subject")
sprintf("subject_train:%d,%d",dim(testsubject)[1],dim(testsubject)[2])


# Merges the training and the test sets to create one data set.
trainingdata <- cbind(trainsubject,traininglabels,trainingset)
testdata <- cbind(testsubject,testlabels,testset)

dataset <- rbind(trainingdata, testdata)


# Extracts only the measurements on the mean and standard deviation for each measurement. 
columnname <- names(dataset)
columnnameselected <- columnname %in% c("Subject","Activity",grep("mean|std", columnname, value = TRUE))
tidydata1 <- subset(dataset, select=columnnameselected)


# Uses descriptive activity names to name the activities in the data set
tidydata1[,2] <- factor(tidydata1[,2], level=activitylabels[,1], label=activitylabels[,2])


# Appropriately labels the data set with descriptive variable names. 
columnname <- names(tidydata1)
columnname <- gsub("Acc", "Acceleration", columnname)
columnname <- gsub("Gyro", "Gyroscope", columnname)
columnname <- gsub("Mag", "Magnitude", columnname)
names(tidydata1) <- columnname


# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(plyr)
average <- function(x) mean(x)
tidydata2 <- ddply(tidydata1, .(Subject, Activity), colwise(average))


write.table(tidydata2, file = "tidydata2.txt", row.names = FALSE)
