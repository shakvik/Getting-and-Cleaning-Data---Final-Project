Getting and Cleaning Data - Final Project - Shakthivel Vikrant Masilamani
=========================================================================
-------------------------------------------------------------------------

The script uses the libraries tidyr and dplyr and does the following

1.Loads raw data using 'read.delim'.

	* activity_labels<-read.delim(file="./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="")
	* features<-read.delim(file="./UCI HAR Dataset/features.txt",header=FALSE,sep="")
	* y_test<-read.delim(file="./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="")
	* X_test<-read.delim(file="./UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="")
	* subject_test<-read.delim(file="./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="")
	* body_acc_x_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",header=FALSE,sep="")
	* body_acc_y_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",header=FALSE,sep="")
	* body_acc_z_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",header=FALSE,sep="")
	* body_gyro_x_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",header=FALSE,sep="")
	* body_gyro_y_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",header=FALSE,sep="")
	* body_gyro_z_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",header=FALSE,sep="")
	* total_acc_x_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header=FALSE,sep="")
	* total_acc_y_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",header=FALSE,sep="")
	* total_acc_z_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",header=FALSE,sep="")
	* y_train<-read.delim(file="./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="")
	* X_train<-read.delim(file="./UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="")
	* subject_train<-read.delim(file="./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="")
	* body_acc_x_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",header=FALSE,sep="")
	* body_acc_y_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",header=FALSE,sep="")
	* body_acc_z_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",header=FALSE,sep="")
	* body_gyro_x_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",header=FALSE,sep="")
	* body_gyro_y_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",header=FALSE,sep="")
	* body_gyro_z_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",header=FALSE,sep="")
	* total_acc_x_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",header=FALSE,sep="")
	* total_acc_y_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",header=FALSE,sep="")
	* total_acc_z_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",header=FALSE,sep="")

2.Merges the y_test and y_train activity ID data using rbind to get a merged dataset of activity ID's and uses 'left_join' to assign appropraite activity labels. This is as the dataframe 'activity'.

	* activity<-left_join(rbind(y_test,y_train),activity_labels,by=c("V1"="V1"))
	* colnames(activity)<-c("ActivityNo","Activity")
	* subject_merged<-cbind(activity,rbind(subject_test,subject_train))
	* colnames(subject_merged)<-c(colnames(activity),"Subject")

3.Appropriately renames the columns of by using the information from the features file and merges them to create X_merged.

	* colnames(X_test)<-features[,2]
	* colnames(X_train)<-features[,2]
	* X_merged<-rbind(X_test,X_train)

4.The test and train files(total acceleration, body acceleration and angular velocity) from the inertial signals folders are also merged togther using rbind.

	* totalaccel_x<-rbind(total_acc_x_test,total_acc_x_train)
	* totalaccel_y<-rbind(total_acc_y_test,total_acc_y_train)
	* totalaccel_z<-rbind(total_acc_z_test,total_acc_z_train)
	* bodyaccel_x<-rbind(body_acc_x_test,body_acc_x_train)
	* bodyaccel_y<-rbind(body_acc_y_test,body_acc_y_train)
	* bodyaccel_z<-rbind(body_acc_z_test,body_acc_z_train)
	* angularvelocity_x<-rbind(body_gyro_x_test,body_gyro_x_train)
	* angularvelocity_y<-rbind(body_gyro_y_test,body_gyro_y_train)
	* angularvelocity_z<-rbind(body_gyro_z_test,body_gyro_z_train)

5.Creates the dataframe 'step1' which is merged tidy data set of 'subject_merged' and 'X_merged'.

	* step1<-cbind(subject_merged,X_merged)

6.Creates two vectors(meanindex and stdevindex) that contains the column indices of X_merged refrerring to the mean and std dard deviation data.

	* meanindex<-grep("mean()",features[,2],fixed=TRUE)
	* stdevindex<-grep("std()",features[,2],fixed=TRUE)

7.Creates the dataframe 'step2' which extracts the appropriate columns from X_merged.

	* step2<-X_merged[,c(meanindex,stdevindex)]

8.Creates the df 'step3' that merges 'subject_merged' and 'step2' to produce a tidy dataset linking every subject to every activity performed by that subject and the apporpriate means and standard deviations of the measuremets.

	* step3<-cbind(subject_merged,step2)

9.Finally creates the df 'step5' using the 'aggregate' function from 'tidyr' to find the mean grouped by each subject and each activity.

	* step5 <-aggregate(step3[,4:69], by=list(step3$Activity,step3$Subject), FUN=mean, na.rm=TRUE)
	* colnames(step5)<-c("Activity","Subject",colnames(step5)[3:ncol(step5)])

10.Exports the tidy dataset(step5) using the write.table command.

	* write.table(x=step5,file="run_analysis_output.txt",row.names = FALSE)