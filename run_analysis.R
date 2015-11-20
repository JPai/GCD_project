##run_analysis.R
#Description: 
#For further info, please read the README.MD and CodeBook.MD files.

#include libraries
library(plyr)
library(dplyr)

##Load data sets
#Note. the the Samsung data sets (raw data) are required in 
#the working directory (under "HCI HAR Dataset") folder.
te_st <- read.table("./UCI HAR Dataset/test/subject_test.txt")
te_X <- read.table("./UCI HAR Dataset/test/X_test.txt")
te_y <- read.table("./UCI HAR Dataset/test/y_test.txt")

tr_st <- read.table("./UCI HAR Dataset/train/subject_train.txt")
tr_X <- read.table("./UCI HAR Dataset/train/X_train.txt")
tr_y <- read.table("./UCI HAR Dataset/train/y_train.txt")

f <- read.table("./UCI HAR Dataset/features.txt")
act <- read.table("./UCI HAR Dataset/activity_labels.txt")

##Merges the training and the test sets to create one data set.
#Merge the test data set
test_data <- cbind(subject_id = te_st$V1, activity = te_y$V1, te_X)
#Merge the train data set
train_data <- cbind(subject_id = tr_st$V1, activity = tr_y$V1, tr_X)
#Merge test and train datas
whole_data <- join(test_data, train_data, type = "full")

##Extracts only the measurements on the mean and standard deviation for 
##each measurement.
f_mean_std <- f[c(grep("mean", f$V2, ignore.case = TRUE), 
                  grep("std()", f$V2, ignore.case = TRUE)), ]
ext_data <- whole_data[, c(1:2, (f_mean_std$V1 + 2))]

##Uses descriptive activity names to name the activities in the data set
#change the activity label to the activity name
#x = activity label
#return: activity name
act_name <- function(x) {
        if (x == 1) return(act$V2[1])
        if (x == 2) return(act$V2[2])
        if (x == 3) return(act$V2[3])
        if (x == 4) return(act$V2[4])
        if (x == 5) return(act$V2[5])
        if (x == 6) return(act$V2[6])
}
#label -> name
ext_data$activity <- sapply(ext_data$activity, act_name)

##Appropriately labels the data set with descriptive variable names. 
proper_names <- as.character(f_mean_std$V2)
colnames(ext_data)[3:ncol(ext_data)] <- proper_names

##Create a tidy data set with the average of each variable for each activity 
##and each subject.
#convert subject_id from int to factor
ext_data$subject_id <- as.factor(ext_data$subject_id)
#calculate the the average of each variable for each activity
#and return the result
tidy_data <- aggregate(ext_data[, 3:ncol(ext_data)], list(ext_data$subject_id, 
                                              ext_data$activity), mean)
#change the names of subject_id and activity back
names(tidy_data)[1] <- "subject_id"
names(tidy_data)[2] <- "activity"
names(tidy_data)[3:ncol(tidy_data)] <- 
        paste("mean-", names(tidy_data)[3:ncol(tidy_data)], sep = "")
#order the tidy_data by subject_id
tidy_data <- tidy_data[order(tidy_data$subject_id), ]

##Export the tidy_data to the working directory
write.table(tidy_data, "result_tiny_data.txt", row.names = FALSE, sep = "\t")


