
# Download and unpack the data

dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "Fspecdata.zip")
unzip("Fspecdata.zip")

# Look at the files

list.files("specdata/")

# Get a feel of the data we have

f001 <- read.csv("specdata/001.csv")

head(f001)
summary(f001)
str(f001)
names(f001)

# Get all files into a data frame

full_files <- list.files("specdata/", full.names = TRUE)        # List of files

tmp <- vector(mode = "list", length = length(full_files))       # Temp list of the files
summary(tmp)

tmp <- lapply(full_files, read.csv)                             # Apply read.csv to the list of files
                                                                # and place everything into tmp object
airpollutionData <- do.call(rbind, tmp)                         # Bind all the files into airpollutionData object
str(airpollutionData)

# Write a function named 'pollutantmean' that calculates the mean of a pollutant
# (sulfate or nitrate) across a specified list of monitors. The function 
# 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
# particulate matter data from the directory specified in the 'directory' argument
# and returns the mean of the pollutant across all of the monitors, ignoring any
# missing values coded as NA. A prototype of the function is as follows

pollutantmean <- function(directory, pollutant, id = 1:332)  {

    files_list <- list.files(directory, full.names=TRUE)    # Creates a list of files
    dat <- data.frame()                                     # Creates an empty data frame
    for (i in id) {                                    
        dat <- rbind(dat, read.csv(files_list[i]))          # Loops through the files, rbinding them together 
    }

    mean(dat[, pollutant], na.rm=TRUE)              # Identifies the median weight 
}

# Write a function that reads a directory full of files and reports the number of
# completely observed cases in each data file. The function should return a data 
# frame where the first column is the name of the file and the second column is 
# the number of complete cases. A prototype of this function follows

complete <- function(directory, id = 1:332) {
    count_complete <- function(fname) sum(complete.cases(read.csv(fname)))
    fnames <- list.files(directory, full.names=TRUE)[id]
    data.frame(id = id, complete = unlist(lapply(fnames, count_complete)))
}
