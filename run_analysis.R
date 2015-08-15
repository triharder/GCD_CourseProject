#Libraries
library(dplyr)
library(reshape2)

#Getting data
if(!file.exists("./UCI HAR Dataset")){
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI_HAR_Dataset.zip")
unzip("UCI_HAR_Dataset.zip")}

#Cleaning data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("Pos","Variable"))

##Training data
trainSub <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
trainAct <- read.table("UCI HAR Dataset/train/Y_train.txt", col.names = "Activity")
trainVar <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = t(features[2]))

train <- cbind(trainSub,trainAct,trainVar)

##Testing data
testSub <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
testAct <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "Activity")
testVar <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = t(features[2]))

test <- cbind(testSub,testAct,testVar)

#1. Merges the training and the test sets to create one data set.
gcd_cp <- rbind(train,test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#Adjust feature index after Subjects and Activity placed in first two columns
features$Pos <- features$Pos + 2
gcd_extract <- select(gcd_cp,matches('subject|activity|mean|std'))

#3. Uses descriptive activity names to name the activities in the data set
act_names <- read.table("UCI HAR Dataset/activity_labels.txt")
gcd_extract$Activity <- factor(gcd_extract$Activity, levels = act_names[,1], labels = act_names[,2])

#4. Appropriately labels the data set with descriptive variable names.
#The CodeBoook contains details on variable names. For a technical person, the variable names are explanatory and being abbreviated are more convenient to manipulate for further analysis in R. For the non-technical person, the CodeBook can serve as a reference and enable the same convenience.
#For the sake of the project and proof of text editing competence, the variables with redundant term presence are corrected:
names(gcd_extract) <- gsub("BodyBody", "Body", names(gcd_extract))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
melt_extract <- melt(gcd_extract, id = c("Subject", "Activity"))
gcd_tidy <- dcast(melt_extract, Subject + Activity ~ variable, mean)

write.table(gcd_tidy,file = "tidy.txt", row.name=F)