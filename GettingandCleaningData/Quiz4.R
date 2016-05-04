
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

GDP <- read.csv("getdata-data-GDP.csv", skip = 10, nrows = 191)
GDP <- GDP[X != ""]
GDP <- GDP[, list(X, X.1, X.3, X.4)]
setnames(GDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "GDP"))


temp <- read.csv("getdata-data-GDP.csv", skip = 5, nrows = 190)
gdp <- tbl_df(temp)

sub(",", "", gdp$X.5)
