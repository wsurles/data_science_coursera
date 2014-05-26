##| Question 5
## - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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

## Table and sort Level Three categories for checking
tmp <- as.data.frame(table(scc2$SCC.Level.Three))
head(arrange(tmp, desc(Freq)),100)

##| Summarize total emissions by year for Baltimore
df <- ddply(nei2, .(year), summarise,
            total_emissions = sum(subset(Emissions, fips == 24510)))

##| Create Plot
png(filename="plot5.png")

ggplot(df, aes(year, total_emissions)) +
  geom_point(size = 4) + 
  geom_line() +
  ggtitle("Total PM2.5 Emissions\nMotor vehicle sources in Baltimore City\n1999 to 2008")

dev.off()

##| Answer
## - Emission from motor vehicles in Baltimore City dropped all years. 
## - Significantly from 1999 to 2002. 
## - Only slightly from 2002 to 2005. 