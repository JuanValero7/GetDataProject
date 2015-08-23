# GetDataProject

##The run analisys script make:
-Read the data from the workdirectory, it read all the test and all the train data
-Then it merges the data in one data set. But, because the NA values I work with then for separate in the rest of the code
-With the grep function I search "mean" and "std" words in the features dataset. and create a new character vector with it
-Then I insert the names of the columns reading the data again but doing this step in te read.table command
-With this already I create the new data set, merging in two data frame the Subject ID and the activity that is measure
-Whit this data I use the command ColMeans to calculate all the means to all the columns and rows that I care (means and std)
Finally I merge everything in only one data frame that contains all the information I care (mean and measure)for all the subjects
Then I write a first table that does not contain the names of the Columns. And reading this table but with the Col.Names command reinsert this names
In the lasdt step I change the number code of the activitys for the real names.

##Data Book
The code that is use in the Datasets is:

f=Frequency
t=Time
Acc=Acceleration
Gyro=Gyroscope
Mag=Magnitude
Jerk=Jerk
X=axis X
Y=axis Y
Z=axis Z
std=Standar desviation

For more information(copy for the featured info)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
