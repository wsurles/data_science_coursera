##| Week 3 HW Tests

# dev.off()

##| Problem 3 
##| 30-day death rates from heart attack, heart failure, and pneumonia
outcome[, 11] <- as.numeric(outcome[, 11])

names_state <- names(table(outcome$State)[table(outcome$State) >= 20])
outcome2 <- subset(outcome, outcome$State %in% names_state)

death <- outcome2[, 11]
state <- outcome2$State

par(mfrow = c(1, 1))
par(las = 2)
boxplot(death ~ state,
        main = "Heart Attack 30-day Death Rate by State",
        ylab = "30-day Death Rate",
        cex.axis=.7)

str(InsectSprays)
bymedian <- with(InsectSprays, reorder(spray, count, median))
boxplot(count ~ bymedian, data = InsectSprays,
        xlab = "Type of spray", ylab = "Insect count",
        main = "InsectSprays data", varwidth = TRUE,
        col = "lightgray")

state_by_median <- reorder(state, death, median)
boxplot(death ~ state_by_median,
        main = "Heart Attack 30-day Death Rate by State",
        ylab = "30-day Death Rate",
        cex.axis=.7)

str(outcome)
str(outcome2)
##| Submit
source("http://spark-public.s3.amazonaws.com/compdata/scripts/submitscript.R")
submit()