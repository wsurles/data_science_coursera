##| Quiz 3

##| Problem 1
if (!file.exists("data")) dir.create("data")
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/housing_survey_2006.csv", method = "curl")
list.files("./data")
housing <- read.csv("./data/housing_survey_2006.csv")
str(housing)

## households on greater than 10 acres 
## - ACR = 3
# Who sold more than $10,000 worth of agriculture products. 
##- AGS = 6
# Assign that logical vector to the variable agricultureLogical. 
# Apply the which() function like this to identify the rows of the data frame 
# where the logical vector is TRUE. which(agricultureLogical) 
# What are the first 3 values that result?
bool <- housing$ACR == 3 & housing$AGS == 6
which(bool)[1:3]
## 125 238 262

##| Problem 2
install.packages("jpeg")
library(jpeg)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,destfile="./data/pic.jpg",method="curl")
df <- readJPEG("./data/pic.jpg", native = T)
quantile(df, probs = c(0.3,0.8))
##| Problem 3

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
## How many of the IDs match? 
## Sort the data frame in descending order by GDP rank. 
## What is the 13th country in the resulting data frame? 
df <- merge(gdp2,edu, by.x = "X", by.y = "CountryCode")

## Part 1
length(df$X)
## 189

## Part 2
df2 <- arrange(df, US.dollars.)
df2$Short.Name[13]
## St. Kitts and Nevis

##| Problem 4
mean(df$Ranking[as.character(df$Income.Group) == "High income: OECD"])
mean(df$Ranking[as.character(df$Income.Group) == "High income: nonOECD"])    
## 32.96667, 91.91304

##| Problem 5
tmp <- as.data.frame(quantile(df2$Ranking, probs = c(0, 0.2, 0.4, 0.6, 0.8)))
colnames(tmp) <- "quantile"
for (i in 1:length(tmp$quantile)) {
  df2$rank_quantile[df2$Ranking >= tmp$quantile[i]] <- i
}
table(df2$rank_quantile)
df3 <- as.data.frame(table(df2$rank_quantile, df2$Income.Group))
ans <- subset(df3, Var1 == 1 & Var2 == "Lower middle income")
## 5

