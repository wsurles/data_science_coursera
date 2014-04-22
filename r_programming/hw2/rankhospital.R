rankhospital <- function(state, outcome, num = "best") {
  
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
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    col_ind <- outcome_ind[which(outcome_options == outcome)]  
    
    df_state <- subset(df, df$State %in% state)
    
    outcome_val <- df_state[, col_ind]
    
    df3 <- df_state[,c(2, col_ind)]
    colnames(df3) <- c("Hospital.Name", "Rate")
    df3["Rate"] <- suppressWarnings(as.numeric(outcome_val))
    
    df3 <- df3[with(df3, order(Rate, Hospital.Name)), ]
#     outcome_val <- suppressWarnings(as.numeric(outcome_val))
#     outcome_val <- subset(outcome_val,is.na(outcome_val)==F)
#     num = 5
    if (num == "best") {
      hospital <- df3$Hospital.Name[1]
    } else if (num == "worst") {
      hospital <- df3$Hospital.Name[max(which(is.na(df3$Rate)==F))]
    } else {
      hospital <- df3$Hospital.Name[num]
    }
  
    return(hospital)
  } 
}