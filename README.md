Introduction
============

The data processed in this project came from accelerometer and gyroscope
signal measured from a group of 30 subjects who were performing six
activities (walking, walking upstairs, walking downstairs, sitting,
standing, laying). All activities were video recorded and lableled
manually. The data set was subsequently partitioned into two sets,
consisting of 70% in a traninging data set and 30% in a test data set.
Of note, each row of the original data sets contains a vector of 561
features consisting of various metrics of the accelerometer and
gyrosocpe signal. The subject index and activity index for each row were
stored as separate data files.

Components of the code
======================

All data process R code are saved in "run\_analysis.R”. User will need
to input a desired directory path to which the data will be downloaded
to on line 1, and subsequently serve as the work directory to which the
final output tidy data will be saved to as a .csv file. After the
directory path is specified, the user can run the entire script to
completion to obtain the final today data saved as a .txt file.

Data download and read
----------------------

The raw data is downloaded directly from
("<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>").
It was unzipped into all of the component files. The activity names and
variable(feature) names were stored as files "activity\_labels" and
"features.txt", and they were loaded into R using the read.table
function.

Data processing
---------------

The feature data were read via fread function, resulting in a
data.table. This was repeated separately for the training and test data
sets. The columns were renamed to reflect the actual feature name via
the setnames function. Subject index and activity index were also read
into R using the fread function, and added as columns to the feature
data.table. The processed training and test data.tables were merged via
the bind\_rows function.

Data extraction
---------------

The merged data.table was further processed via the select function to
retain only columns with names including keywords of "mean" or "std",
resulting in 86 features.

Data modification
-----------------

The activity index of the extracted data was replaced with actual names
of the activity via internal function of the data.table, which created a
new column of the activity name corresponding to the previous activity
index.

Data summarization
------------------

The mean of each selected feature was calculated via lapply function and
grouped by subject index and activity name. In the output data.table,
each row represents a unique combination of subject index and activity
type, and the value for each feature represent the mean over all rows
matching the subject index and activity type in the original data. The
resulting summary data.table was sorted in ascending order by subject
index and activity name and presented as the final tidy data, and saved
as "tidy\_data.txt".
