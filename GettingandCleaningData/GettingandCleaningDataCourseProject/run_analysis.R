
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

## Read files
## Start reading features files to assign the column names

tmpfeatures <- read.table("UCI HAR Dataset/features.txt")
features <- as.vector(tmpfeatures[, 2])

## Start fixing the test data set

xtest <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))
subjtest <- tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))
activity <- tbl_df(read.table("UCI HAR Dataset/test/y_test.txt"))

str(full_join(subjtest, activity))
mutate(subjtest)
colnames(xtest) <- as.vector(features)
