pollutantmean <- function(directory, pollutant, id = 1:332) {

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

# id = 1:5
# directory = 'specdata'
# pollutant = 'sulfate'

source('getmonitor.R')  

for (monitor in id) {
  df <- getmonitor(monitor, directory)   
  df_all <- if (exists('df_all')) rbind(df,df_all) else df
}

pollutant_mean = mean(df_all[[pollutant]], na.rm=T)

return(pollutant_mean)

}
