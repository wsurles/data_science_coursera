# Getting and Cleaning Data Course Project

## Study Design

### Steps to create a tidy summarized dataset 
#### 2-6 occur in run_analysis.R

1. Get data smartphone activity data from UCI website
2. Merge the training and the test sets for X, y, and subject
3. Appropriately label each measurement. X is labeled with features.txt
4. Extract the mean and standard deviation for each measurement
5. Adds activity names to the data set
6. Create a second data set with the average of each variable (feature) for each activity and each subject. 

## Cook Book
For exact recipe to create **data_tidy.txt** see **run_analysis.R** provided in the repo

### Data Set used
UCL Machine Learning Repository
Human Activity Recognition Using Smartphones Data Set 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data File downloaded
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Description of data set from website. 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  


The set of variables that were estimated from these signals that I am interested in are:

mean(): Mean value  
std(): Standard deviation  

### Files used

* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/activity_labels.txt

### Combined data set diagram

![image1](images/image_combined_data.png "Combined Data Set")

### Combine and clean data process

* rbind and cbind were used to combine the datasets
* column names for X data sets are from features.txt
* grep was used to extract only mean and std variables 
* extra characters were removed from the names

### Structure of combined and cleaned data set

```S
'data.frame':	10299 obs. of  68 variables:
 $ subject                  : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activity                 : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRG",..: 5 5 5 5 5 5 5 5 5 5 ...
 $ tBodyAcc-mean-X          : num  0.289 0.278 0.28 0.279 0.277 ...
 $ tBodyAcc-mean-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
 $ tBodyAcc-mean-Z          : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
 $ tGravityAcc-mean-X       : num  0.963 0.967 0.967 0.968 0.968 ...
 $ tGravityAcc-mean-Y       : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
 $ tGravityAcc-mean-Z       : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...
 $ tBodyAccJerk-mean-X      : num  0.078 0.074 0.0736 0.0773 0.0734 ...
 $ tBodyAccJerk-mean-Y      : num  0.005 0.00577 0.0031 0.02006 0.01912 ...
 $ tBodyAccJerk-mean-Z      : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...
 $ tBodyGyro-mean-X         : num  -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...
 $ tBodyGyro-mean-Y         : num  -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...
 $ tBodyGyro-mean-Z         : num  0.1077 0.1006 0.0961 0.0855 0.0774 ...
 $ tBodyGyroJerk-mean-X     : num  -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...
 $ tBodyGyroJerk-mean-Y     : num  -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...
 $ tBodyGyroJerk-mean-Z     : num  -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...
 $ tBodyAccMag-mean         : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
 $ tGravityAccMag-mean      : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
 $ tBodyAccJerkMag-mean     : num  -0.993 -0.991 -0.989 -0.993 -0.993 ...
 $ tBodyGyroMag-mean        : num  -0.969 -0.981 -0.976 -0.982 -0.985 ...
 $ tBodyGyroJerkMag-mean    : num  -0.994 -0.995 -0.993 -0.996 -0.996 ...
 $ fBodyAcc-mean-X          : num  -0.995 -0.997 -0.994 -0.995 -0.997 ...
 $ fBodyAcc-mean-Y          : num  -0.983 -0.977 -0.973 -0.984 -0.982 ...
 $ fBodyAcc-mean-Z          : num  -0.939 -0.974 -0.983 -0.991 -0.988 ...
 $ fBodyAccJerk-mean-X      : num  -0.992 -0.995 -0.991 -0.994 -0.996 ...
 $ fBodyAccJerk-mean-Y      : num  -0.987 -0.981 -0.982 -0.989 -0.989 ...
 $ fBodyAccJerk-mean-Z      : num  -0.99 -0.99 -0.988 -0.991 -0.991 ...
 $ fBodyGyro-mean-X         : num  -0.987 -0.977 -0.975 -0.987 -0.982 ...
 $ fBodyGyro-mean-Y         : num  -0.982 -0.993 -0.994 -0.994 -0.993 ...
 $ fBodyGyro-mean-Z         : num  -0.99 -0.99 -0.987 -0.987 -0.989 ...
 $ fBodyAccMag-mean         : num  -0.952 -0.981 -0.988 -0.988 -0.994 ...
 $ fBodyBodyAccJerkMag-mean : num  -0.994 -0.99 -0.989 -0.993 -0.996 ...
 $ fBodyBodyGyroMag-mean    : num  -0.98 -0.988 -0.989 -0.989 -0.991 ...
 $ fBodyBodyGyroJerkMag-mean: num  -0.992 -0.996 -0.995 -0.995 -0.995 ...
 $ tBodyAcc-std-X           : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
 $ tBodyAcc-std-Y           : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
 $ tBodyAcc-std-Z           : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
 $ tGravityAcc-std-X        : num  -0.985 -0.997 -1 -0.997 -0.998 ...
 $ tGravityAcc-std-Y        : num  -0.982 -0.989 -0.993 -0.981 -0.988 ...
 $ tGravityAcc-std-Z        : num  -0.878 -0.932 -0.993 -0.978 -0.979 ...
 $ tBodyAccJerk-std-X       : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...
 $ tBodyAccJerk-std-Y       : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...
 $ tBodyAccJerk-std-Z       : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...
 $ tBodyGyro-std-X          : num  -0.985 -0.983 -0.976 -0.991 -0.985 ...
 $ tBodyGyro-std-Y          : num  -0.977 -0.989 -0.994 -0.992 -0.992 ...
 $ tBodyGyro-std-Z          : num  -0.992 -0.989 -0.986 -0.988 -0.987 ...
 $ tBodyGyroJerk-std-X      : num  -0.992 -0.99 -0.988 -0.991 -0.991 ...
 $ tBodyGyroJerk-std-Y      : num  -0.993 -0.997 -0.996 -0.997 -0.996 ...
 $ tBodyGyroJerk-std-Z      : num  -0.992 -0.994 -0.992 -0.993 -0.995 ...
 $ tBodyAccMag-std          : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
 $ tGravityAccMag-std       : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
 $ tBodyAccJerkMag-std      : num  -0.994 -0.992 -0.99 -0.993 -0.996 ...
 $ tBodyGyroMag-std         : num  -0.964 -0.984 -0.986 -0.987 -0.989 ...
 $ tBodyGyroJerkMag-std     : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
 $ fBodyAcc-std-X           : num  -0.995 -0.999 -0.996 -0.996 -0.999 ...
 $ fBodyAcc-std-Y           : num  -0.983 -0.975 -0.966 -0.983 -0.98 ...
 $ fBodyAcc-std-Z           : num  -0.906 -0.955 -0.977 -0.99 -0.992 ...
 $ fBodyAccJerk-std-X       : num  -0.996 -0.997 -0.991 -0.991 -0.997 ...
 $ fBodyAccJerk-std-Y       : num  -0.991 -0.982 -0.981 -0.987 -0.989 ...
 $ fBodyAccJerk-std-Z       : num  -0.997 -0.993 -0.99 -0.994 -0.993 ...
 $ fBodyGyro-std-X          : num  -0.985 -0.985 -0.977 -0.993 -0.986 ...
 $ fBodyGyro-std-Y          : num  -0.974 -0.987 -0.993 -0.992 -0.992 ...
 $ fBodyGyro-std-Z          : num  -0.994 -0.99 -0.987 -0.989 -0.988 ...
 $ fBodyAccMag-std          : num  -0.956 -0.976 -0.989 -0.987 -0.99 ...
 $ fBodyBodyAccJerkMag-std  : num  -0.994 -0.992 -0.991 -0.992 -0.994 ...
 $ fBodyBodyGyroMag-std     : num  -0.961 -0.983 -0.986 -0.988 -0.989 ...
 $ fBodyBodyGyroJerkMag-std : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
```

### Table of measurements by subject and activity
For example, Subject 1 has 95 measurements for the 'walking' activity in each of the 66 variables extracted.
```S
     WALKING WALKING_UPSTAIRG WALKING_DOWNSTAIRS SITTING STANDING LAYING
  1       95               53                 49      47       53     50
  2       59               48                 47      46       54     48
  3       58               59                 49      52       61     62
  4       60               52                 45      50       56     54
  5       56               47                 47      44       56     52
  6       57               51                 48      55       57     57
  7       57               51                 47      48       53     52
  8       48               41                 38      46       54     54
  9       52               49                 42      50       45     50
  10      53               47                 38      54       44     58
  11      59               54                 46      53       47     57
  12      50               52                 46      51       61     60
  13      57               55                 47      49       57     62
  14      59               54                 45      54       60     51
  15      54               48                 42      59       53     72
  16      51               51                 47      69       78     70
  17      61               48                 46      64       78     71
  18      56               58                 55      57       73     65
  19      52               40                 39      73       73     83
  20      51               51                 45      66       73     68
  21      52               47                 45      85       89     90
  22      46               42                 36      62       63     72
  23      59               51                 54      68       68     72
  24      58               59                 55      68       69     72
  25      74               65                 58      65       74     73
  26      59               55                 50      78       74     76
  27      57               51                 44      70       80     74
  28      54               51                 46      72       79     80
  29      53               49                 48      60       65     69
  30      65               65                 62      62       59     70
  ```
### Summarise Data Process

* Melt data set with subject and activity as ids. Uses melt from reshape2 package
* Take the mean of values by subject, activity, and variable. Uses ddply from plyr package
* write the data set to a file. Uses write.table

### Structure of the final summarized data set
```S
'data.frame':	11880 obs. of  4 variables:
 $ subject : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activity: Factor w/ 6 levels "WALKING","WALKING_UPSTAIRG",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ variable: Factor w/ 66 levels "tBodyAcc-mean-X",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ Mean    : num  0.2773 -0.0174 -0.1111 0.9352 -0.2822 ...
```

### First rows of the final summarized data set
```S
  subject activity           variable        Mean
1       1  WALKING    tBodyAcc-mean-X  0.27733076
2       1  WALKING    tBodyAcc-mean-Y -0.01738382
3       1  WALKING    tBodyAcc-mean-Z -0.11114810
4       1  WALKING tGravityAcc-mean-X  0.93522320
5       1  WALKING tGravityAcc-mean-Y -0.28216502
6       1  WALKING tGravityAcc-mean-Z -0.06810286
```

### Table of measurements by subject and activity for summarized data set
Each subject has one mean for each variable for each activity. I extracted 66 variables.
```S
     WALKING WALKING_UPSTAIRG WALKING_DOWNSTAIRS SITTING STANDING LAYING
  1       66               66                 66      66       66     66
  2       66               66                 66      66       66     66
  3       66               66                 66      66       66     66
  4       66               66                 66      66       66     66
  5       66               66                 66      66       66     66
  6       66               66                 66      66       66     66
  7       66               66                 66      66       66     66
  8       66               66                 66      66       66     66
  9       66               66                 66      66       66     66
  10      66               66                 66      66       66     66
  11      66               66                 66      66       66     66
  12      66               66                 66      66       66     66
  13      66               66                 66      66       66     66
  14      66               66                 66      66       66     66
  15      66               66                 66      66       66     66
  16      66               66                 66      66       66     66
  17      66               66                 66      66       66     66
  18      66               66                 66      66       66     66
  19      66               66                 66      66       66     66
  20      66               66                 66      66       66     66
  21      66               66                 66      66       66     66
  22      66               66                 66      66       66     66
  23      66               66                 66      66       66     66
  24      66               66                 66      66       66     66
  25      66               66                 66      66       66     66
  26      66               66                 66      66       66     66
  27      66               66                 66      66       66     66
  28      66               66                 66      66       66     66
  29      66               66                 66      66       66     66
  30      66               66                 66      66       66     66
  ```
