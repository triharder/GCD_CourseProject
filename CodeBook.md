# Code Book for getdata-031 Course Project
##Variables
The following universal abbreviations persist through variable names where applicable:

t = time

f = frequency

Acc = Accelerometer 

Gyro = Gyroscope

Mag = Magnitude


(Body and Gravity indicate the motion components of the sensor signals.)

###From time domain signals:
####From accelerometer sensor:
tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag


####From gyroscope sensor:
tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyGyroMag

tBodyGyroJerkMag


###From frequency domain signals:
####From accelerometer sensor:
fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyAccMag

fBodyAccJerkMag


####From gyroscope sensor:
fBodyGyro-XYZ

fBodyGyroMag

fBodyGyroJerkMag


###From averaging signals in a signal window sample:
gravityMean

####From accelerometer sensor:
tBodyAccMean

tBodyAccJerkMean

####From gyroscope sensor:
tBodyGyroMean

tBodyGyroJerkMean

##Data
Mean and standard deviation values were extracted for focus of analysis.

##Transformations
1. Data was ingested as tables to ensure proper separation between fields/values.
2. Tidy column names were added.
3. Columns of respective training and testing data were bound.
4. Rows of consolidated training and testing data were combined.