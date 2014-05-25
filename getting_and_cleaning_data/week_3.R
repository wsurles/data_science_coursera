##| week 3

if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, 
              destfile="./data/restaraunts.csv",
              method="curl")
restData <- read.csv("./data/restaraunts.csv")

head(restData,n=10)

tail(restData,n=10)

str(restData)

restData$zipCode <- as.factor(restData$zipCode)

summary(restData)

quantile(restData$councilDistrict, na.rm=T)

## Choose your percentiles to look at
quantile(restData$councilDistrict, probs=c(0.5,.75,.9))

t <- table(restData$zipCode, useNA="ifany")
df <- as.data.frame(t)
library(plyr)
df2 <- arrange(df, desc(Freq))

##|-----------------
##| Reshaping Data
##|-----------------
library(reshape2)
head(mtcars)

##| Melting Data frame
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, 
                id=c("carname","gear","cyl"), 
                measure.vars = c("mpg","hp"))

head(carMelt, 3)
tail(carMelt, 3)

table(carMelt$variable)

cylData <- dcast(carMelt, cyl ~ variable)
cylData <- dcast(carMelt, cyl ~ variable, mean)






