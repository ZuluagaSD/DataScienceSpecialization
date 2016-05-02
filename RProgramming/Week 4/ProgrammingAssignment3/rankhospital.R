
rankhospital <- function(state, outcome,  num = "best") {
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
    tmpData <- tmpData[order(tmpData$Mort.Rate, tmpData$Hospital.Name, decreasing = FALSE), ]
    tmpData <- tmpData[complete.cases(tmpData), ]
    
    if (num == "best") {
        num <- c(1)
    } else if (num == "worst") {
        num <- dim(tmpData)[1]
    }
    
    rate <- tmpData[num, ]

    bestRate <- rate[1, sort(1, decreasing = TRUE)]
    bestRate <- rate[1, 1]
    
    if (is.na(bestRate)) {
        bestRate <- NA
    }
    as.character(bestRate)
}
