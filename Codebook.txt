						Data Dictionary - University of California Irvine - Human Activity Recognition Data


	RAW DATA SET INFORMATION:
	The original data and the study being referenced can be found on the UCI HAR website, here: 
	https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
			
	CLEAN DATA SET INFORMATION:
	Based on an experiment where 30 subjects wore smartphones and had their movements recorded using the phones' internal accelerometer
	and gyroscope, the run_analysis.R script was written to tidy the data to specifications for the 'Getting and Cleaning Data' class on 
	Coursera.org.  The tidy data output from run_analysis.R is a data.frame called tidy_set, grouped by subject and activity, which contains an average
	of the mean and standard deviation measurements for each subject and each activity.
	
	Using R Studio (Version 0.98.1103), one can reconstruct the original data set, which had been broken up into separate files.  For the purposes
	of this analysis, only eight '.txt' files are needed - X_test, y_test, X_train, y_train, subject_test, subject_train, features,
	and activity_labels.  To avoid the data being built out of order, 'test' file rows were always first in any R operation, followed by 'train'.
	The tidy data set was constructed with the following steps:
	
			1) X_test and X_train were combined by rows to constitute all observations made by the accelerometers and gyroscopes for the
			   30 subjects.  These variables were assigned names from the features.txt file.
			2) y_test and y_train were combined by rows to constitute the activities of daily living performed by the 30 subjects.  The 
			   activities were labeled using the key found in activity_labels. The resulting variable was renamed "Activity".	    
			3) subject_test and subject_train were combined by rows, and renamed to "Subject".
			4) From the original data set, isolate only those variables with strings "mean" and "std" and combine them with Subject and Activity variables.
			5) Finally, group the data by Subject, then Activity.  For each remaining measurement variable, take the average of the values for each activity,
			   for each subject.  
			
	Note: 'meanFreq' and 'angle' variables were dropped due to not being a pure mean of the values, but rather a weighted average and
	an average based on a sample window, respectively. 

	VARIABLE NAMES DICTIONARY:
	
	Note:  The measurement variables in the tidy data contain a column for each axis being measured.  In this codebook, however, these variables will be grouped
		   together.  So, 'variablenameXYZ' means that 'X' is one axis (and one variable in tidy_set), 'Y' is a second axis (another variable), and 'Z' is a third(variable).
		   They possess the same definition, the only difference is the axis.  In the tidy data these variables were not collapsed into one.  This was done for two
		   reasons.  First, the assignment instructions seem to indicate that the tidy data should include the average for EACH measurement, for EACH subject, for
		   EACH activity.  Since each axis is its own measurement, in this tidy data they are left as such.  Secondly, for the sake of analytic flexibility, these 
		   were not collapsed together.  That being said, seeing as how there is no great distinction between one axis and another they are collapsed here. 
	
	Subject
		Value - numeric range 1:30, corresponds to one of the 30 subjects in the experiment.
	
	Activity
		Value - character string corresponding to one of six activities of daily life measured in the experiment.
			1_WALKING - the act of walking.
			2_WALKING UPSTAIRS - the act of walking upstairs.
			3_WALKING_DOWNSTAIRS - the act of walking downstairs.
			4_SITTING - the act of sitting.
			5_STANDING - the act of standing.
			6_LAYING - the act of laying down.
			
	tBodyAcc-XYZ
		Value - numeric, Body acceleration time domain signal from accelerometer.
		
	tGravityAcc-XYZ
		Value - numeric, Gravity acceleration time domain signal from accelerometer.
	
	tBodyAccJerk-XYZ
		Value - numeric, Body jerk time domain signal from body acceleration and angular velocity.
		
	tBodyGyro-XYZ
		Value - numeric, Body gyration time domain signal from gyroscope.
		
	tBodyGyroJerk-XYZ
		Value - numeric, Body jerk time domain signal from gyration and angular velocity.
		
	tBodyAccMag
		Value - numeric, Magnitude of body acceleration time domain signal from accelerometer.
	
	tGravityAccMag
		Value - numeric, Magnitude of gravity acceleration time domain signal from accelerometer.
		
	tBodyAccJerkMag
		Value - numeric, Magnitude of body jerk time domain signal from acceleration and angular velocity.
		
	tBodyGyroMag
		Value - numeric, Magnitude of body gyration time domain signal from gyroscope.
		
	tBodyGyroJerkMag
		Value - numeric, Magnitude of body jerk time domain signal from gyration and angular velocity.
		
	fBodyAcc-XYZ
		Value - numeric, Body acceleration frequency domain signal from accelerometer.
		
	fBodyAccJerk-XYZ
		Value - numeric, Body jerk frequency domain signal from accelerometer.
		
	fBodyGyro-XYZ
		Value - numeric, Body gyration frequency domain signal from gyroscope.
		
	fBodyAccMag
		Value - numeric, Magnitude of body acceleration frequency domain signal from accelerometer.

	fBodyAccJerkMag
		Value - numeric, Body jerk frequency domain signal from body acceleration and angular velocity.
		
	fBodyGyroMag
		Value - numeric, Magnitude of body gyration frequency domain signal from gyroscope.
		
	fBodyGyroJerkMag
		Value - numeric, Magnitude of body jerk frequency domain signal from gyration and angular velocity.
	
	
	OTHER INFORMATION ABOUT THIS DATA SET:
	
	To read the data into R, make sure you have tidy_set.txt in your working directory, then run the following code:
	
		tidy_set <- read.table("tidy_set.txt", header = TRUE)
		View(tidy_set)
		
	The development of tidy_set and this codebook would not have been possible without the helpful comments
	of David Hood at this link: https://class.coursera.org/getdata-015/forum/thread?thread_id=26  (must be logged
	into Coursera to access, and the link might expire at the end of this session of Getting and Cleaning Data)
			