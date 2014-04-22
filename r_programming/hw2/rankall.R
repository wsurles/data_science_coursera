rankall <- function(outcome, num = "best") {
  
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  outcome_options = c('heart attack','heart failure','pneumonia')
  outcome_ind = c(11,17,23)
  
  ## Check that outcome is valid
  if (!(outcome %in% outcome_options)) {
    
    stop("invalid outcome")
  
  } else {
    
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name    

    col_ind <- outcome_ind[which(outcome_options == outcome)]  

    for (state in unique(df$State)) {
      
      df_state <- subset(df, df$State %in% state)
      
      outcome_val <- df_state[, col_ind]
      
      df3 <- df_state[,c(2, col_ind)]
      colnames(df3) <- c("Hospital.Name", "Rate")
      df3["Rate"] <- suppressWarnings(as.numeric(outcome_val))
      
      df3 <- df3[with(df3, order(Rate, Hospital.Name)), ]

      if (num == "best") {
        hospital <- df3$Hospital.Name[1]
      } else if (num == "worst") {
        hospital <- df3$Hospital.Name[max(which(is.na(df3$Rate)==F))]
      } else {
        hospital <- df3$Hospital.Name[num]
      }
      
      df_tmp <- data.frame(hospital,state)
      df_all <- if (exists('df_all')) rbind(df_all,df_tmp) else df_tmp
    }
    
    df_all$state <- as.character(df_all$state)
    df_all <- df_all[order(df_all$state),]
    
    return(df_all)
  } 
}