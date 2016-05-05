
## Download data files

file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
if (!file.exists("getdata-data-ss06hid.csv")) {
    download.file(url = file_url, destfile = "getdata-data-ss06hid.csv")
}

library("dplyr")
library("stringr")

temp <- read.table("getdata-Fdata-Fss06hid.csv", header = TRUE, sep = ",",
                   stringsAsFactors = FALSE)

temp <- read.csv("getdata-Fdata-Fss06hid.csv", strip.white = TRUE)
surveydata <- tbl_df(temp)

strsplit(names(surveydata), split = "wgtp")[123]

file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
if (!file.exists("getdata-data-GDP.csv")) {
    download.file(url = file_url, destfile = "getdata-data-GDP.csv")
}

file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
temp <- "getdata-data-GDP.csv"

if (!file.exists("getdata-data-GDP.csv")) {
    download.file(file_url, temp)
}

GDP <- read.csv("getdata-data-GDP.csv", skip = 4, nrows = 191)
GDP <- GDP[X != ""]
GDP <- GDP[, list(X, X.1, X.3, X.4)]
setnames(GDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP",
                                             "Long.Name", "GDP"))


temp <- read.csv("getdata-data-GDP.csv", skip = 4, nrows = 190)
gdp <- tbl_df(temp)

gdp <- filter(gdp, !is.na(X))

gpdvalue <- sapply(select(gdp, X.4), function(v) {as.numeric(gsub("\\,","",
                                                      as.character(v)))})

mean(gpdvalue)

countryNames <- select(gdp, X.3)

grep("*United",countryNames)
grep("^United",countryNames)
grep("United$",countryNames)
grep("*United",countryNames)

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

temp <- sampleTimes[year(sampleTimes) == 2012]
temp1 <- temp[wday(temp) == 2]
