
# Download the Data Set

dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

# Look at the files

list.files("diet_data")

# Take a look inside Andy's file

andy <- read.csv("diet_data/Andy.csv")
head(andy)

length(andy$Day)

# Get a feel of the file

str(andy)
summary(andy)
names(andy)

andy[1, "Weight"]

andy[30, "Weight"]

andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]

subset(andy$Weight, andy$Day==30)

# Save the Weight of Andy @ the start and end

andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]

# See how much Weight did Andy loose

andy_loss <- andy_start - andy_end
andy_loss

# Look at the files I have

list.files("diet_data/")

# Let's take the output of list.files() and store it:

files <- list.files("diet_data/")
files

files[1]
files[2]
files[1:3]

# Let's take a quick look at John.csv:

head(read.csv(files[3]))

files_full <- list.files("diet_data/", full.names = TRUE)
files_full

head(read.csv(files_full[3]))

# Add David to the Andy Data Frame:

andy_david <- rbind(andy, read.csv(files_full[2]))

head(andy_david)
tail(andy_david)

day_25 <- andy_david[which(andy_david$Day == 25), ]
day_25

# What happens in a loop

for (i in 1:5) {print(i)}

# Append data from all files

dat <- data.frame()

for (i in 1:length(files_full)) {
    dat <- rbind(dat, read.csv(files_full[i]))
    print(i)
}

# Look at the data set

str(dat)
summary(dat)
names(dat)

# Look about the data set of only one person

str(subset(dat, dat$Patient.Name == "David"))
summary(subset(dat, dat$Patient.Name == "David"))
names(subset(dat, dat$Patient.Name == "David"))

# The median of Weight

median(dat$Weight)
median(dat$Weight, na.rm = TRUE)

# The median of Weight in day 30

median(subset(dat$Weight, dat$Day == 30))

weightmedian <- function(directory, day)  {
    files_list <- list.files(directory, full.names=TRUE)    # Creates a list of files
    dat <- data.frame()                                     # Creates an empty data frame
    for (i in 1:5) {                                    
        dat <- rbind(dat, read.csv(files_list[i]))          # Loops through the files, rbinding them together 
    }
    dat_subset <- dat[which(dat[, "Day"] == day),]          # Subsets the rows that match the 'day' argument
    median(dat_subset[, "Weight"], na.rm=TRUE)              # Identifies the median weight 
                                                            # While stripping out the NAs
}

# Better way to append data into a Data Frame

summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)

# Now we need to read in those csv files and drop them into tmp.

for (i in seq_along(files_full)) {
    tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

# This is the same with lapply

str(lapply(files_full, read.csv))

str(tmp[[1]])
head(tmp[[1]][,"Day"])

# Now bind the list of data frames into a single data frame

output <- do.call(rbind, tmp)
str(output)
