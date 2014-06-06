##| Quiz 4

##| Problem 1
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./data/housing_idaho.csv", method="curl")
df <- read.csv("./data/housing_idaho.csv")

str(df)
names(df)
tmp <- strsplit(names(df), "wgtp")
tmp[123]

##| Problem 2
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./data/gdp.csv", method = "curl")
gdp <- read.csv("./data/gdp.csv",
                skip = 3,
                stringsAsFactors = F)
str(gdp)
mean_dollars <- mean(as.numeric(gsub(",","", gdp$US.dollars.)), na.rm=T)

gdp$Ranking <- as.numeric(gdp$Ranking)
gdp$US.dollars. <- as.numeric(gsub(",","", gdp$US.dollars.))

gdp2 <- subset(gdp, US.dollars. > 0 & Ranking > 0)
str(gdp2)
mean(gdp2$US.dollars.)

##| Problem 3
Sys.getlocale()
Sys.setlocale(locale="C")
grep("^United",gdp2$Economy), 3 ## This one!

##| Problem 4
## Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl1, destfile = "./data/gdp.csv", method = "curl")
gdp <- read.csv("./data/gdp.csv",
                skip = 3,
                stringsAsFactors = F)

gdp$Ranking <- as.numeric(gdp$Ranking)
gdp$US.dollars. <- as.numeric(gsub(",","", gdp$US.dollars.))

gdp2 <- subset(gdp, US.dollars. > 0 & Ranking > 0)

## Load the educational data from this data set: 
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl2, destfile = "./data/edu.csv", method = "curl")
edu <- read.csv("./data/edu.csv")

## Match the data based on the country shortcode. 
df <- merge(gdp2,edu, by.x = "X", by.y = "CountryCode")

grep("Fiscal year end: June", df$Special.Notes, value=T)

## Answer
## 13

##| Question 4

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

time <- ?as.POSIXlt(sampleTimes)
names(unclass(time))
time$wday
time$year
sum(time$year == 112)
sum(time$wday == 1 & time$year == 112)
## Answer
## 250, 47
