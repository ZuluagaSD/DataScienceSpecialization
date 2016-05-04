
## Download and unzip the Data Set into folder

gdp_url <- paste("https://d396qusza40orc.cloudfront.net/",
                     "getdata%2Fdata%2FGDP.csv", sep = "")

download.file(gdp_url, "getdata-Fdata-FGDP.csv")

stats_url <- paste("https://d396qusza40orc.cloudfront.net/",
                 "getdata%2Fdata%2FEDSTATS_Country.csv", sep = "")

download.file(stats_url, "getdata-Fdata-FEDSTATS_Country.csv")

## Read files as dataframe into variable gdp and fedStats

gdp <- read.csv("getdata-Fdata-FGDP.csv", skip = 5, header = FALSE, sep = ",",
                blank.lines.skip = TRUE, stringsAsFactors = FALSE,
                strip.white=TRUE)

fedStats <- read.csv("getdata-Fdata-FEDSTATS_Country.csv", sep = ",",
                     blank.lines.skip = TRUE, stringsAsFactors = FALSE,
                     strip.white=TRUE)

## Delete blank records from gdp and covert V2 and V5 into numeric

gdp <- gdp[gdp$V1 != "", ]
gdp[, 2] <- as.numeric(gsub(",", "", gdp$V2))
gdp[, 5] <- as.numeric(gsub(",", "", gdp$V5))

## Join gdp and fedStats into file joinedData

joinedData <- merge(gdp, fedStats, by.x = "V1", by.y = "CountryCode")

## GDP ranking for the "High income: OECD"
mean(joinedData[joinedData$Income.Group == "High income: OECD", 2])

## GDP ranking for the "High income: nonOECD" 
mean(joinedData[!is.na(joinedData$V2) & joinedData$Income.Group == 
                    "High income: nonOECD", 2])
