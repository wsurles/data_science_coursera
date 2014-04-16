##| Explore week 3
setwd("/Users/williamsurles/Dropbox/Classes/computing_for_data analysis_with_R/explore")
options(error = stop)
##| distribution simulation
y <- rnorm(100)
y <- dnorm(c(.25,.75), mean = 0, sd = 1, log = FALSE)
y <- pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
y <- qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
y <- rnorm(n, mean = 0, sd = 1)
y <- rnorm(100,20,2)
plot(y)
summary(y)

##| Computer does not actually make random numbers. They are psuedo random
rnorm(5)
set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)

rpois(10,1)
rpois(10,2)
rpois(10,20)

ppois(2,2)
ppois(4,2)
ppois(6,2)

set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)

set.seed(20)
x <- 1:100
e <- rnorm(100)
y <- 1.5 - 3 * x + e
summary(y)
plot(x,y)

##| binormal simulation
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)

##| sample
set.seed(1)
sample(1:10,4)
sample(1:10,4)
sample(letters, 5)
sample(1:10)
sample(1:10)
sample(1:10, replace = T)

##| Plotting
x <- rnorm(100)
hist(x)
y <- x + rnorm(100)
par(las = 1)
plot(x,y)
par(las = 2) # orientation of the axis labels
par(pch = 16) # point character
par(lty = 1) # line type
par(lwd = 2) # Line width
par(col = 'red') # color

par(bg = 'yellow') # background color
par(mar = c(2,2,2,2)) # margin size
par(oma = c(2,2,2,2)) # outer margin size
par(mfrow = c(2,2)) # plots per row
par(mfrow = c(2,2)) # plots per column

lines(x,y)
x1 <- rnorm(10)
y1 <- rnorm(10)
points(x1,y1, col = 'blue')
text(0,3, "blah blah", cex = 1.5, col = 'green')

##| sending plot to pdf
pdf(file = 'testRplot3.pdf')
x <- rnorm(100)
hist(x, col = 'green')
dev.off()
dev.copy2pdf()

##| lattice plot
library(lattice)
library(nlme)
xyplot(distance ~ age | Subject, data = Orthodont)
package ?lattice
library(help = lattice)
data(environmental)
?environmental
head(environmental)
xyplot(ozone ~ radiation, data = environmental)
xyplot(ozone ~ radiation, data = environmental, main = "Ozone vs. Radiation")
xyplot(ozone ~ temperature, data = environmental)
summary(environmental$temperature)
temp.cut <- equal.count(environmental$temperature, 4)
temp.cut
xyplot(ozone ~ radiation | temp.cut, data = environmental)
wind.cut <- equal.count(environmental$wind, 4)
xyplot(ozone ~ radiation | temp.cut * wind.cut, 
       data = environmental,
       as.Table = T, 
       pch = 20, 
       panel = function(x, y, ...) {
         panel.xyplot(x, y, ...)
         panel.loess(x, y)
       },
       xlab = 'Solar Radiation', 
       ylab = 'Ozone (ppb)',
       main = 'Ozone vs Solar Radiation'
       )
splom(~ environmental)
histogram(~ ozone | wind.cut, data = environmental)
histogram(~ ozone | temp.cut * wind.cut, data = environmental)

##| qplot and ggplot
library(ggplot2)
str(mpg)

##| qplot
##| quick scatter plot with colors
qplot(displ, hwy, data = mpg, color = drv,
      geom = c("point","smooth")
)
##| histogram
qplot(hwy, data = mpg, fill = drv)

##| facets
qplot(displ, hwy, data = mpg,
      facets = .~ drv
)
qplot(hwy, data = mpg, 
      facets = drv~.,
      binwidth = 2
)

qplot(displ, hwy, data = mpg,
      facets = drv~.,
      geom = c("point","smooth"),
      method = "lm"
)
qplot(displ, hwy, data = mpg,
      facets = drv~.,
      geom = c("point","smooth"),
      method = "lm"
)

##| ggplot
str(mpg)
ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(color = year), size = 4, alpha = .7) +
  facet_grid(drv~.) +
  geom_smooth(method = 'lm', size = 3, se = T) +
  labs(
    title = 'Highway Miles Per Gallon vs Displacement by Drive Train',
    x = 'Displacement',
    y = expression('HWY mpg ' * PM[2])
    ) +
  theme_bw(base_family = "Times")

## Use coord_cartesian(ylim = c(-3,3)) to adjust plot limits without 
## removing outlier datapoints

##| predictino intervals according to stack overflow answer
require(ggplot2)
require(nlme)

set.seed(101)
mp <-data.frame(year=1990:2010)
N <- nrow(mp)

mp <- within(mp,
{
  wav <- rnorm(N)*cos(2*pi*year)+rnorm(N)*sin(2*pi*year)+5
  wow <- rnorm(N)*wav+rnorm(N)*wav^3
})

m01 <- gls(wow~poly(wav,3), data=mp, correlation = corARMA(p=1))
fit <- predict(m01)
V <- vcov(m01)
X <- model.matrix(~poly(wav,3),data=mp)
se.fit <- sqrt(diag(X %*% V %*% t(X)))

predframe <- with(mp,data.frame(year,wav,
                                  wow=fit,lwr=fit-1.96*se.fit,upr=fit+1.96*se.fit))

(p1 <- ggplot(mp, aes(year, wow))+
   geom_point()+
   geom_line(data=predframe)+
   geom_ribbon(data=predframe,aes(ymin=lwr,ymax=upr),alpha=0.3))

(p2 <- ggplot(mp, aes(wav, wow))+
   geom_point()+
   geom_line(data=predframe)+
   geom_ribbon(data=predframe,aes(ymin=lwr,ymax=upr),alpha=0.3))

##| LM stats
require(stats); require(graphics)
plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)",
     las = 1)
lines(lowess(cars$speed, cars$dist, f = 2/3, iter = 3), col = "red")
title(main = "cars data")
plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)",
     las = 1, log = "xy")
title(main = "cars data (logarithmic scales)")
lines(lowess(cars$speed, cars$dist, f = 2/3, iter = 3), col = "red")
summary(fm1 <- lm(log(dist) ~ log(speed), data = cars))
opar <- par(mfrow = c(2, 2), oma = c(0, 0, 1.1, 0),
            mar = c(4.1, 4.1, 2.1, 1.1))
plot(fm1)
par(opar)

## An example of polynomial regression
plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)",
     las = 1, xlim = c(0, 25))
d <- seq(0, 25, length.out = 200)
for(degree in 1:4) {
  fm <- lm(dist ~ poly(speed, degree), data = cars)
  assign(paste("cars", degree, sep="."), fm)
  lines(d, predict(fm, data.frame(speed=d)), col = degree)
}
anova(cars.1, cars.2, cars.3, cars.4)

##| lowess
plot(cars, main = "lowess(cars)")
par(lwd = 3)
lines(lowess(cars), col = 2)
lines(lowess(cars, f=1), col = 4)
legend(5, 120, c(paste("f = ", c("2/3", ".2"))), lty = 1, col = 2:3)

##| Knitr

