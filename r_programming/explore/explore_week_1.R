dir()
getwd()
setwd("/Users/williamsurles/Dropbox/Classes/computing_for_data analysis_with_R")

source("http://spark-public.s3.amazonaws.com/compdata/scripts/getmonitor-test.R")
getmonitor.testscript()

df = as.data.frame(vector())
df$test = seq(1:10)
?data.frame

x <- 1
print(x)
x
msg <- "hello"
test = vector("numeric", length = 10)
?vector

m <- matrix(1:4,nrow = 2, ncol = 2)
dim(m)
dimnames(m) <- list(c("a", "b"), c("c", "d"))

m2 <- 1:10
dim(m2) <- c(2,5)

x <- 1:3
y <- 10:12
m3 <- cbind(x,y)
m4 <- rbind(x,y)

x <- factor(c("yes","yes","no","yes","no"), levels = c("yes","no"))
x
table(x)
unclass(x)

x <- c(1, 2, NaN, 10, 3)
is.na(x)
is.nan(x)

x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
x
names(x)

x <- c("a", "b", "c", "c", "d", "a")
x[x > "a"]
u <- x > "a"
x[u]

x <- matrix(1:6, 2, 3)
x[1,2]
x[1,2, drop = FALSE]
x[1,]

x <- list(foo = 1:4, bar = 0.6, bax = "hello")
x1 <- x[1]
x2 <- x[[1]]

class(x1)
class(x2)

class(x$bar)
class(x[["bar"]])
class(x["bar"])

x[c(1,3)]

name <- "foo"

x[[name]]
x$name
x$foo

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]
x[[c(2, 1)]]

x <- list(aardvark = 1:5)
x$a
x[["a", exact = FALSE]]

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", "f", NA)
good <- complete.cases(x, y)
bad <- is.na(x)
good
x[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

# vectorized operations
x <- 1:4
y <- 6:9
x + y
x > 2
y == 8
x * y
x / y

x <- matrix(1:4, 2, 2)
y <- matrix(rep(10,4), 2, 2)
x * y
x / y
x %*% y

setwd("/Users/williamsurles/Dropbox/Classes/Computing for data analysis with R")
dir()
initial <- read.csv("hw1_data.csv", nrows = 100)
classes <- sapply(initial, class)
head(initial)
tab_all <- read.csv("hw1_data.csv", colClasses = classes)
head(tab_all)

x <- "foo"
y <- data.frame(a = 1, b = "a")
dput(y, file = "y.R")
new.y <- dget("y.R")

dump(c("x", "y"), file = "data.R")
rm(x, y)
source("data.R")
y
x

rm(df)
x <- "foo"
df <- data.frame(foo = 1:4)
name <- 'foo'
df[[name]]

s <- split(airquality, airquality$Month)
str(s)