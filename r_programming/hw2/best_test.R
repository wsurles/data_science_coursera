##| Test for best.R
source("best.R")

best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"

best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"

best("MD", "heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"

best("MD", "pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"

best("BB", "heart attack")
# Error in best("BB", "heart attack") : invalid state

best("NY", "hert attack")
# Error in best("NY", "hert attack") : invalid outcome
