best <- function(state, outcome) {
  
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  outcome_options = c('heart attack','heart failure','pneumonia')
  outcome_ind = c(11,17,23)
  
  ## Check that state and outcome are valid
  if (!(state %in% df$State)) {
    
    stop("invalid state")
  
  } else if (!(outcome %in% outcome_options)) {
    
    stop("invalid outcome")
  
  } else {
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    col_ind <- outcome_ind[which(outcome_options == outcome)]  
    
    df_state <- subset(df, df$State %in% state)
    
    outcome_val <- df_state[, col_ind]
    
    outcome_val <- suppressWarnings(as.numeric(outcome_val))
    
    min_outcome <- min(outcome_val, na.rm=T)
    
    hospital_list <- df_state$Hospital.Name[which(outcome_val == min_outcome)]
    
    hospital <- sort(hospital_list)[1]
  
    return(hospital)
  } 
}