best <- function(state, outcome) {
  ## Read outcome data
  
  ## Check that state and outcome are valid
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
#   outcome = 'heart attack'
#   outcome = 'heart failure'
#   outcome = 'pneumonia'
#   state = 'AK'
#   state = "TX"
  
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  str(df[,11])
  colnames(df)
  cause = c('heart attack','heart failure','pneumonia')
  col_ind = c(11,17,23)
  
  ind <- col_ind[which(outcome == cause)]
  
#   df[, ind] <- as.numeric(df[, ind])

  df2 <- subset(df, df$State %in% state)
  
  min_outcome <- min(df2[, ind], na.rm=T)
  
  hospital <- df2$Hospital.Name[which(df2[, ind] == min_outcome)]
  
  return(hospital)
  
}