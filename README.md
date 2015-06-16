# Getting and Cleaning Data Course Project

This script is designed to work with the following dataset from the UCI Machine Learning Repository:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Objective

The objective of this script is to:

* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement.
* Use descriptive activity names to name the activities in the data set
* Label the data set with descriptive variable names.
* Output a second, independent tidy data set with the average of each variable for each activity and each subject.

## Input

The script takes the filesystem path to directory containing the "train" and "test" datasets.

### Instructions

```
> source('./run_analysis.R')
> tidy_dataset <- load_uci_set("./input/UCI HAR Dataset")
```

## Output

The script outputs a data.table subsetted with the average of each variable for each activity and each subject.

```
> head(tidy_dataset, 1)
   subject activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tBodyAcc-std()-X tBodyAcc-std()-Y
1:       1 STANDING         0.2789176       -0.01613759        -0.1106018       -0.9957599       -0.9731901
   tBodyAcc-std()-Z tGravityAcc-mean()-X tGravityAcc-mean()-Y tGravityAcc-mean()-Z tGravityAcc-std()-X
1:       -0.9797759             0.942952           -0.2729838           0.01349058           -0.993763
   tGravityAcc-std()-Y tGravityAcc-std()-Z tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z
1:           -0.981226          -0.9763241            0.07537665           0.007975731           -0.00368525
   tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z tBodyGyro-mean()-X tBodyGyro-mean()-Y
1:           -0.9946045           -0.9856487           -0.9922512        -0.02398773        -0.05939722
   tBodyGyro-mean()-Z tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z tBodyGyroJerk-mean()-X
1:         0.07480075        -0.9871919        -0.9877344        -0.9806456            -0.09960921
   tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y
1:            -0.04406279            -0.04895055            -0.9929451            -0.9951379
   tBodyGyroJerk-std()-Z fBodyAcc-mean()-X fBodyAcc-mean()-Y fBodyAcc-mean()-Z fBodyAcc-std()-X
1:            -0.9921085        -0.9952499        -0.9770708        -0.9852971       -0.9960283
   fBodyAcc-std()-Y fBodyAcc-std()-Z fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
1:       -0.9722931       -0.9779373            -0.9946308            -0.9854187            -0.9907522
   fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z fBodyGyro-mean()-X fBodyGyro-mean()-Y
1:           -0.9950738           -0.9870182           -0.9923498         -0.9863868         -0.9889845
   fBodyGyro-mean()-Z fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z
1:         -0.9807731        -0.9874971        -0.9871077        -0.9823453
```

```
> write.table(tidy_dataset, "~/onyxrev/get_data_course/project 1//output/output.txt", row.name=FALSE)
```

... should produce the output found in ./output/output.txt
