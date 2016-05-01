
## Download and unzip the Data Set into ProgAssignment3Files folder

dataset_url <- paste("https://d396qusza40orc.cloudfront.net/rprog%2Fdata",
                "%2FProgAssignment3-data.zip", sep = "")
download.file(dataset_url, "2FProgAssignment3-data.zip")
unzip("2FProgAssignment3-data.zip", exdir = "ProgAssignment3Files")

outcome <- read.csv("ProgAssignment3Files/outcome-of-care-measures.csv",
                    colClasses = "character")
head(outcome)

## Histogram of the 30-day death rates from heart attack

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
}
