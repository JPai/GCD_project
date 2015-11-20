## CodeBook for the tidy data set (`result_tidy_data.txt`)

###Study design - data summrization

The raw data we used for the script are collected from the accelerometers from the Samsung Galaxy S smartphone. It could be downloaded fromt the following URL:  

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

From the raw data, the following transformation has been performed in order to generate the tidy data:

1. Merge 3 tables (subject_test.txt, X_test.txt, and y_test.txt) from the test data set of raw data.
2. Merge 3 tables (subject_train.txt, X_train.txt, and y_train.txt) from the train data set of raw data.
3. Merge the tables created in Step 1 and 2 (including all of the observations/measurements).
4. Subsetting the table created in Step 3 to extract only the measurements on the mean and standard deviation for each measurement. (The features with the names contains "mean" or "std" (ignore case)) 
5. Rename the activities of the table created in Step 4 based to descriptive activity names based on the activity_label.txt from the raw data set.
6. Rename the variable names from the table above to descriptive variable names based on features.txt from the raw data set.
7. From the data set in Step 6, create second, independent tidy data set with the average of each variable for each activity and each subject.
8. Export the tidy data set in Set 7 to file `result_tidy_data.txt` in the working directory.


###Code book
The tidy data set (`result_tidy_data.txt`) contains 88 variables. Each observation represents the average of a *feature* for a *subject* (volunteer) doing a kind of *activity*.  The average numbers are   

**Variables**

* subject_id: 
    * variable type: factor
    * allowable value: 30 levels, "1" to "30"
    * description: the assigned id for the experiment volunteers
* activity:
    * variable type: factor
    * allowable value: 6 levels, "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
    * description: the activity performed by the volunteer

For the rest 86 variables, they have the same structure as following:  

* **mean-feature**:
     * variable type: numeric
     * allowable value: -1 to 1
     * description: the average of **feature** for the volunteer doing the activity.

Example: 

* mean-tBodyAcc-mean()-X:
     * variable type: numeric
     * allowable value: -1 to 1
     * description: the average of tBodyAcc-mean()-X for the volunteer doing the activity.
     
Notes: 
- Features are normalized and bounded within [-1,1].
