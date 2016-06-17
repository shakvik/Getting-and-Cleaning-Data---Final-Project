Getting and Cleaning Data - Final Project - Code Book
=========================================================================
##Experiment description
-------------------------------------------------------------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
	* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	* Triaxial Angular velocity from the gyroscope. 
	* A 561-feature vector with time and frequency domain variables. 
	* Its activity label. 
	* An identifier of the subject who carried out the experiment.

##R Version - 3.3.0
-------------------------------------------------------------------------
##R studio version - 0.99.902
-------------------------------------------------------------------------
##VARIABLES
-------------------------------------------------------------------------
###RAW DATA
activity_labels - Links the class labels with their activity name.
features - Shows information about the variables used on the feature vector.

###RAW TEST DATA
y_test - Test labels.
X_test - Test set.
subject_test - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 corresponding to the identifier of the subject who carried out the experiment.
body_acc_x_test - The x component of body acceleration signal obtained by subtracting the gravity from the total acceleration. The units are standard gravity units 'g'.
body_acc_y_test - The y component of body acceleration signal obtained by subtracting the gravity from the total acceleration. The units are standard gravity units 'g'. 
body_acc_z_test - The z component of body acceleration signal obtained by subtracting the gravity from the total acceleration.  The units are standard gravity units 'g'.
body_gyro_x_test - The x component of angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
body_gyro_y_test - The y component of angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
body_gyro_z_test - The z component of angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
total_acc_x_test - The acceleration signal from the smartphone accelerometer x axis in standard gravity units 'g'.
total_acc_y_test - The acceleration signal from the smartphone accelerometer y axis in standard gravity units 'g'.
total_acc_z_test - The acceleration signal from the smartphone accelerometer z axis in standard gravity units 'g'.

###RAW TRAINING DATA
y_train - Training labels.
X_train - Training set.
subject_train - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
body_acc_x_train - The x component of body acceleration signal obtained by subtracting the gravity from the total acceleration. The units are standard gravity units 'g'.
body_acc_y_train - The y component of body acceleration signal obtained by subtracting the gravity from the total acceleration. The units are standard gravity units 'g'.
body_acc_z_train - The z component of body acceleration signal obtained by subtracting the gravity from the total acceleration.  The units are standard gravity units 'g'.
body_gyro_x_train - The x component of angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
body_gyro_y_train - The y component of angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
body_gyro_z_train - The z component of angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
total_acc_x_train - The acceleration signal from the smartphone accelerometer x axis in standard gravity units 'g'.
total_acc_y_train - The acceleration signal from the smartphone accelerometer y axis in standard gravity units 'g'.
total_acc_z_train - The acceleration signal from the smartphone accelerometer z axis in standard gravity units 'g'.

###DERIVED DATA
activity - Data set mapping the activity label to activity IDs.
subject_merged - Data set mapping activity label and IDs to subject IDs.
X_merged - Merged X_test and X_train datasets
totalaccel_x - Merged total acceleration(x omponent).
totalaccel_y - Merged total acceleration(y omponent).
totalaccel_z - Merged total acceleration(z omponent).
bodyaccel_x - Merged body acceleration(x omponent).
bodyaccel_y - Merged body acceleration(y omponent).
bodyaccel_z - Merged body acceleration(z omponent).
angularvelocity_x - Merged angular velocity(x omponent).
angularvelocity_y - Merged angular velocity(y omponent).
angularvelocity_z - Merged angular velocity(z omponent).
step1 - Tidy merged dataset mapping each subject to a sepcific activity ID, activity label and the corresponding data.
meanindex - vector of column positions containing mean data.
stdevindex - vector of column positions ocntaining standard deviation data
step2 - Data set with the extracted mean and standard deviation of measurements.
step3 - Data set with extracted mean and standard deviation with descriptive activity names and variable names.
step5 - Tidy data set with the average of each variable for each security and each subject(final output).