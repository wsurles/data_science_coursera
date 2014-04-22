set.seed(1)
rpois(5, 2)

set.seed(1)
rpois(5, 2)

?rnorm

?set.seed()

?rpois

set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
plot(x,y)

system.time({set.seed(20)
            x <- rnorm(100)
            e <- rnorm(10, 0, 2)
            y <- 0.5 + 2 * x + e
            plot(x,y)})

library(datasets)
Rprof()
fit <- lm(y ~ x + x)
Rprof(NULL)
summaryRprof()
  