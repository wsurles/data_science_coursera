##| Quiz 1

##|-------------------------------------------
##| Question 1
##| - How many houses are worth more than 1M
##|-------------------------------------------

## make a place to put the data
if (!file.exists("data")) dir.create("data")

## get the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/survey.csv", method = "curl")
list.files("./data")
df <- read.csv("./data/survey.csv")

## VAL is the property value
## its oded so that 24 means 1M+
table(df$VAL)

## Answer: 53

##|-------------------------------
##| Question 3
##| - ONly applies to a subset of the data
##| - What is the value of: sum(dat$Zip*dat$Ext,na.rm=T) 
##|-------------------------------

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/natural_gas.xlsx", method = "curl")

col_index <- 7:15
row_index <- 18:23
dat <- read.xlsx("./data/natural_gas.xlsx", 
                sheetIndex=1, 
                header=TRUE,
                colIndex=col_index,
                rowIndex=row_index)
sum(dat$Zip*dat$Ext,na.rm=T)

## Answer: 36534720

##|------------------------------------
##| Question 4
##| - How many restaurants have zipcode 21231?
##|------------------------------------

library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternalNodes=T)

zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zipcodes == "21231")

## Answer: 127

##|------------------------------------------
##| Question 5
##| - 
library(data.table)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./data/community.csv", method = "curl")
DT <- fread("./data/community.csv")
pwgtp15 

sapply(split(DT$pwgtp15,DT$SEX),mean)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
mean(DT$pwgtp15,by=DT$SEX)
DT[,mean(pwgtp15),by=SEX]
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
tapply(DT$pwgtp15,DT$SEX,mean)



