# GCD_CourseProject

##Uses libraries:
dplyr
reshape2

##Method follows:

###1. Merge train and test data.

###2. Extract mean and standard deviation data fields.
Desired variables are extracted using dplyr.

###3. Replace activity values with descriptive values, as follows:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

###4. Ensure descriptive column names.
Also see CodeBook for further details on column (variable) names.

###5. Create tidy data set with averaged values for each activity and subject.
A tidy data set is created using reshape2.