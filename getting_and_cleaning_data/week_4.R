##| week 4

##|------------------------
##| Editing Text Variables
##|------------------------

##| Fixing character vectors
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv", method="curl")
cameraData <- read.csv("./data/cameras.csv")

## lower
names(cameraData)
tolower(names(cameraData))

## split
splitNames <- strsplit(names(cameraData),"\\.")
splitNames

##| Working with lists
mylist <- list(letters = c("A","b","c"),
               numbers = 1:3,
               matrix(1:25, ncol=5))
head(mylist)

mylist[1]
mylist$letters
mylist[[1]]

str(mylist[1])
str(mylist$letters)
str(mylist[[1]])

##| Ficing characater vecotrs - sapply
splitNames[[6]][1]

firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

##| Peer review dta
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
download.file(fileUrl1, destfile="./data/reviews.csv", method="curl")
reviews <- read.csv("./data/reviews.csv");
head(reviews,2)

fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl2, destfile="./data/solutions.csv", method="curl")
solutions <- read.csv("./data/solutions.csv");
head(solutions,2)

##| Finxing character vectors - sub()
names(reviews)
sub("_","",names(reviews),)

tmp <- "my_name_is_William"
sub("_","",tmp)
gsub("_","",tmp)

##| Finding values - grep grepl
grep("Alameda", cameraData$intersection)

table(grepl("Alameda", cameraData$intersection))

cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]

grep("Alameda", cameraData$intersection, value=T)

grep("JeffStreet", cameraData$intersection)

length(grep("JeffStreet", cameraData$intersection))
length(grep("Alameda", cameraData$intersection))

##| More useful string functions
library(stringr)
nchar("Jeffrey Leek")

substr("Jeffrey Leek", 1, 7)

paste("Jeffrey","Leek")
paste0("Jeffrey","Leek")

str_trim("Jeff      ")

##|---------------------
##| Regular Expressions
##|---------------------

^i think # match beginning of line
morning$ # match end of line
[Bb][Uu][Ss][Hh] # list a set of characters we will accept at a given point in the line
^[Ii]
^[0-9][a-zA-Z] # will math 7th..., 2nd...
[^?.]$ # means does not end in ? or .
. # any character
| # or
^[Gg]ood|[Bb]ad # G/good at the begining or B/bad anywhere
^([Gg]ood|[Bb]ad) # G/good or B/bad at the begining
[Gg]eorge( [Ww]\.)? [Bb]ush # george bush, George Bush, George W. Bush
.* # any number of including none
+ # at least one






