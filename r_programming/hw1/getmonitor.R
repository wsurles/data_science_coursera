getmonitor <- function(id, directory, summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
    
  idstr = sprintf("%03.0f", as.numeric(id)) 
  filename = paste(c('./',directory,'/',idstr,'.csv'), collapse = '')
  data = read.csv(filename)
  
  if (summarize == TRUE) {
    print(summary(data))
  }
  
  return(data)

}