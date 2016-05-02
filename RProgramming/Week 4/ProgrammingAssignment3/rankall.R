
rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that outcome is valid
    
    outCheck <- match(outcome, c("heart attack", "heart failure",
                                 "pneumonia"))
    
    if (is.na(outCheck)) {
        stop(print("invalid outcome"))
    }
    
    ## Return hospital name in that state with lowest 30-day death
    
    if (tolower(outcome) == "heart attack") {
        qtype <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (tolower(outcome) == "heart failure") {
        qtype <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (tolower(outcome) == "pneumonia") {
        qtype <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    }
    
    tmpData <- subset(outcomeData, select = c("Hospital.Name", "State", qtype))
    
    colnames(tmpData) <- c("hospital", "state", "Mort.Rate")
    
    # tmpData <- aggregate(tmpData$Mort.Rate ~ tmpData$State, tmpData, min)
    
    ## rate
    
    tmpData[, 1] <- as.factor(tmpData[, 1])
    tmpData[, 2] <- as.factor(tmpData[, 2])
    tmpData[, 3] <- as.numeric(tmpData[, 3])
    
    tmpData <- tmpData[complete.cases(tmpData), ]
    tmpData <- tmpData[order(tmpData$state, tmpData$Mort.Rate,
                             tmpData$hospital, decreasing = FALSE), ]
    
    if (num == "best" || num != "worst") {
        if (num == "best") {
            num <- c(1)
            result <- aggregate(tmpData, by = list(tmpData$state),
                                FUN = function(x) x[num])
        } else {
            result <- aggregate(tmpData, by = list(tmpData$state),
                                FUN = function(x) x[num])
        }
        
    } else if (num == "worst") {
        result <- aggregate(tmpData, by = list(tmpData$state),
                            FUN = function(x) x[length(x)])
    }
    
    result[,3] <- result[,1]
    result <- data.frame(result[,-1], row.names = result[,1])
    result <- result[,c(1, 2)]
    result
}
