
library(datasets)
data(iris)
?iris

str(iris)

mean(subset(iris$Sepal.Length, iris$Species == 'virginica'))

apply(iris[,1:4],2, mean)

library(datasets)
data(mtcars)
?mtcars

lapply(mtcars, mean)
sapply(mtcars, cyl, mean)
split(mtcars, mtcars$cyl)
?tapply(mtcars$mpg, mtcars$cyl, mean)