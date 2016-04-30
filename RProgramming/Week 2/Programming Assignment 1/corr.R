
# Write a function that takes a directory of data files and a threshold for
# complete cases and calculates the correlation between sulfate and nitrate for
# monitor locations where the number of completely observed cases (on all variables)
# is greater than the threshold. The function should return a vector of correlations
# for the monitors that meet the threshold requirement. If no monitors meet the 
# threshold requirement, then the function should return a numeric vector of 
# length 0. A prototype of this function follows

corr <- function(directory, threshold = 0) {
    
    moni <- complete("specdata")
    
    files <- subset(moni, moni$complete >= threshold)$id
    
    all_files <- list.files(directory, full.names = TRUE)
    print(all_files[files])
    tmpDataSet <- lapply(all_files[files], read.csv)
    
    output <- do.call(rbind, tmpDataSet)
    
    summary(output)
    
    cor(output$sulfate, output$nitrate, use = "complete.obs")
}

corr("specdata/", 150)
