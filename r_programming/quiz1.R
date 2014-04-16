## R programming week 1 quiz 

x <- 4L
class(x)

x <- c(4, TRUE)
class(x)

x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x,y)

x <- list(2, "a", "b", TRUE)
y <- x[[2]] 
class(y)

x <- 1:4 
y <- 2
x+y

x <- c(3, 5, 1, 10, 12, 6) 
x[x < 6] == 0
x[x %in% 1:5] <- 0

x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x >= 11] <- 4
x[x > 10] == 4

df <- read.csv('quiz_1_data.csv')

colnames(df)

head(df,2)

dim(df)

tail(df,2)

df$Ozone[47]

sum(is.na(df$Ozone))

mean(df$Ozone, na.rm=T)

mean(subset(df$Solar.R, df$Ozone > 31 & df$Temp > 90))

mean(subset(df$Temp, df$Month == 6))

max(subset(df$Ozone, df$Month == 5), na.rm=T)
