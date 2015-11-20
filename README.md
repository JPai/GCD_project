## GCD_project

###Introduction
This repo is for the course project for theCoursera course: Getting and Cleaning Data.  

###Summary
The R script (`run_analysis.R`) takes the Samsung data set (the designated raw data) as the input and transformed it into a tidy data set (`result_tidy_data.txt`).  

###Raw Data
The raw data we used for the script are collected from the accelerometers from the Samsung Galaxy S smartphone. It could be downloaded fromt the following URL:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

###Instruction/R Script (`run_analysis.R`)
This script takes the raw data as the input and transformed it into a tidy data set. The following is the instruction: 

1. Download and Unzip the raw data in the working directory.
2. The folder *UCI HAR Dataset* with the data should be saved in the working directory now.
3. Please **DO NOT** change the files/data in the *HCI HAR Dataset* folder.
4. Run the script `run_analysis.R`.
5. The tidy data set should be generated in the file `result_tidy_data.txt` in the working directory.

###Tidy Data (`result_tidy_data.txt`)
The tidy data are transformed from the raw data by the R script.  It will be exported in the working directory with the file name `result_tidy_data.txt`.

###CodeBook
For further info about the data, transformation performed, and the experients, please refer to CodeBook.MD file.