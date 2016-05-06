# Code Book

This is the code book for the resulting tidy data set file called "tidydata.txt"

## Subject and Activity

The first tow variables found in the file are subject and activity.

	- Subject: the integer subject ID.
	- Activity: the string activity name:
		- Walking
  		- Walking Upstairs
  		- Walking Downstairs
  		- Sitting
  		- Standing
  		- Laying

## Measurement Means

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAccXYZ and tGravityAccXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

	- tBodyAccXYZ
	- tGravityAccXYZ
	- tBodyAccJerkXYZ
	- tBodyGyroXYZ
	- tBodyGyroJerkXYZ
	- tBodyAccMag
	- tGravityAccMag
	- tBodyAccJerkMag
	- tBodyGyroMag
	- tBodyGyroJerkMag
	- fBodyAccXYZ
	- fBodyAccJerkXYZ
	- fBodyGyroXYZ
	- fBodyAccMag

	- mean: Mean value
		- tBodyAccmeanX
		- tBodyAccmeanY
		- tBodyAccmeanZ
		- tGravityAccmeanX
		- tGravityAccmeanY
		- tGravityAccmeanZ
		- tBodyAccJerkmeanX
		- tBodyAccJerkmeanY
		- tBodyAccJerkmeanZ
		- tBodyGyromeanX
		- tBodyGyromeanY
		- tBodyGyromeanZ
		- tBodyGyroJerkmeanX
		- tBodyGyroJerkmeanY
		- tBodyGyroJerkmeanZ
		- tBodyAccMagmean
		- tGravityAccMagmean
		- tBodyAccJerkMagmean
		- tBodyGyroMagmean
		- tBodyGyroJerkMagmean
		- fBodyAccmeanX
		- fBodyAccmeanY
		- fBodyAccmeanZ
		- fBodyAccmeanFreqX
		- fBodyAccmeanFreqY
		- fBodyAccmeanFreqZ
		- fBodyAccJerkmeanX
		- fBodyAccJerkmeanY
		- fBodyAccJerkmeanZ
		- fBodyAccJerkmeanFreqX
		- fBodyAccJerkmeanFreqY
		- fBodyAccJerkmeanFreqZ
		- fBodyGyromeanX
		- fBodyGyromeanY
		- fBodyGyromeanZ
		- fBodyGyromeanFreqX
		- fBodyGyromeanFreqY
		- fBodyGyromeanFreqZ
		- fBodyAccMagmean
		- fBodyAccMagmeanFreq
		- fBodyBodyAccJerkMagmean
		- fBodyBodyAccJerkMagmeanFreq
		- fBodyBodyGyroMagmean
		- fBodyBodyGyroMagmeanFreq
		- fBodyBodyGyroJerkMagmean
		- fBodyBodyGyroJerkMagmeanFreq
		- angle.tBodyAccMean.gravity.
		- angle.tBodyAccJerkMean..gravityMean.
		- angle.tBodyGyroMean.gravityMean.
		- angle.tBodyGyroJerkMean.gravityMean.
		- angle.X.gravityMean.
		- angle.Y.gravityMean.
		- angle.Z.gravityMean.
		- tBodyAccstdX
		- tBodyAccstdY
		- tBodyAccstdZ
		- tGravityAccstdX
		- tGravityAccstdY
		- tGravityAccstdZ
		- tBodyAccJerkstdX
		- tBodyAccJerkstdY
		- tBodyAccJerkstdZ
		- tBodyGyrostdX
		- tBodyGyrostdY
		- tBodyGyrostdZ
		- tBodyGyroJerkstdX
		- tBodyGyroJerkstdY
		- tBodyGyroJerkstdZ
		- tBodyAccMagstd
		- tGravityAccMagstd
		- tBodyAccJerkMagstd
		- tBodyGyroMagstd
		- tBodyGyroJerkMagstd
		- fBodyAccstdX
		- fBodyAccstdY
		- fBodyAccstdZ
		- fBodyAccJerkstdX
		- fBodyAccJerkstdY
		- fBodyAccJerkstdZ
		- fBodyGyrostdX
		- fBodyGyrostdY
		- fBodyGyrostdZ
		- fBodyAccMagstd
		- fBodyBodyAccJerkMagstd
		- fBodyBodyGyroMagstd
		- fBodyBodyGyroJerkMagstd
