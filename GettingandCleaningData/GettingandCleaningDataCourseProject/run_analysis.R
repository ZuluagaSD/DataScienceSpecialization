
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
