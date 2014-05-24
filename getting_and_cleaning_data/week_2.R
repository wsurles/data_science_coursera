##| Week 2

##|---------------------------------
##| Getting Data from MySQL database
##|---------------------------------
library(RMySQL)

##| Connecting and listing databases
ucscDb <- dbConnect(MySQL(),
                    user = "genome",
                    host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;")
dbDisconnect(ucscDb)

result

##| connecting to hg19 and listing tables
hg19 <- dbConnect(MySQL(),
                  user = "genome",
                  db = "hg19",
                  host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)

length(allTables)

allTables[1:5]

##| Get dimensions of specific table
dbListFields(hg19, "affyU133Plus2")

dbGetQuery(hg19,"select count(*) from affyU133Plus2")

##| Read from the table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

##| Select a specific subset

## Send query to database. It will not return yet.
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")

## Get database to return the data requested in the query
affyMis <- fetch(query)
str(affyMis)
quantile(affyMis$misMatches) # yep, looks like it worked

## just return the top 10 rows of the query to test query without waiting for all the data
affyMisSmall <- fetch(query, n=10)

## Clear the result so the query is not sitting on the database
dbClearResult(query)

dim(affyMisSmall)
dbDisconnect(hg19)

##|------------------------
##| Getting Data from HDF5
##|------------------------
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")
created

##| Create groups
created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")

##| Write to groups
A = matrix(1:10, nr=5, nc=2)
h5write(A, "example.h5", "foo/A")
B = array(seq(0.1, 2.0, by=0.1), dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5","foo/foobaa/B")
h5ls("example.h5")

##| Write a dataset
df = data.frame(1L:5L, 
                seq(0,1,length.out=5),
                c("ab","cde","fgi","a","s"),
                stringsAsFactors=F
                )
h5write(df, "example.h5","df")
h5ls("example.h5")

##| Reading data
readA = h5read("example.h5","foo/A")
readB = h5read("example.h5","foo/foobaa/B")
readdf = h5read("example.h5","df")

##| Writing and reading chunks
h5write(c(12,13,14), "example.h5","foo/A", index=list(1:3,1))
h5read("example.h5","foo/A")

##|--------------------------
##| Getting Data from the Web
##|--------------------------

##| Web scraping
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)


##| Parsing with XML
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)
xpathSApply(html, "//title", xmlValue)
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

##| GET from the httr package
##|- This is more round about but the package is needed for autentication
library(httr)
html2 <- GET(url)
content2 <- content(html2, as="text")
parsedHtml <- htmlParse(content2, asText=T)
xpathSApply(parsedHtml, "//title", xmlValue)

##| Accessing websites with passwords

## Give 401 because it requires a password
pg1 <- GET("http://httpbin.org/basic-auth/user/passwd")
pg1

pg2 <- GET("http://httpbin.org/basic-auth/user/passwd",
           authenticate("user","passwd"))
pg2

names(pg2)
str(pg2)
head(pg2)

##| Using handles
##|- Allows me to not have to authenticate everytime I hit a webpage
google = handle("http://google.com")
pg1 = GET(handle=google, path = "/")
pg2 = GET(handle=google, path = "search")

##|------------------------
##| Reading data from APIs
##|------------------------

##| Accessing Twitter from R
library(httr)
source("getAPICredsTwitter.R")
api <- getAPICredsTwitter()
myapp <- oauth_app("twitter",
                  key=api$key,
                  secret=api$secret)
sig <- sign_oauth1.0(myapp,
                    token = api$token,
                    token_secret = api$token_secret)
homeTL <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

rm(api)
##| Converting the json object
library(rjson)
json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]





