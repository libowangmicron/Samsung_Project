### Cleaning and Getting data Course Project

setwd("F:/Education/Getting and Cleaning Data/Course Project/UCI HAR Dataset")

features <- read.table('features.txt',stringsAsFactors=F)

dim(features)


### format the train data

X_train <- read.table('./train/X_train.txt')
dim(X_train)
# [1] 7352    1

y_train <- read.table('./train/y_train.txt')
dim(y_train)
# [1] 7352    1

subject_train <- read.table('./train/subject_train.txt')
dim(subject_train)
# [1] 7352    1

train <- cbind(subject_train,y_train, X_train)

names(train) <- c("SubID", "ActID", features[,2])

### format the test data

X_test <- read.table('./test/X_test.txt')
dim(X_test)
#[1] 2947  561

y_test <- read.table('./test/y_test.txt')
dim(y_train)
#[1] 2947  561

subject_test <- read.table('./test/subject_test.txt')
dim(subject_train)
#[1] 2947  561

test <- cbind(subject_test,y_test, X_test)

names(test) <- c("SubID", "ActID", features[,2])

### merge train and test data

data_merge <- rbind(train, test)

### Extracts only the measurements on the mean and standard deviation for each measurement. 

idx1 <- grep("mean()", names(data_merge))

idx2 <- grep("std()", names(data_merge))

idx <- c(idx1, idx2)

data2 <- data_merge[,idx]










