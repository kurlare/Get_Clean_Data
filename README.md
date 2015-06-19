## Getting and Cleaning Data Course Project

### by Raphael Kurlansik
_June 19, 2015_

<br>

### Files
______________________________________________________________________________________________________________________
The following files in this repo pertain to the assignment:

**run_analysis.R**

This file is a script which cleans up the data set for the [Human Activity Recognition Using Smart Phones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Before you run the script, make sure that you have the folder named 'UCI HAR Dataset' in your working directory.  

The output is a text file called 'GetData_course_project_tidy_set.txt' that contains a table with 180 observations of 68 variables related to the experiment.  

**Codebook.md**

This is a markdown file that elaborates on three things:

1. The nature of the experiment and the raw data.
2. What transformations were performed on the raw data to reach a state of tidy data.
3. A key with further information for each of the 68 variables in the tidy data set.

### Reading into R
_______________________________________________________________________________________________________________________
To view the tidy data in R, make sure you have GetData_course_project_tidy_set.txt in your working directory, then run the following code:

    tidy_set <- read.table("GetData_course_project_tidy_set.txt", header = TRUE)
    View(tidy_set)    
