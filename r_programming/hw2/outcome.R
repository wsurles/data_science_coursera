
require(graphics)

##| Problem 1 - 2
##| 30-day death rates from heart attack, heart failure, and pneumonia
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
cause = c('Heart Attack','Heart Failure','Pneumonia')
ind = c(11,17,23)
par(mfrow = c(3, 1))

for (i in 1:length(cause)) {
  x <- as.numeric(outcome[, ind[i]])
  median_val <- median(x, na.rm = T)
  title_list <- list(t1 = cause[i], 
                     num = mean(x, na.rm = T)
  )
  hist(x, 
       main = substitute(t1 * " (" * bar(x) * " = " * num * ")" ,title_list), 
       xlab = '30-day Death Rate',
       xlim=c(5,20),
       col = 'green',
       prob = T
  )
  lines(density(x, na.rm = T), col = 4, lwd = 3)
  abline(v = median_val, col = "orange", lwd = 4)
}