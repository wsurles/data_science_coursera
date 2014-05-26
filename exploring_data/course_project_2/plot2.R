##| Question 2
## - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
## - Use the base plotting system

library(plyr)
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

##| Summarize total emissions by year
df <- ddply(nei, .(year), summarise,
            total_emissions = sum(subset(Emissions, fips == 24510)))

##| Create Plot
png(filename="plot2.png")

plot(df$year, df$total_emissions,
     main = "Total PM2.5 Emissions\nBaltimore City, Maryland (fips == '24510')\n1999 to 2008",
     xlab = "Year",
     ylab = "Total Emissions (Tons)")
lines(df$year, df$total_emissions, col = "blue")

dev.off()

##| Answer
## - Yes, total emissions have decreased in Baltimore City, Maryland from 1999 to 2008
## - Emission rose from 2002 to 2005 but decreased to their lowest point in 2008