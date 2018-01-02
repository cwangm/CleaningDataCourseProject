Introduction
------------

The data processed from this project came from accelerometer and
gyroscope signal measured from a group of 30 subjects who were
performing six activities (walking, walking upstairs, walking
downstairs, sitting, standing, laying). All activities were video
recorded and lableled manually. The data set was subsequently
partitioned into two sets, consisting of 70% in a traninging data set
and 30% in a test data set. Of note, each row of the original data sets
contains a vector of 561 features consisting of various metrics of the
accelerometer and gyrosocpe signal. The subject index and activity index
for each row were stored as separate data files.

Data Processing
---------------

All data process R code are saved in "run\_analysis.R"

### Data download and read

The raw data is downloaded directly from
("<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>").
It was unzipped into all of the component files. The activity names and
variable(feature) names were stored as files "activity\_labels" and
"features.txt", and they were loaded into R using the read.table
function.

### Data processing

The feature data were read via fread function, resulting in a
data.table. This was repeated separately for the training and test data
sets. The columns were renamed to reflect the actual feature name via
the setnames function. Subject index and activity index were also read
into R using the fread function, and added as columns to the feature
data.table. The processed training and test data.tables were merged via
the bind\_rows function.

### Data extraction

The merged data.table was further processed via the select function to
retain only columns with names including keywords of "mean" or "std",
resulting in 86 features.

### Data modification

The activity index of the extracted data was replaced with actual names
of the activity via internal function of the data.table, which created a
new column of the activity name corresponding to the previous activity
index.

### Data summarization

The mean of each selected feature was calculated via lapply function and
grouped by subject index and activity name. In the output data.table,
each row represents a unique combination of subject index and activity
type, and the value for each feature represent the mean over all rows
matching the subject index and activity type in the original data. The
resulting summary data.table was sorted in ascending order by subject
index and activity name and presented as the final tidy data, and saved
as "tidy\_data.txt".

Table of all features in the output tidy data.
----------------------------------------------

<table>
<caption>A table of all variables, with relevant units, types and descriptions.</caption>
<thead>
<tr class="header">
<th align="left">Index</th>
<th align="left">Column_Name</th>
<th align="left">Type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">[1]</td>
<td align="left">subject</td>
<td align="left">integer</td>
<td align="left">subject number (range 1-30)</td>
</tr>
<tr class="even">
<td align="left">[2]</td>
<td align="left">activity_name</td>
<td align="left">characters</td>
<td align="left">name of activity (walking, walking_upstairs, walking_downstairs, sitting, standing, lying)</td>
</tr>
<tr class="odd">
<td align="left">[3]</td>
<td align="left">tBodyAcc-mean()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[4]</td>
<td align="left">tBodyAcc-mean()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[5]</td>
<td align="left">tBodyAcc-mean()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[6]</td>
<td align="left">tGravityAcc-mean()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[7]</td>
<td align="left">tGravityAcc-mean()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[8]</td>
<td align="left">tGravityAcc-mean()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[9]</td>
<td align="left">tBodyAccJerk-mean()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[10]</td>
<td align="left">tBodyAccJerk-mean()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[11]</td>
<td align="left">tBodyAccJerk-mean()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[12]</td>
<td align="left">tBodyGyro-mean()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[13]</td>
<td align="left">tBodyGyro-mean()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[14]</td>
<td align="left">tBodyGyro-mean()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[15]</td>
<td align="left">tBodyGyroJerk-mean()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[16]</td>
<td align="left">tBodyGyroJerk-mean()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[17]</td>
<td align="left">tBodyGyroJerk-mean()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[18]</td>
<td align="left">tBodyAccMag-mean()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[19]</td>
<td align="left">tGravityAccMag-mean()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[20]</td>
<td align="left">tBodyAccJerkMag-mean()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[21]</td>
<td align="left">tBodyGyroMag-mean()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[22]</td>
<td align="left">tBodyGyroJerkMag-mean()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[23]</td>
<td align="left">fBodyAcc-mean()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[24]</td>
<td align="left">fBodyAcc-mean()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[25]</td>
<td align="left">fBodyAcc-mean()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[26]</td>
<td align="left">fBodyAcc-meanFreq()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[27]</td>
<td align="left">fBodyAcc-meanFreq()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[28]</td>
<td align="left">fBodyAcc-meanFreq()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[29]</td>
<td align="left">fBodyAccJerk-mean()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[30]</td>
<td align="left">fBodyAccJerk-mean()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[31]</td>
<td align="left">fBodyAccJerk-mean()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[32]</td>
<td align="left">fBodyAccJerk-meanFreq()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[33]</td>
<td align="left">fBodyAccJerk-meanFreq()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[34]</td>
<td align="left">fBodyAccJerk-meanFreq()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[35]</td>
<td align="left">fBodyGyro-mean()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[36]</td>
<td align="left">fBodyGyro-mean()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[37]</td>
<td align="left">fBodyGyro-mean()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[38]</td>
<td align="left">fBodyGyro-meanFreq()-X</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[39]</td>
<td align="left">fBodyGyro-meanFreq()-Y</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[40]</td>
<td align="left">fBodyGyro-meanFreq()-Z</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[41]</td>
<td align="left">fBodyAccMag-mean()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[42]</td>
<td align="left">fBodyAccMag-meanFreq()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[43]</td>
<td align="left">fBodyBodyAccJerkMag-mean()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[44]</td>
<td align="left">fBodyBodyAccJerkMag-meanFreq()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[45]</td>
<td align="left">fBodyBodyGyroMag-mean()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[46]</td>
<td align="left">fBodyBodyGyroMag-meanFreq()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[47]</td>
<td align="left">fBodyBodyGyroJerkMag-mean()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[48]</td>
<td align="left">fBodyBodyGyroJerkMag-meanFreq()</td>
<td align="left">numeric</td>
<td align="left">mean magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[49]</td>
<td align="left">angle(tBodyAccMean,gravity)</td>
<td align="left">numeric</td>
<td align="left">angle between vectors</td>
</tr>
<tr class="even">
<td align="left">[50]</td>
<td align="left">angle(tBodyAccJerkMean),gravityMean)</td>
<td align="left">numeric</td>
<td align="left">angle between vectors</td>
</tr>
<tr class="odd">
<td align="left">[51]</td>
<td align="left">angle(tBodyGyroMean,gravityMean)</td>
<td align="left">numeric</td>
<td align="left">angle between vectors</td>
</tr>
<tr class="even">
<td align="left">[52]</td>
<td align="left">angle(tBodyGyroJerkMean,gravityMean)</td>
<td align="left">numeric</td>
<td align="left">angle between vectors</td>
</tr>
<tr class="odd">
<td align="left">[53]</td>
<td align="left">angle(X,gravityMean)</td>
<td align="left">numeric</td>
<td align="left">angle between vectors</td>
</tr>
<tr class="even">
<td align="left">[54]</td>
<td align="left">angle(Y,gravityMean)</td>
<td align="left">numeric</td>
<td align="left">angle between vectors</td>
</tr>
<tr class="odd">
<td align="left">[55]</td>
<td align="left">angle(Z,gravityMean)</td>
<td align="left">numeric</td>
<td align="left">angle between vectors</td>
</tr>
<tr class="even">
<td align="left">[56]</td>
<td align="left">tBodyAcc-std()-X</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[57]</td>
<td align="left">tBodyAcc-std()-Y</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[58]</td>
<td align="left">tBodyAcc-std()-Z</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[59]</td>
<td align="left">tGravityAcc-std()-X</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[60]</td>
<td align="left">tGravityAcc-std()-Y</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[61]</td>
<td align="left">tGravityAcc-std()-Z</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[62]</td>
<td align="left">tBodyAccJerk-std()-X</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[63]</td>
<td align="left">tBodyAccJerk-std()-Y</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[64]</td>
<td align="left">tBodyAccJerk-std()-Z</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[65]</td>
<td align="left">tBodyGyro-std()-X</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[66]</td>
<td align="left">tBodyGyro-std()-Y</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[67]</td>
<td align="left">tBodyGyro-std()-Z</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[68]</td>
<td align="left">tBodyGyroJerk-std()-X</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[69]</td>
<td align="left">tBodyGyroJerk-std()-Y</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[70]</td>
<td align="left">tBodyGyroJerk-std()-Z</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[71]</td>
<td align="left">tBodyAccMag-std()</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[72]</td>
<td align="left">tGravityAccMag-std()</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[73]</td>
<td align="left">tBodyAccJerkMag-std()</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[74]</td>
<td align="left">tBodyGyroMag-std()</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[75]</td>
<td align="left">tBodyGyroJerkMag-std()</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[76]</td>
<td align="left">fBodyAcc-std()-X</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[77]</td>
<td align="left">fBodyAcc-std()-Y</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[78]</td>
<td align="left">fBodyAcc-std()-Z</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[79]</td>
<td align="left">fBodyAccJerk-std()-X</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[80]</td>
<td align="left">fBodyAccJerk-std()-Y</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[81]</td>
<td align="left">fBodyAccJerk-std()-Z</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[82]</td>
<td align="left">fBodyGyro-std()-X</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[83]</td>
<td align="left">fBodyGyro-std()-Y</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[84]</td>
<td align="left">fBodyGyro-std()-Z</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[85]</td>
<td align="left">fBodyAccMag-std()</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[86]</td>
<td align="left">fBodyBodyAccJerkMag-std()</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of accelerometer signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[87]</td>
<td align="left">fBodyBodyGyroMag-std()</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="even">
<td align="left">[88]</td>
<td align="left">fBodyBodyGyroJerkMag-std()</td>
<td align="left">numeric</td>
<td align="left">standard deviation of the magnitude of gyroscope signal normalized between -1 and 1</td>
</tr>
<tr class="odd">
<td align="left">[89]</td>
<td align="left">activity</td>
<td align="left">integer</td>
<td align="left">integer that corresponds to different activity types</td>
</tr>
</tbody>
</table>
