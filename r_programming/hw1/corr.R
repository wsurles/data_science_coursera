corr <- function(directory, threshold = 1) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  list_files <- list.files(path = paste(c('./',directory,'/'), collapse = ''))
  data <- vector("numeric", length = 0)
  
  for (i in 1:length(list_files)) {
    filename = paste(c('./',directory,'/',list_files[i]), collapse = '')
    df = read.csv(filename)
    
    if (sum(complete.cases(df)) >= threshold) {
      cr <- cor(df$nitrate, df$sulfate, use = "complete.obs")
      data <- append(data, cr)  
    }
    
  }
  
  return(data)
}