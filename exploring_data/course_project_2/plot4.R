##| Question 4
## - Across the United States, how have emissions from coal combustion-related sources 
##   changed from 1999–2008?

library(plyr)
library(ggplot2)

##| Load data
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

##| Find emissions from just coal combustion related sources
##| Subset is based on EI Sectors including 'Coal'
scc2 <- scc[grep("Coal",scc$EI.Sector),]
nei2 <- subset(nei, SCC %in% scc2$SCC)

##| Summarize total emissions by year
df <- ddply(nei2, .(year), summarise,
            total_emissions = sum(Emissions))

##| Create Plot
png(filename="plot4.png")

ggplot(df, aes(year, total_emissions)) +
  geom_point(size = 4) + 
  geom_line() +
  ggtitle("Total PM2.5 Emissions\nCoal combustion-related sources\n1999 to 2008")

dev.off()

##| Answer
## - Based on EI.Sector including 'Coal', PM2.5 Emissions have dropped from 1999 to 2008
## - The greatest drop occured from 2005 to 2008
