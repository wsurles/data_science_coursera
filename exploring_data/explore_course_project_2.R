##| Course Poroject


file <-  "./data/exdata-data-NEI_data/summarySCC_PM25.rds"
df_summary <- readRDS(file, refhook = NULL)
str(df_summary)

file2 <-  "./data/exdata-data-NEI_data/Source_Classification_Code.rds"
df_source <- readRDS(file2, refhook = NULL)
str(df_source)
head(df_source)

