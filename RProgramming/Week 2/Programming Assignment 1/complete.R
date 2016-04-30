
# Write a function that reads a directory full of files and reports the number of
# completely observed cases in each data file. The function should return a data 
# frame where the first column is the name of the file and the second column is 
# the number of complete cases. A prototype of this function follows

complete <- function(directory, id = 1:332) {
    count_complete <- function(fname) sum(complete.cases(read.csv(fname)))
    fnames <- list.files(directory, full.names=TRUE)[id]
    data.frame(id = id, complete = unlist(lapply(fnames, count_complete)))
}
