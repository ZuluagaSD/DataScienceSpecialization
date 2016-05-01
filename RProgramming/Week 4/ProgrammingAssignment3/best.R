
## Download and unzip the Data Set into ProgAssignment3Files folder

dataset_url <- paste("https://d396qusza40orc.cloudfront.net/rprog%2Fdata",
                "%2FProgAssignment3-data.zip", sep = "")
download.file(dataset_url, "2FProgAssignment3-data.zip")
unzip("2FProgAssignment3-data.zip", exdir = "ProgAssignment3Files")

outcomeData <- read.csv("ProgAssignment3Files/outcome-of-care-measures.csv",
                    colClasses = "character")
hospData <- read.csv("ProgAssignment3Files/hospital-data.csv",
                     colClasses = "character")

## Histogram of the 30-day death rates from heart attack

outcomeData[, 11] <- as.numeric(outcomeData[, 11])
hist(outcomeData[, 11])

best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    
    outCheck <- match(outcome, c("heart attack", "heart failure",
                                        "pneumonia"))
    
    if (is.na(outCheck)) {
        stop(print("invalid outcome"))
    }
    
    state <- toupper(state)
    
    stateCounter <- dim(subset(outcomeData, outcomeData$"State" == state,
                               select = "State"))
    
    if (stateCounter[1] == 0) {
        stop(print("invalid state"))
    }
    
    ## Return hospital name in that state with lowest 30-day death
    
    if (tolower(outcome) == "heart attack") {
        qtype <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (tolower(outcome) == "heart failure") {
        qtype <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (tolower(outcome) == "pneumonia") {
        qtype <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    }
    
    tmpData <- subset(outcomeData, outcomeData$State == state,
                      select = c("Hospital.Name", qtype))
    
    colnames(tmpData) <- c("Hospital.Name","Mort.Rate")
    
    ## rate
    
    tmpData[, 2] <- as.numeric(tmpData[, 2])
    tmpData[, 1] <- as.factor(tmpData[, 1])
    tmpData <- tmpData[order(tmpData$Hospital.Name, decreasing = TRUE), ]

    rate <- tmpData[which.min(tmpData$Mort.Rate), ]
    bestRate <- rate[1, sort(1, decreasing = TRUE)]
    bestRate <- rate[1, 1]
    bestRate
}
