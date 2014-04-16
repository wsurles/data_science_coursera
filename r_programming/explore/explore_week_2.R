##| Week 3 explore

##| wvectorised version of if else
x <- -1:4
ifelse(x ==1, 'is_one', ifelse(x > 1, 'greater_than_one','less_than_one'))

##| typical if else statement
x <- 4
if (x > 3) {
  y <- 10
} else {
  y <- 2
}

##| or to be clear its all about assignment to Y
y <- if (x > 3) {10} else {2}

##| for loop
for (i in 1:10) {print(i)}

##| other wasys to do for loop
x = c('a','b','c','d')
for (i in 1:4) {print(x[i])}
for (i in 1:4) print(x[i])
for (i in seq_along(x)) print(x[i])
for (i in x) print(i)

##| nested for loop 
##| - Don't go past 2 or it gets hard to understand
##| - Use a function instead
x <- matrix(1:6,2,3)
for (i in seq_len(nrow(x))) {
  for (j in seq_len(ncol(x))) {
    print(x[i,j])
  }
}

##| while loop
z <- 5
while (z >= 3 && z <= 10){
  print(z)
  coin <- rbinom(1,1,.5)
  z <- if (coin == 1) {z+1} else {z-1}
}

##| repeat
x0 <- 1
tol <- 1e-8
repeat {
  x1 <- x0/2
  if (abs(x1 -x0) < tol) {
    break
  } else {
    x0 <- x1
    print(x0)
  }
}

##| another example using a repeat function
##| - http://www.ats.ucla.edu/stat/r/library/intro_function.htm
##| - its best to avoid potentially infinite loops
names1 <- c("Dave", "John", "Ann", "Roger", "Bill", "Kathy")
f.names.repeat <- function(x)  {
  i <- 1
  repeat {
    print(x[i])
    i <- i+1
    if(x[i] == "Roger") break
  }
}
f.names.repeat(names1)

##| next: # skip iteration in a loop
for (i in 1:100) {
  if (i <= 20) next
  print(i)
}

##| R uses lazy operation. 

##| Extend  function
myplot <- function(x,y,type = "l",...) {
  plot(x,y,type = type,...)
}
x <- 1:10
y <- rbinom(10,10,.5)
plot(x,y)
myplot(x,y)

##| paste0 is like paste but default is sep = ""
paste0("my","name","is","William")

##| Check all packages currently loaded
search()

##| Environments
##| - It is poosible for a function to return another function
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
square <- make.power(2)
cube <- make.power(3)
square(2)
cube(2)

ls(environment(cube))
get('n', environment(cube))
ls(environment(square))
get('n', environment(square))

##| Optimization
##| - can build parameters into the objective function
make.NegLogLik <- function(data, fixed = c(FALSE,FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5 * length(data) * log(2*pi*sigma^2)
    b <- -0.5 * sum((data-mu)^2) / (sigma^2)
    -(a + b)
  }
}

set.seed(1)
normals <- rnorm(100,1,2)
plot(normals)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))

optim(c(mu = 0, sigma = 1), nLL)$par

##| fix sigma and optimize mu
nLL <- make.NegLogLik(normals, c(FALSE,2))
optimize(nLL, c(-1, 3))$minimum

x <- seq(0.5, 1.5, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y-min(y))))

##| fix mu and optimize sigma
nLL <- make.NegLogLik(normals, c(1,FALSE))
optimize(nLL, c(1e-6, 10))$minimum

nLL <- make.NegLogLik(normals, c(1,FALSE))
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y-min(y))))

##| apply functions
##| lapply
x <- list(a = 1:5, b = rnorm(10))
lapply(x,mean)

x <- 1:4
lapply(x,runif)
lapply(x,runif, min = 0, max = 10)

x <- list(a = matrix(1:4,2,2), b = matrix(1:6,3,2))
lapply(x,function(m) m[,1])

##| sapply simplifies the answer if possible
x <- list(rnorm(100), runif(100), rpois(100,1))
sapply(x, quantile, probs = c(0.25, 0.75))

y <- rnorm(100)
y <- runif(100)
y <- rpois(100,1)
plot(y)

##| apply
x <- matrix(rnorm(200),20,10)
apply(x,2,mean)
apply(x,1,mean)
## shortcut for this 
rowSums(x) 
rowMeans(x)
colSums(x)
colMeans(x)

apply(x, 1, quantile, probs = c(0.25, 0.75))

##| tapply
x <- c(rnorm(10), runif(10), rpois(10,1))
f <- gl(3,10)
tapply (x, f, mean)
tapply (x, f, mean, simplify = F)
tapply (x, f, range)

##| split
split(x,f)
##| Use lapply or sapply to do something to the parts of the list. Cool!
##| this example is same as tapply but there are other uses of this
lapply(split(x,f), mean)

##| using split on dataframes
library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone","Solar.R","Wind")], na.rm = T))
##| sapply is cleaner and more useful
sapply(s, function(x) colMeans(x[, c("Ozone","Solar.R","Wind")], na.rm = T))
##| I tried but could not get ddply to do the same thing as easily
##| But I probably could have melted the df and then done ddply 

##| splitting on more than one level
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
interaction(f1,f2)
str(split(x,list(f1,f2)))
str(split(x,list(f1,f2), drop=T))

##| mapply
list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
mapply(rep, 1:4, 1:4)

noise <- function(n, mean, sd) {rnorm(n, mean, sd)}
noise(5,1,2)
noise(1:5,1:5,2)
mapply(noise, 5, 1:5, .5)

##| Debugging
##| in a function R returns the last thing that is calculated 
##| important to consider what you were expecting
rm(x)
mean(x)
traceback()
##| useful for sharing error with another person in an email
##| have to call right after the error occurs
lm(y~x)
traceback()
##| debug
debug(lm)
lm(y~x)
##| can call debug on a function while debigging a function. 

##| reoover
options(error = recover)
read.csv("nosuchfile")
