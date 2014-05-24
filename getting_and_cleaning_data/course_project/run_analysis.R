##| run_analysis.R
library(reshape2)
library(plyr)

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

##| Name the activities in the data set
table(df$subject, df$activity)
table(df$activity)
table(df$subject)

## Merge y with the activity labels 
## - Note: by.x refers to the variable y here (a little confusing)
df_activity <- merge(y, activity_labels, by.x ="activity", by.y="V1")
df$activity <- df_activity$V2

##| Clean up measurement labels on the data set 
colnames(df) <- gsub('\\(\\)','',colnames(df))

##| Create independent tidy data set with averages of each activity
df_melt <- melt(df, id=c("subject","activity"))

df2 <- ddply(df_melt, .(subject, activity, variable), summarise,
             Mean = mean(value))

write.table(df2, 
            file = "data_tidy.txt", 
            sep ="\t", 
            row.names = F,
            quote = F)
