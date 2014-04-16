##| Explore week 4

##|---------------
##| Colors
##|---------------

##| Note: Colors can be ordered in 3 ways
##| - Diverging: Low and Hi values are distinguished and middle values are white or light grey
##| - Sequential: high or low values are strong and the other is white or light gray
##| -- There can be a couple colors on the way to high e.g. white to green to blue
##| - Qualitative: This is used to distinguish between categories. Each color should be different.
##| Color utilities in R
require(grDevices)
require(graphics)


##| colorRamp and color ramp palette
pal <- colorRamp(c("red","blue"))
pal(0)
pal(1)
pal(.5)
pal(seq(0,1,len=10))
pal <- colorRampPalette(c("red","blue"))
pal(2)
pal(10)

##| view color array in pie chart
num <- 15
c <- gray(0:num/num)
pie(rep(1,length(c)), col=c)

##| RColorBrewer
library(RColorBrewer)
brewer.pal.info
display.brewer.all()

cols <- brewer.pal(10,"GnBu")
pie(rep(1,length(cols)), col=cols)

pal <- colorRampPalette(cols)
image(volcano,col = pal(20))
filled.contour(volcano, col = pal(21))

##| function to show color options with 'grid' package:
showCols2 <- function(bg = "grey80", cex = 1, rot = 30, my_colors) {
  m <- ceiling(sqrt(n <- length(cl <- my_colors)))
  length(cl) <- m*m; cm <- matrix(cl, m)
  require("grid")
  grid.newpage(); vp <- viewport(w = .9, h = .9)
  grid.rect(gp=gpar(fill=bg))
  grid.text(cm, x = col(cm)/m, y = rev(row(cm))/m, rot = rot,
            vp=vp, gp=gpar(cex = cex, col = cm, fontface = 'bold'))
}

c <- colors()
c1 <- c[grep('blue',c)]
showCols2(my_colors = c1)

##| Create my own color palette and view in volcanoe

##| blue - red. I want to use it or my temperature profiles
cpal <- colorRampPalette(c("steelblue", "gray80", "tomato4"), space = "Lab")
filled.contour(volcano, color.palette = cpal, asp = 1)

##| green - oragne, great for energy profile (Diverrging)
cpal <- colorRampPalette(c("springgreen4", "gray85", "orangered"), space = "Lab")
filled.contour(volcano, color.palette = cpal, asp = 1)

##| white to red through orange (sequential)
cpal <- colorRampPalette(c("white", "orangered", "darkred"), bias = 1)
filled.contour(volcano, color.palette = cpal, asp = 1)

cpal <- colorRampPalette(c("white", "lightsteelblue3", "steelblue4"), bias = 1)
filled.contour(volcano, color.palette = cpal)

## Interpolating a 'sequential' ColorBrewer palette
## - Use bias to shift the the color ramp in one direction
YlOrBr <- c("#FFFFD4", "#FED98E", "#FE9929", "#D95F0E", "#993404")
filled.contour(volcano, color.palette = colorRampPalette(YlOrBr))
filled.contour(volcano, color.palette = colorRampPalette(YlOrBr, space = "Lab", bias = 0.5))

## 'jet.colors' is "as in Matlab"
## (and hurting the eyes by over-saturation)
jet.colors <-
  colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan",
                     "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000"))
filled.contour(volcano, color = jet.colors, asp = 1)

##| smoothScatter function
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x,y)

##| rgb color with transparency
rgb(.5,.5,0,1)

##| using transparency in a plot
plot(x,y,pch = 19)
plot(x,y,col = rgb(.2,.2,1,.3), pch = 19)

##|---------------
##| Dates and Times
##|---------------

##| cool date functions
weekdays(.leap.seconds, abbreviate = T)
months(.leap.seconds, abbreviate = T)
quarters(.leap.seconds, abbreviate = T)
julian(.leap.seconds, abbreviate = T)

##| get day of week as a number and things
p <- as.POSIXlt(Sys.time())
names(unclass(p))
p$wday

## Can aslu use the lubridate package I think
## - I'm not sure which is faster
library(lubridate)
wday(.leap.seconds)

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x - y # Does not work because its a date and posixt class
as.POSIXlt(x) - y # Looks good

##|----------------------
##| Regular expressions
##|----------------------

?grepl


