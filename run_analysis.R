directory_path <- "/Users/z/Coursera_courses/Data_Science_Spec/projects_and_books/3_Getting_and_Cleaning_Data/course_project"
setwd(directory_path)
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
unzip(temp)
unlink(temp)
library(data.table)
library(dplyr)
setwd(paste(directory_path, "/UCI HAR Dataset", sep=""))
activity_label <- read.table("activity_labels.txt")
feature_label <- read.table("features.txt")

setwd(paste(directory_path, "/UCI HAR Dataset/test", sep=""))
test <- fread("X_test.txt", sep = ' ', check.names = TRUE, data.table = TRUE)
test_subject <- fread("Subject_test.txt", sep = ' ', check.names = TRUE, data.table = TRUE)
test_activity <- fread("y_test.txt", sep = ' ', check.names = TRUE, data.table = TRUE)
setnames(test, as.character(feature_label[,2])) #4. Labels data set with descriptive variable name
test[, subject := test_subject[,1]]
test[, activity := test_activity[,1]]

setwd(paste(directory_path, "/UCI HAR Dataset/train", sep=""))
train <- fread("X_train.txt", sep = ' ', check.names = TRUE, data.table = TRUE)
train_subject <- fread("Subject_train.txt", sep = ' ', check.names = TRUE, data.table = TRUE)
train_activity <- fread("y_train.txt", sep = ' ', check.names = TRUE, data.table = TRUE)
setnames(train, as.character(feature_label[,2])) #4. Labels data set with descriptive variable name
train[, subject := train_subject[,1]]
train[, activity := train_activity[,1]]
data <- bind_rows(test, train) #1 Merges the training and the test sets to create one data set

#2. Extracts only the measurements on the mean and standard deviation for each measurement
data_extract <- bind_cols(select(data, contains(c("mean"))), select(data, contains(c("std"))))
data_extract <- bind_cols(data_extract, select(data, c("subject", "activity")))
    
#3. Uses descriptive activity names to name the activities in the data set
activity_vector <- as.character(activity_label[,2]) #created a vector of activity names
data_extract[, activity_name := activity_vector[activity]] #add new column named activity_name to show actual name of the activity

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_average <- data_extract[, lapply(.SD, mean), by = .(subject, activity_name)]
tidy_average <- tidy_average[order(subject, activity_name)] #sort by subject index and activity name
setwd(directory_path)
write.table(tidy_average, "tidy_data.txt", row.names = FALSE)
