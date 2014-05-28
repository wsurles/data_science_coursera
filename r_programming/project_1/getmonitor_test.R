## Test for getmonitor.R

data <- getmonitor(1, "specdata") 

head(data) 
# Date sulfate nitrate ID 
# 1 2003-01-01 NA NA 1 
# 2 2003-01-02 NA NA 1 
# 3 2003-01-03 NA NA 1 
# 4 2003-01-04 NA NA 1 
# 5 2003-01-05 NA NA 1 
# 6 2003-01-06 NA NA 1 

data <- getmonitor(101, "specdata", TRUE) 
# Date sulfate nitrate ID 
# 2005-01-01: 1 Min. : 1.700 Min. : 0.2490 Min. :101 
# 2005-01-02: 1 1st Qu.: 3.062 1st Qu.: 0.6182 1st Qu.:101 
# 2005-01-03: 1 Median : 4.345 Median : 1.0500 Median :101 
# 2005-01-04: 1 Mean : 6.267 Mean : 2.2679 Mean :101 
# 2005-01-05: 1 3rd Qu.: 7.435 3rd Qu.: 2.7825 3rd Qu.:101 
# 2005-01-06: 1 Max. :22.100 Max. :10.8000 Max. :101 
# (Other) :724 NA's :666 NA's :666 

head(data) 
# Date sulfate nitrate ID 
# 1 2005-01-01 NA NA 101 
# 2 2005-01-02 NA NA 101 
# 3 2005-01-03 NA NA 101 
# 4 2005-01-04 NA NA 101 
# 5 2005-01-05 NA NA 101 
# 6 2005-01-06 NA NA 101 

data <- getmonitor("200", "specdata", TRUE) 
# Date sulfate nitrate ID 
# 2001-01-01: 1 Min. : 0.741 Min. : 0.144 Min. :200 
# 2001-01-02: 1 1st Qu.: 2.180 1st Qu.: 0.704 1st Qu.:200 
# 2001-01-03: 1 Median : 3.275 Median : 1.300 Median :200 
# 2001-01-04: 1 Mean : 4.391 Mean : 2.003 Mean :200 
# 2001-01-05: 1 3rd Qu.: 5.228 3rd Qu.: 2.605 3rd Qu.:200 
# 2001-01-06: 1 Max. :22.900 Max. :14.800 Max. :200 
# (Other) :3646 NA's :3192 NA's :3188 
