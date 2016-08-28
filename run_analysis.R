##  Final Project for Getting and Cleaning Data Course
##
##  Author:  Danica Conway
##
##  This Program is intended to:
##  1.  gather the accelerometer data from the UCI 
##      Machine Learning repository and to tidy it up according to the tidy
##      data principles:
##      a.  Each variable forms a column.
##      b.  Each observation forms a row.
##      c.  Each type of observational unit forms a table
##      The zip file is downloaded, unzipped, and the contents displayed
##
##  2. Merge the training and the test data together into one file
##  3. Use the features.txt file to name the columns of the data set (data table)
##  4. Take a subset of the data, only keeping columns that contain the terms
##     mean or std (this is the extract data portion of the assignment)
##  5. Merge the Activity training and test data together into one file
##  6. Rename activities to descriptive activity names by using the 
##     ActivityLabels file as a reference
##  7. Appropriately label the data set by binding the activity labels to the 
##     numeric data frame created in steps 2-5
##  8. Merge the training and test subject data into one data fram and bind it
##     to the data frame created in steps 2-7
##  8. Get the means (averages) of each column (subject) based on Activity Type 
##     and subject number, and put it into a new data frame
##  9. Rename the columns to reflect that they are now mean values (means of
##     means or standard deviations, depending on the column)
##  10. Save the files in csv format so they can be uploaded to 
##
##
##  ACKNOWLEDGEMENT: Data used for this project comes from the following study:
##     Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
##     Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
##     Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
##     Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
##
##
##  The Notes provided by David Hood here: 
##      https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
##      were instrumental in my decisions around how the data would look, what
##      is and is not included, how it is presented, and how I extracted the
##      data from the website.
##      Per Hood's directions, you can download the files by invoking the
##      read.table() function, using the web address from the github repo.
##      Also, I chose to follow the WIDE data format, not the NARROW, though he
##      specifically indicated both are acceptable.
##
##
##  Last Updated On:  8/28/2016



##  First, load the libraries to be used in program
    library(dplyr)
    ##library(lubridate) 
    library(tidyr) 
    library(plyr)    



## 1.  Gather the accelerometer data from the UCI:
## Download the data set:
    path="/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/Dataset.zip"
    url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Create a variable for each file, read it in, and look at the content and 
## dimensions to evaluate what needs to be done next
 
##  create paths to be used for reading in the data files
    trainingXPath="/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/train/X_train.txt"
    testXPath="/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/test/X_test.txt"
    trainingActivityPath="/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/train/Y_train.txt"
    testActivityPath="/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/test/Y_test.txt"
    activityLabelsPath="/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/activity_labels.txt"



## 2. Merge the training and the test data together into one file
##  read the data result tables into memory and bind them into one data set
    trainingXData<-read.table(trainingXPath, header = FALSE)
    testXData  <-read.table(testXPath, header = FALSE)
    mergedResultData<-rbind(trainingXData,testXData)
    
    
    
## 3. Use the features.txt file to name the columns of the data set (data table)

## Read in the column names provided in the features.txt file
    columNamesPath="/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/features.txt"
    columnNames<-read.table(columNamesPath, header=FALSE)
    columnNames<-as.data.frame(columnNames)
    columnNames<-columnNames$V2        

## Replace the merged data column names with names read in from features.txt 
    colnames(mergedResultData)<-columnNames 



## 4. Take a subset of the data, only keeping columns that contain the terms
##     mean or std (this is the extract data portion of the assignment)
## find all the columns that contain either mean or std, and keep only those columns   
    colNumsToKeep<-grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", colnames(mergedResultData))
    dataSubset<-mergedResultData[,colNumsToKeep]



## 5. Merge the Activity training and test data together into one file

## read the activity type tables in, and bind them into one data set
    trainingActivityType<-read.table(trainingActivityPath,header=FALSE)
    testActivityType<-read.table(testActivityPath, header = FALSE)
    trainingAndTestActivity<-rbind(trainingActivityType,testActivityType)

##  Read in the activity labels provided by the data set
    activityLabels<-read.table(activityLabelsPath, header=FALSE)

## Remove the extra column that came in
    activityLabels<-activityLabels[,2]

## Convert to data frame to make it possible to take one element at a time
    activityLabels<-as.data.frame(activityLabels)

## Set values based on location in data frame in activityLabels
    one=as.character(activityLabels[1,])
    two=as.character(activityLabels[2,])
    three=as.character(activityLabels[3,])
    four=as.character(activityLabels[4,])
    five=as.character(activityLabels[5,])
    six=as.character(activityLabels[6,])

## Replace numeric values in the activity dataset with the more descriptive 
## character value from the activityLabels
## Done this way because didn't know how to do it in 1 step without an error

## replace the first value
    trainingAndTestActivity<-lapply(trainingAndTestActivity, function(x)
    {gsub("1",one,x)})

## replace the second value
    trainingAndTestActivity<-lapply(trainingAndTestActivity, function(x)
    {gsub("2",two,x)})

## replace the third value
    trainingAndTestActivity<-lapply(trainingAndTestActivity, function(x)
    {gsub("3",three,x)})

## replace the fourth value
    trainingAndTestActivity<-lapply(trainingAndTestActivity, function(x)
    {gsub("4",four,x)})

## replace the fifth value
    trainingAndTestActivity<-lapply(trainingAndTestActivity, function(x)
    {gsub("5",five,x)})

## replace the sixth and final value
    trainingAndTestActivity<-lapply(trainingAndTestActivity, function(x)
    {gsub("6",six,x)})


     
## 7. Appropriately label the data set by binding the activity labels to the 
##     numeric data frame created in steps 2-5    
## Merge the mergedResultData dataset with the trainingAndTestActivity dataset
    mergedResultsWithActivity<-cbind(trainingAndTestActivity,dataSubset)  
    colnames(mergedResultsWithActivity)[1]<-"ActivityType" 


##  8. Merge the training and test subject data into one data fram and bind it
##     to the data frame created in steps 2-7
    
## Read in the training and test Subject Number data
    trainingSubjectPath="/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/train/subject_train.txt"
    testSubjectPath="/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/test/subject_test.txt"
    trainingSubject<-read.table(trainingSubjectPath, header = FALSE)
    testSubject<-read.table(testSubjectPath, header = FALSE)  

## Merge the training and test subject number data and rename the column
    mergedSubjectNumbers<-rbind(trainingSubject, testSubject) 
    colnames(mergedSubjectNumbers) <-"TestSubjectNumber"
    
## Bind the test subject number to the rest of the data
   mergedResultsWithActivity_SubjectNumber<-cbind(mergedSubjectNumbers,mergedResultsWithActivity)

## Re-order first and second columns to reflect how grouping will be done later
   mergedResultsWithActivity_SubjectNumber<-mergedResultsWithActivity_SubjectNumber[c(2,1,3:88)]        



   
## Take the mean of each activity type, for all columns, and output to another file
## Start by using the plyr library to take the mean of the columns first by 
## activity type and second by subject number  
   meanResults<-ddply(mergedResultsWithActivity_SubjectNumber, .(ActivityType, TestSubjectNumber), numcolwise(mean))



## 9. Rename the columns to reflect that they are now mean values (means of
##     means or standard deviations, depending on the column)
## Add "MEAN_OF" to front of every column name to show that the values are means
## of means and of stds
   colnames(meanResults) <- paste("MEAN_OF", colnames(meanResults), sep = "_")
   colnames(meanResults)[1]<-"Activity_Type"
   colnames(meanResults)[2]<-"Test_Subject_Number"



## 10. Save the files in csv format so they can be uploaded to 
    
## Save the first, non-aggregated file
   write.csv(mergedResultsWithActivity_SubjectNumber, file = "/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/DanicaConwayDataSet1.csv", row.names = TRUE)  
   
## Save the file of means
   write.csv(meanResults, file = "/Users/dconway/Documents/Training/Coursera/Getting and Cleaning Data/Wk4/project/DanicaConwayMeanResults.csv", row.names = TRUE)               