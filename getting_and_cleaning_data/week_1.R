##| setting working directory
getwd()
setwd("~/Dev/non_work_projects/data_science_coursera/getting_and_cleaning_data")

##| looking for and creting a directory
file.exists("directory_name")
dir.create("directory_name")

##| Create a directory and download a file
##| - On a Mac if the url starts with https you need to set method = "curl"
if (!file.exists("data")) dir.create("data")

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")
list.files("./data")

dateDownloaded <- date()
dateDownloaded

##| Reading excel files
if (!file.exists("data")) dir.create("data")

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.xlsx", method = "curl")
dateDownloaded <- date()
list.files("./data")

library(xlsx)
cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex=1, header=TRUE)
head(cameraData)

colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("./data/cameras.xlsx", 
                              sheetIndex=1, 
                              colIndex=colIndex, 
                              rowIndex=rowIndex)
cameraDataSubset

##| Reading XML files
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternal=T)
rootNode <- xmlRoot(doc)

xmlName(rootNode)

names(rootNode)

rootNode[[1]]

rootNode[[1]][[1]]

xmlSApply(rootNode, xmlValue)

xmlAttrs(xmlRoot(doc))

xmlAttrs(xmlRoot(doc)[["variables"]])

xpathSApply(rootNode, "//name", xmlValue)

xpathSApply(rootNode, "//price", xmlValue)

##| XML Example 2
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternal=T)

scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)

## More XML functions practice (some work)
fileName <- system.file("exampleData", "mtcars.xml", package="XML") 
doc <- xmlTreeParse(fileName)
rootNode <- xmlRoot(doc)
xmlName(rootNode) # element name (w/w.o. namespace preﬁx)
xmlNamespace(rootNode)  # This does not work for some reason
xmlAttrs(rootNode) # all attributes
xmlGetAttr(rootNode) # particular value
xmlValue(rootNode) # get text content.
xmlChildren(rootNode) # node[[ i ]], node [[ "el-name" ]]
xmlSApply(rootNode, xmlValue)
xmlNamespaceDeﬁnitions(roadNode)

##| JSON Example
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login
myjson <- toJSON(iris, pretty=T)
cat(myjson)
iris2 <- fromJSON(myjson)
head(iris2)


##| data.table example
library(data.table)
DF = data.frame(x = rnorm(9), 
                y = rep(c("a","b","c"), each=3),
                z = rnorm(9)
                )
head(DF,3)

DT = data.table(x = rnorm(9), 
                y = rep(c("a","b","c"), each=3),
                z = rnorm(9)
                )

## see the tables in memory
tables()

## subsetting
DT[2,]
DT[DT$y=="a"]
DT[c(2,3)]
DT[,c(2,3)]

## expressions
{
  x=1
  y=2
}
k = {print(10); 5}
print(k)
DT[,list(mean(x), sum(z))]
DT[,table(y)]

## Adding columns
DT[,w:=z^2]

## Tables stay linked
DT2 <- DT
DT[, y:= 2]

head(DT, n=3)
head(DT2, n=3)
## both have y = 2

## multiple operations
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]

## plyr like operations
DT[,a:=x>0]
DT[,b:= mean(x+w), by=a]

## special values
set.seed(123);
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

## keys
DT <- data.table(x = rep(c("a","b","c"), each = 100), 
                 y = rnorm(300)
                 )
setkey(DT,x)
DT['a']

## Joins
DT1 <- data.table(x=c('a','a','b', 'dt1'), y = 1:4)
DT2 <- data.table(x = c('a','b','dt2'), z=5:7)
setkey(DT1,x)
setkey(DT2,x)
merge(DT1,DT2)

## fast reading
big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names=F, col.names=T, sep="\t", quote=F)
system.time(fread(file))
system.time(read.table(file, header=T, sep="\t"))

