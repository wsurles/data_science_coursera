##| Question 1
## - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
## - Use the base plotting system
## - Make a plot showing total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

library(plyr)
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

##| Summarize total emissions by year
df <- ddply(nei, .(year), summarise,
            total_emissions = sum(Emissions))

##| Create Plot
png(filename="plot1.png")

plot(df$year, df$total_emissions,
     main = "Total PM2.5 Emissions from all sources from 1999 to 2008",
     xlab = "Year",
     ylab = "Total Emissions (Tons)")
lines(df$year, df$total_emissions, col = "blue")

dev.off()

##| Answer
## - Yes, total emissions have decreased from 1999 to 2008