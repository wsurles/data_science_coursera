##| Question 6
## - Compare emissions from motor vehicle sources
## - Baltimore City vs Los Angeles County, California (fips == "06037"). 
## - Which city has seen greater changes over time in motor vehicle emissions?
library(plyr)
library(ggplot2)

##| Load data
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

##| Find emissions from motor vehicle sources
## - Motor vehicles is defined as nei$type == ON-ROAD
## - This has been verified by viewing all corresponding scc$SCC.Level.Three values
nei2 <- subset(nei, type == "ON-ROAD")
scc2 <- subset(scc, scc$SCC %in% nei2$SCC)

##| subset nei for just Baltimore and LA fips
nei3 <- subset(nei2, nei2$fips %in% c("24510","06037"))

##| Summarize total emissions by year and fips
df <- ddply(nei3, .(year,fips), summarise,
            total_emissions = sum(Emissions))

df$fips <- factor(df$fips,
    levels = c("06037","24510"),
    labels = c("Las Angeles County CA",
               "Baltimore City MA"))

##| Create Plot
png(filename="plot6.png")

ggplot(df, aes(year, total_emissions, colour=fips)) +
  geom_point(size = 4) + 
  geom_line() +
  ggtitle("Total PM2.5 Emissions\nMotor vehicle sources\nLas Angeles County vs Baltimore City\n1999 to 2008")

dev.off()

##| Answer
## - Emission from motor vehicles in Baltimore City have dropped 285.54 tons from 1999 to 2008
## - Emission from motor vehicles in Las Angeles County have increased 170.20 tons from 1999 to 2008
