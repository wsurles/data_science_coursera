##| Week 1 Explore

##| Exploratory Graphs

## Load data for boulder CO 2014
df <- read.csv("data/daily_08_013_0012_2014.csv")

## Look at data
head(df)
str(df)
colnames(df)

## Look at PM2.5 reads by day
table(df$Day.In.Year..Local, df$Parameter.Name)

## Get just the PM2.5 data
df2 <- subset(df,Parameter.Name == "PM2.5 - Local Conditions")

##| 1 Dimension Plots
## - '5' Number summary
## - boxplot
## - histogram 
## - density
## - bar plot
summary(df2$Arithmetic.Mean)

boxplot(df2$Arithmetic.Mean, col = "blue")

hist(df2$Arithmetic.Mean, col = "green")
rug(df2$Arithmetic.Mean)

hist(df2$Arithmetic.Mean, col = "green", breaks = 20)
rug(df2$Arithmetic.Mean)

boxplot(df2$Arithmetic.Mean, col = "blue")
abline(h=12)

hist(df2$Arithmetic.Mean, col = "green", breaks = 20)
rug(df2$Arithmetic.Mean)
abline(v=12, lwd=2)
abline(v = median(df2$Arithmetic.Mean), col = "magenta", lwd = 4)

## This is not a good example of a bar plot. 
## I don't have any category to split
## It should be counts not values here
barplot(df2$Arithmetic.Mean, col = "Wheat", main = "PM2.5 in Boulder 2014")

##| 2 Dimension Plots
## - Multiple 1-D plots
## - Scatterplots
## - Smooth scatterplots

boxplot(df2$Arithmetic.Mean)