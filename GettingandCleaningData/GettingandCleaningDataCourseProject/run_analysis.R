
## Load all the libraries needed

library("dplyr")

## Download and unzip the Data Set into HARUSDataSet folder
dataset_url <- paste("https://d396qusza40orc.cloudfront.net/",
                     "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                     sep = "")

## Download the .zip file unless it already exists
if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")) {
    download.file(dataset_url, "getdata-projectfiles-UCI HAR Dataset.zip")
}

## Extract everything into the "UCI HAR Dataset" directory
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

## Start fixing the test data set into one single table
## Read X_test.txt into xtest tbl_df and change column names to corespond
## to the ones in features.txt file

tmpfeatures <- read.table("UCI HAR Dataset/features.txt")
features <- as.vector(tmpfeatures[, 2])
xtest <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))
colnames(xtest) <- as.vector(features)

## Read y_test.txt and activity_labels.txt and join them together into
## activitytest tbl_df called activitytest, delete the column with the integer
## value and rename the descriptive value as activity

activitytest <- tbl_df(read.table("UCI HAR Dataset/test/y_test.txt"))
activitylabels <- tbl_df(read.table("UCI HAR Dataset/activity_labels.txt"))
activitytest <- inner_join(activitytest, activitylabels, by.x = V1, by.y = V1)
activitytest <- select(activitytest, V2)
colnames(activitytest) <- c("activity")

## Read subject_test.txt into tbl_df subjecttest and name subjecttest column
## as subject, finally bind all files together

subjecttest <- tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))
colnames(subjecttest) <- c("subject")
testdata <- tbl_df(cbind(subjecttest, activitytest, xtest))

## Select only the columns we want, mean and standard deviation



################################ Testing ####################################

select(xtest, contains("mean"), contains("std"))

x <- as.data.frame(names(xtest)[duplicated(names(xtest))])
order(x$`names(xtest)[duplicated(names(xtest))]`)
