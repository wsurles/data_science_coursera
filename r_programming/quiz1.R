## R programming week 1 quiz 

x <- 4L
x <- c(4, TRUE)
class(x)

x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x,y)

x <- list(2, "a", "b", TRUE)
x[[1]] 
class(x)

x <- 1:4 
y <- 2
x+y

x <- c(3, 5, 1, 10, 12, 6) 
x[x < 6] == 0
x[x %in% 1:5] <- 0

read.csv('hw1_data.csv')