

## require(data.table)
## Read raw text files into data.tables
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Combine subject values for test and train sets. Rename column to "Subject".
subjects <- bind_rows(subject_test, subject_train)
colnames(subjects)[1] <- "Subject"

## Combine activity values for test and train sets, then reassign
## numeric values to the appropriate string from activity_labels.txt.  
## Rename column to "Activity" for clarity.
compl_actv <- bind_rows(activity_test, activity_train)
compl_actv[compl_actv$V1 == 1,] <- "1_WALKING"
compl_actv[compl_actv$V1 == 2,] <- "2_WALKING_UPSTAIRS"
compl_actv[compl_actv$V1 == 3,] <- "3_WALKING_DOWNSTAIRS"
compl_actv[compl_actv$V1 == 4,] <- "4_SITTING"
compl_actv[compl_actv$V1 == 5,] <- "5_STANDING"
compl_actv[compl_actv$V1 == 6,] <- "6_LAYING"
colnames(compl_actv)[1] <- "Activity"

## Join train and test sets into one data.table, then appropriately label
## the data set with descriptive variable names from features.txt.  Clean up 
## variable names a little bit with gsub().
complete_set <- tbl_df(full_join(test_set, train_set))

features <- read.table("./UCI HAR Dataset/features.txt",
                       sep = "",
                       stringsAsFactors = FALSE,
                       col.names = c(1,2))

features <- features[,2]
features <- gsub("\\(\\)", "",features)
features <- gsub("-", " ", features)
setnames(complete_set, features)

## Build a new data frame comprised of only the measurements on the mean and
## standard deviation for each measurement. Then append 'Subject' and
## 'Activity' columns to the beginning of the data frame. 
means.df <- complete_set[, grepl("mean" , names(complete_set))]
mean.df <- means.df[, grep("meanFreq" , invert = TRUE, names(means.df))]
std.df <- complete_set[, grepl("std", names(complete_set))]
mean.std.df <- bind_cols(subjects, compl_actv, mean.df, std.df)

## Group the variables by Subject, then Activity.  Summarize each descriptive
## variable column to find the mean for each activity and each subject.
mean.std.df <- group_by(mean.std.df, Subject, Activity)

tidy_set <- summarise_each(mean.std.df, funs(mean), -Subject, -Activity)
print(tidy_set)
## Write text file to working directory:  
write.table(tidy_set, file = "GetData_course_project_tidy_set.txt", row.name = FALSE)