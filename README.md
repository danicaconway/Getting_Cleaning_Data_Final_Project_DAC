# Getting_Cleaning_Data_Final_Project_DAC
The final Project for Coursera Getting and Cleaning Data Course

Danica Conway, 8/28/2016

Abstract:
Experimental data from the UCI Machine Learning Repository was downloaded and manipulated for the purpose of showing that the user (me) could gather data from a website, join it together in a meaningful way, label it meaningfully, and then provide a tidy subset of data that contained the grouped mean results based on the Activity Type and Test Subject.  This data could potentially then be used by someone else to further subset and analyze the data.

Data provided in this repo includes:
1. DanicaConwayDataSet1.csv = This is the cleaned up meta-data set that is NOT reduced down to means (of means), but conforms to the requirements of steps 1 through 4, which are to merge the training and test sets.  The raw data found within the 'Inertial Signals' folders for training and test data were not used for this data set.  This data was not required as part of the data set as it was the raw data from which the training_x and test_x results were created, which I believe was explained in David Hood's wordpress discussion of the project.  This data has activity labels and the subject number for each person that was involved in the study.  I used the features names provided by the study for column headers as I thought they described what they were fairly well without needing to be changed (at least when the readme and features_info files from the study are read and taken into consideration).  Also, only the columns from the test results data where the column name included the word mean or the initials std (for standard deviation) were included in the cleaned data set.  This data set is a wide data set, not a narrow one (though I am given to understand that both are acceptable.)
2. DanicaConwayMeanResults.csv = this is the aggregated data file, where first the test subject number was aggregated, then the activity type was aggregated, and for each subject and activity type, every column was meaned (averaged).  Column headers were re-named with a prefix of MEAN_OF to indicate that the values represent means of means and standard deviations of the parent data set.  As per Cook's discussion of this topic, this is considered an acceptable method, to take a mean of a bunch of means, and a mean of a standard deviation.
3. Codebook.txt = this describes what each column in the data represents, for both data sets.


Data was pulled from the Human Activity Recognition on Smartphones project, website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data used included training as well as testing results and included the following files:
1.  activity_labels.txt = types of activity and the corresponding code (value) that represents each
2.  features.txt = measurement types that were taken across each activity type and each subject (person) used in the study
3.  features_info.txt = explains what the feature descriptions mean, such as acceleration in the X direction, or y direction, or z direction
4.  x_train.txt and x_test.txt = this is the actual measurement data for each of the test subjects and for each activity and repetition
5.  y_train.txt and y_test.txt = the activity type (numeric values 1-6) for each row of data obtained
6.  subject_train.txt and subject_test.txt = these are the actual subjects (numeric value represents a person) that were tied to each row of measurement data
7.  The rest of the data files were raw data that were used to come up with the x_train results files, and they were NOT used in this project.








ACKNOWLEDGEMENT: Data used for this project comes from the following study: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The Notes provided by David Hood here: 
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment
were instrumental in my decisions around how the data would look, what is and is not included, how it is presented, and how I extracted the data from the website.
Per Hood's directions, you can download the files by invoking the read.table() function, using the web address from the github repo.
Also, I chose to follow the WIDE data format, not the NARROW, though he specifically indicated both are acceptable.
