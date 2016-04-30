
# Write a function that takes a directory of data files and a threshold for
# complete cases and calculates the correlation between sulfate and nitrate for
# monitor locations where the number of completely observed cases (on all variables)
# is greater than the threshold. The function should return a vector of correlations
# for the monitors that meet the threshold requirement. If no monitors meet the 
# threshold requirement, then the function should return a numeric vector of 
# length 0. A prototype of this function follows

source("complete.R")

corr <- function(directory, threshold = 0) {
    
    moni <- complete(directory)
    
    files <- subset(moni, moni$nobs >= threshold)$id
    
    if (length(files) == 0) { return(numeric()) }
    
    all_files <- list.files(directory, full.names = TRUE)

    tmpDataSet <- lapply(all_files[files], read.csv)
    
    # Get only comple cases
    
    comp <- lapply(tmpDataSet, complete.cases)
    clean_data <- Map(function(d,c) {d[c,]}, tmpDataSet, comp)
    clean_data <- lapply(tmpDataSet, function(x) x[complete.cases(x),])

    output <- do.call(rbind, clean_data)
    
    # Get correlation of 2 columns using ddply
    
    correlate <- function(output) {
        return(data.frame(COR = cor(output$sulfate, output$nitrate)))
    }
    
    resultDataF <- ddply(output, .(output$ID), correlate)
    
    resultVector <- resultDataF$COR
    resultVector
}
