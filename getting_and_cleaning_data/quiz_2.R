##| Quiz 2


##|------------------
##| Github oath
##|------------------
library(httr)
library(httpuv)
library(jsonlite)

##| Find OAuth settings for github:
## http://developer.github.com/v3/oauth/
oauth_endpoints("github")

##| Go to Git hub and register and application
## https://github.com/settings/applications
## Application Name:  Whatever
## Homepage Url:  https://api.github.com/users/jtleek/repos
## Application description: whatever
## Authorization Callback Url: http://localhost:1410

##| Create an app with your id and secret
myapp <- oauth_app("github", "client_id", "client_secret")

##| Get OAuth credentials and store to local file
## You will be prompted to cache auth files 
## It will add this to git ignore 
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

##| Use API
req <- GET("https://api.github.com/rate_limit", config(token = github_token))
stop_for_status(req)
content(req)

##| Quiz answer
data <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
json1 <- content(data)
json2 <- jsonlite::fromJSON(toJSON(json1))
str(json2)
as.data.frame(json2)
json2[1:1000,1:4]
json2[4,1:length(json2[[4]])]
df <- data.frame(repo_name = unlist(json2$url),
            created_at = unlist(json2$created_at))
tmp <- subset(json2, json2$name == 'https://api.github.com/users/jtleek/datasharing')
unlist(tmp$created_at)

unlist(json1$git_url)

##|

library(XML)
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
htmlCode = readLines(url)
t(nchar(htmlCode))

##|

#reading data
getwd()
temp <- readLines("getdata-wksst8110.for", n=6)
#look for the last digit before "blank", "-" or "end of line"
c=gregexpr("[0-9][[:blank:]]|[0-9][-]|[0-9]$",temp[5])
col=c[[1]]
n=length(col)
#find column width out of starting positions
col[2:n]=col[2:n]-col[1:(n-1)] 
#use col to read the data 
data <-read.fwf("getdata-wksst8110.for", skip=4, width=col)
head(data)
sum(data$V4)

file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
file <- "http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"
data <- read.fwf(file, widths = c(9,4,4), col.names = c("1","2","3"), header = F, skip = 0)
head(data)
read.fwf(file, widths, header = FALSE, sep = "\t",
         skip = 0, row.names, col.names, n = -1,
         buffersize = 2000, ...)

read.fwf(file, widths=9, header = FALSE, sep = " ",
         skip = 2, n = -1,
         buffersize = 2000)
str(data)
htmlCode = readLines(url)

