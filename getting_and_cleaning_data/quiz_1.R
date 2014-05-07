##| quiz 1

##| Question 1
##| - How many houses are worth more than 1M
if (!file.exists("data")) dir.create("data")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/survey.csv", method = "curl")
list.files("./data")

df <- read.csv("./data/survey.csv")

str(df)
head(df)

## VAL is the property value
## Coded so that 24 means 1M+
table(df$VAL)
## 53 is the answer

##| Question 3
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

##| Question 4
library(XML)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile="./data/stuff.xml", method="curl") 
doc <- xmlTreeParse("./data/stuff.xml", useInternalNodes=T)
rootNode <- xmlRoot(doc)

xml_list <- xmlToList(doc)
xml_list <- xmlToList(rootNode)
xml_list$row$row
out <- data.frame(
  as.list(xml_list)),
  "start_valid_time" = start_time,
  "hourly_temperature" = temps)
zip <- as.list(xml_list[["row"]][["zipcode"]][["zipcode"]])
rootNode <- xmlRoot(doc)

xmlName(rootNode)

names(rootNode)

rootNode[[1]]

rootNode[[1]][[1]]

xmlSApply(rootNode, xmlValue)

xmlAttrs(xmlRoot(doc))

xmlAttrs(xmlRoot(doc)[["zipcode"]])

xpathSApply(rootNode, "//row", xmlValue)

xpathSApply(rootNode, "//row:zipcode", xmlValue), xmlGetAttr, "rate", namespaces = namespaces )
?xpathSApply(rootNode, "//zipcode", xmlValue)

rates = xpathApply(doc, "//ns:Cube[@currency='SIT']", xmlGetAttr, "rate", namespaces = namespaces )
rates = xpathApply(doc, "//ns:Cube[@currency='SIT']", xmlGetAttr, "rate", namespaces = namespaces )
getNodeSet(doc, res)




#####
# European Central Bank (ECB) exchange rate data

# Data is available from "http://www.ecb.int/stats/eurofxref/eurofxref-hist.xml"
# or locally.

uri = system.file("exampleData", "eurofxref-hist.xml.gz", package = "XML")
doc = xmlParse(uri)

# The default namespace for all elements is given by
namespaces <- c(ns="http://www.ecb.int/vocabulary/2002-08-01/eurofxref")


# Get the data for Slovenian currency for all time periods.
# Find all the nodes of the form <Cube currency="SIT"...>

slovenia = getNodeSet(doc, "//ns:Cube[@currency='SIT']", namespaces )

# Now we have a list of such nodes, loop over them 
# and get the rate attribute
rates = as.numeric( sapply(slovenia, xmlGetAttr, "rate") )
# Now put the date on each element
# find nodes of the form <Cube time=".." ... >
# and extract the time attribute
names(rates) = sapply(getNodeSet(doc, "//ns:Cube[@time]", namespaces ), 
                      xmlGetAttr, "time")

#  Or we could turn these into dates with strptime()
strptime(names(rates), "%Y-%m-%d")


#  Using xpathApply, we can do
rates = xpathApply(doc, "//ns:Cube[@currency='SIT']", xmlGetAttr, "rate", namespaces = namespaces )
rates = as.numeric(unlist(rates))

# Using an expression rather than  a function and ...
rates = xpathApply(doc, "//ns:Cube[@currency='SIT']", quote(xmlGetAttr(x, "rate")), namespaces = namespaces )

#free(doc)