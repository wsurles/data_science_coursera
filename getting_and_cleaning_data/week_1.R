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
