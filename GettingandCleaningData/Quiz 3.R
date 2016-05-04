
## Download and unzip the Data Set into ProgAssignment3Files folder

dataset_url <- paste("https://d396qusza40orc.cloudfront.net/",
                     "getdata%2Fdata%2FGDP.csv", sep = "")

download.file(dataset_url, "getdata-Fdata-FGDP.csv")

## Read file as dataframe into variable gdp

gdp <- read.csv("getdata-Fdata-FGDP.csv", skip = 5, header = FALSE,
                sep = ",", blank.lines.skip = TRUE,
                stringsAsFactors = FALSE, strip.white=TRUE)

gdp <- gdp[gdp$V1 != "", ]

gdp[, 5] <- as.numeric(gsub(",", "", gdp$V5))
