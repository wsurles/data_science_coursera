##| Regular Expressions
##| looking at baltimore homocide data

setwd('~/Dropbox/Classes/computing_for_data analysis_with_R/explore')
homicides <- readLines("homicides.txt")
homicides[1]
homicides[1000]

length(grep("iconHomicideShooting",homicides))
length(grep("iconHomicideShooting|icon_homicide_shooting",homicides))
length(grep("Cause: shooting",homicides))
length(grep("Cause: [Ss]hooting",homicides))
length(grep("[Ss]hooting",homicides))

i <- grep("[Ss]hooting",homicides)
j <- grep("[Cc]ause: [Ss]hooting",homicides)
str(i)
str(j)
setdiff(i,j)
setdiff(j,i)
homocides[859]
## the word shooting shows up in descriptions but it is not the cause

grep("^New",state.name)
grep("^New",state.name, value = T)
grepl("^New",state.name)

## Count homocides by count
grep("Cause: shooting",homicides))

length(homicides)
tmp <- homicides[grepl("Cause:", homicides)]
tmp[4]

match <- '<dd>[Ff]ound(.*)</dd>'
regexpr(match, homicides[1:10])
substr(homicides[1], 177, 177 + 93 -1)
## thats greedy. so we need to use .*?
match <- '<dd>[Ff]ound(.*?)</dd>'
regexpr(match, homicides[1:10])
substr(homicides[1], 177, 177 + 33 -1)

r <- regexpr(match, homicides[1:10])
x <- regmatches(homicides[1:10], r)
d <- gsub("<dd>[Ff]ound on |</dd>", "", x)
dd <- as.Date(d, "%B %d, %Y")

## regexec
match <- '<dd>[Ff]ound on (.*?)</dd>'
r <- regexec(match, homicides[1:10])
x <- regmatches(homicides[1:10],r)

## lets get the data and make a plot of all homocides
match <- '<dd>[Ff]ound on (.*?)</dd>'
r <- regexec(match, homicides)
m <- regmatches(homicides, r)
dates <- sapply(m, function(x) x[2])
dates <- as.Date(dates, "%B  %d, %Y")
hist(dates, "month", freq = T, col = 'green')
hist(dates, "year", freq = T, col = 'green')
hist(dates, "week", freq = T, col = 'green')