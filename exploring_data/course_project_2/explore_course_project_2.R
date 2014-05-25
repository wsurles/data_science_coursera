##| Course Poroject
library(plyr)

nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# total emissions PM2.5 decreased? in US from 1999 to 2008 
# base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

str(nei)
str(scc)
plot(nei$year, nei$Emissions)

df <- ddply(nei, .(year), summarise,
            total_emissions = sum(Emissions))
str(df)
plot(df$year, df$total_emissions)