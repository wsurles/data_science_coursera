source("rankhospital.R")

rankhospital("TX", "heart failure", 4)
# [1] "DETAR HOSPITAL NAVARRO"

rankhospital("MD", "heart attack", "worst")
# [1] "HARFORD MEMORIAL HOSPITAL"

rankhospital("MN", "heart attack", 5000)
# [1] NA