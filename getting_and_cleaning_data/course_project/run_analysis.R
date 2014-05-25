##| run_analysis.R
library(reshape2)
library(plyr)

##|---------------------------------
##| Combine and clean activity data
##|---------------------------------

##| load data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

##| Merge training and test sets
x <- rbind(x_train,x_test)
colnames(x) <- features$V2

subject <- rbind(subject_train,subject_test)
colnames(subject) <- c("subject")

y <- rbind(y_train,y_test)
colnames(y) <- c("activity")

##| Extract measurements on the mean and stddev 

## Get the values with mean but not meanFreq
ind_mean <- grep('mean\\(', colnames(x))
colnames(x)[ind_mean]

## Get the values with std
ind_std <- grep('std', colnames(x))
colnames(x)[ind_std]

## Get columns from x and combine subject and y again
ind <- c(ind_mean,ind_std)
x2 <- x[,ind]

##| Combine x, y, and subject into one dataframe
df <- cbind(subject,y,x2)

##| change factor labels to activity names
df$activity <- factor(df$activity,
  levels = c(1,2,3,4,5,6),
  labels = c("WALKING",
           "WALKING_UPSTAIRG",
           "WALKING_DOWNSTAIRS",
           "SITTING",
           "STANDING",
           "LAYING"))

##| Clean up measurement labels on the data set 
colnames(df) <- gsub('\\(\\)','',colnames(df))

table(df$subject, df$activity)
str(df)

##|--------------------
##| Summarize Data Set
##|--------------------

##| Create independent tidy data set with averages of each activity
df_melt <- melt(df, id=c("subject","activity"))
str(df_melt)
df2 <- ddply(df_melt, .(subject, activity, variable), summarise,
             Mean = mean(value))

write.table(df2, 
            file = "data_tidy.txt", 
            sep ="\t", 
            row.names = F,
            quote = F)
table(df2$subject, df2$activity)
str(df2)
head(df2)