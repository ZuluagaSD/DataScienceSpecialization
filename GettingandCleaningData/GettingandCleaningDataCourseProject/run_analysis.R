
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

## Extract everything into the "UCI HAR Dataset" directory unless the directory
## exists

if (!file.exists("UCI HAR Dataset")) { 
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

## Start fixing the test and train data sets into a single table
## Read X_test.txt and X_train.txt into xtest tbl_df and change column
## names to corespond to the ones in features.txt file

tmpfeatures <- read.table("UCI HAR Dataset/features.txt")
features <- as.vector(tmpfeatures[, 2])

## Make variable names more readable by removing especial characters like "-"
## and "()" and making the variable names Syntactically Valid with the function
## make.names
features <- gsub("-", "", features)
features <- gsub("\\(\\)", "", features)
features <- make.names(features, unique = TRUE)
xtest <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))
colnames(xtest) <- as.vector(features)

xtrain <- tbl_df(read.table("UCI HAR Dataset/train/X_train.txt"))
colnames(xtrain) <- as.vector(features)

## Read y_test.txt and activity_labels.txt and join them together into
## activitytest and activitytrain tbl_df called activitytest and activitytrain 
## respectibly, delete the column with the integer value and rename the
## descriptive value as activity

activitylabels <- tbl_df(read.table("UCI HAR Dataset/activity_labels.txt"))

activitytest <- tbl_df(read.table("UCI HAR Dataset/test/y_test.txt"))
activitytest <- inner_join(activitytest, activitylabels, by.x = V1, by.y = V1)
activitytest <- select(activitytest, V2)
colnames(activitytest) <- c("activity")

activitytrain <- tbl_df(read.table("UCI HAR Dataset/train/y_train.txt"))
activitytrain <- inner_join(activitytrain, activitylabels, by.x = V1, by.y = V1)
activitytrain <- select(activitytrain, V2)
colnames(activitytrain) <- c("activity")

## Read subject_test.txt into tbl_df subjecttest and name subjecttest column
## as subject, finally bind all files together into tbl_df testdatafull

subjecttest <- tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))
colnames(subjecttest) <- c("subject")
testdatafull <- tbl_df(cbind(subjecttest, activitytest, xtest))

subjecttrain <- tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt"))
colnames(subjecttrain) <- c("subject")
traindatafull <- tbl_df(cbind(subjecttrain, activitytrain, xtrain))

## Select only the columns we want, mean and standard deviation, from
## testdatafull and traindatafull, put the result into testdata and traindata
## and finally append both together and order by subject and activity and
## save the tbl_df as tidyfulldata and cvs file tidyfulldata.txt

testdata <- select(testdatafull, 1:2, contains("mean"), contains("std"))
traindata <- select(traindatafull, 1:2, contains("mean"), contains("std"))
tidyfulldata <- rbind(testdata, traindata)
tidyfulldata <- tidyfulldata[order(tidyfulldata$subject), ]
write.table(tidyfulldata, file = "tidyfulldata.txt", sep = ",")

## Finally create a new tbl_df called summarizedtidyfulldata by subject and
## activity name with the mean of all variables

summarizedtidyfulldata <- tidyfulldata %>%
                        group_by(subject, activity) %>%
                        summarise_each(funs(mean))

write.table(summarizedtidyfulldata, file = "summarizedtidyfulldata.txt",
            row.name=FALSE)
