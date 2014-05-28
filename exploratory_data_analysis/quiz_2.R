library(nlme)
library(lattice)
a <- xyplot(weight ~ Time | Diet, BodyWeight)
?text

str(a)

library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
print(p)

library(datasets)
data(airquality)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)

qplot(votes, rating, data = movies)

qplot(votes, rating, data = movies) + geom_smooth()


data = data.frame(y=sort(runif(120)), x=sort(rexp(120)), z=sort(rexp(120)),
                  g1=rep(gl(2,15, labels=c("yes","no")),4),
                  g2=gl(4,30, labels=LETTERS[1:4]),
                  g3 = rep(gl(3,5, labels=c("low","med","high")),8) )

xyplot(y~x | g1, data, type=c('p','smooth','g')) # Scatterplots with smoothed regression lines and a grid

xyplot(y~x | g1, data, panel=function(x,y) { # The same plot using a custom panel function
  panel.xyplot(x,y)
  panel.loess(x,y, col="red", lty=2)
  panel.grid() } )

xyplot(y~x | g1, groups=g2, data, type='l') # Lines
xyplot(y~x | g1, groups=g2, data, type='b') # Both points and lines
splom(~data[1:3] | g1, groups=g2, data, type=c('p','smooth','g'))
dotplot(Freq~Var1 | Var2, groups=Var3, as.data.frame.table(grp.means3), origin=0, type=c('p','g','l')) # interaction plot

?llines
?trellis.par.set