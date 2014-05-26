##| Question 3
## - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##   which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## - Which have seen increases in emissions from 1999–2008? 
## - Use the ggplot2 plotting system to make a plot answer this question.

library(plyr)
library(ggplot2)

nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

##| Summarize total emissions by year
df <- ddply(nei, .(year, type), summarise,
            total_emissions = sum(subset(Emissions, fips == 24510)))

##| Create Plot
png(filename="plot3.png")

ggplot(df, aes(year, total_emissions, colour=type)) +
  geom_point(size = 4) + 
  geom_line() +
  ggtitle("Total PM2.5 Emissions\nBaltimore City, Maryland (fips == '24510')\n1999 to 2008 by type")

dev.off()

##| Answer
## - Non-road, Non-point, On-road have decreaed
## - Point has increased slightly from 1999 to 2008.
## - Point increased each year from 1999 to 2005 and then decreased from 2005 to 2008
