library(dplyr)
library(tidyr)

#import common data
activity_labels<-read.delim(file="./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="")
features<-read.delim(file="./UCI HAR Dataset/features.txt",header=FALSE,sep="")

#import test data
y_test<-read.delim(file="./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="")
X_test<-read.delim(file="./UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="")
subject_test<-read.delim(file="./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="")

body_acc_x_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",header=FALSE,sep="")
body_acc_y_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",header=FALSE,sep="")
body_acc_z_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",header=FALSE,sep="")

body_gyro_x_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",header=FALSE,sep="")
body_gyro_y_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",header=FALSE,sep="")
body_gyro_z_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",header=FALSE,sep="")

total_acc_x_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header=FALSE,sep="")
total_acc_y_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",header=FALSE,sep="")
total_acc_z_test<-read.delim(file="./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",header=FALSE,sep="")

#import training data
y_train<-read.delim(file="./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="")
X_train<-read.delim(file="./UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="")
subject_train<-read.delim(file="./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="")

body_acc_x_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",header=FALSE,sep="")
body_acc_y_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",header=FALSE,sep="")
body_acc_z_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",header=FALSE,sep="")

body_gyro_x_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",header=FALSE,sep="")
body_gyro_y_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",header=FALSE,sep="")
body_gyro_z_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",header=FALSE,sep="")

total_acc_x_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",header=FALSE,sep="")
total_acc_y_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",header=FALSE,sep="")
total_acc_z_train<-read.delim(file="./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",header=FALSE,sep="")


#Create merged Activities and Subject table
activity<-left_join(rbind(y_test,y_train),activity_labels,by=c("V1"="V1"))
colnames(activity)<-c("ActivityNo","Activity")
subject_merged<-cbind(activity,rbind(subject_test,subject_train))
colnames(subject_merged)<-c(colnames(activity),"Subject")

#Rename and merge X_test and X_train with appropriate column names
colnames(X_test)<-features[,2]
colnames(X_train)<-features[,2]
X_merged<-rbind(X_test,X_train)

#Creating merged acceleration and velocity dataframes
totalaccel_x<-rbind(total_acc_x_test,total_acc_x_train)
totalaccel_y<-rbind(total_acc_y_test,total_acc_y_train)
totalaccel_z<-rbind(total_acc_z_test,total_acc_z_train)

bodyaccel_x<-rbind(body_acc_x_test,body_acc_x_train)
bodyaccel_y<-rbind(body_acc_y_test,body_acc_y_train)
bodyaccel_z<-rbind(body_acc_z_test,body_acc_z_train)

angularvelocity_x<-rbind(body_gyro_x_test,body_gyro_x_train)
angularvelocity_y<-rbind(body_gyro_y_test,body_gyro_y_train)
angularvelocity_z<-rbind(body_gyro_z_test,body_gyro_z_train)

step1<-cbind(subject_merged,X_merged)

#Step2  Extract mean and std
meanindex<-grep("mean()",features[,2],fixed=TRUE)
stdevindex<-grep("std()",features[,2],fixed=TRUE)
step2<-X_merged[,c(meanindex,stdevindex)]

#Step3 Adding descriptive activity names
step3<-cbind(subject_merged,step2)

#Step 4
## By the end of step 3 the variables have apporpriate names as it is

#step 5 tidy dataset
step5 <-aggregate(step3[,4:69], by=list(step3$Activity,step3$Subject), FUN=mean, na.rm=TRUE)
colnames(step5)<-c("Activity","Subject",colnames(step5)[3:ncol(step5)])

#export the tidy data from step5
write.table(x=step5,file="run_analysis_output.txt",row.names = FALSE)





