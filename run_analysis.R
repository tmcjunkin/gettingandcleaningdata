library(plyr)

##Read in the data table, x_test

xtest <- read.table("x_test.txt")

##Extract only the columns that have mean or standard deviation scores

xtest <- xtest[,c("V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46","V81","V82","V83",
                        "V84","V85","V86","V121","V122","V123","V124","V125","V126","V161","V162","V163",
                        "V164","V165","V166","V201","V202","V214","V215","V227","V228","V240","V241","V253",
                        "V254","V266","V267","V268","V269","V270","V271","V345","V346","V347",
                        "V348","V349","V350","V424","V425","V426","V427","V428","V429","V503","V504","V516",
                        "V517","V529","V530","V542","V543")]

##Rename all the extracted columns to names that are meaningful

xtest <- rename(xtest,c("V1"="BodyAccMeanX","V2"="BodyAccMeanY","V3"="BodyAccMeanZ","V4"= "BodyAccSDX",
                        "V5"="BodyAccSDY","V6"= "BodyAccSDZ","V41"="GravAccMeanX","V42"="GravAccMeanY",
                        "V43"="GravAccMeanZ","V44"="GravAccSDX","V45"="GravAccSDY","V46"="GravAccSDZ",
                        "V81"="BodyAccJerkMeanX","V82"="BodyAccJerkMeanY","V83"="BodyAccJerkMeanZ",
                        "V84"="BodyAccJerkSDX","V85"="BodyAccJerkSDY","V86"="BodyAccJerkSDZ",
                        "V121"="BodyGyroMeanX","V122"="BodyGyroMeanY","V123"="BodyGyroMeanZ",
                        "V124"="BodyGyroSDX","V125"="BodyGyroSDY","V126"="BodyGyroSDZ",
                        "V161"="BodyGyroJerkMeanX","V162"="BodyGyroJerkMeanY","V163"="BodyGyroJerkMeanZ",
                        "V164"="BodyGyroJerkSDX","V165"="BodyGyroJerkSDY","V166"="BodyGyroJerkSDZ",
                        "V201"="BodyAccMagMean","V202"="BodyAccMagSD","V214"="GravAccMagMean","V215"="GravAccMagSD",
                        "V227"="BodyAccJerkMagMean","V228"="BodyAccJerkMagSD",
                        "V240"="BodyGyroMagMean","V241"="BodyGyroMagSD","V253"="BodyGyroJerkMean",
                        "V254"="BodyGyroJerkSD","V266"="BodyAccMeanX","V267"="BodyAccMeanY","V268"="BodyAccMeanZ",
                        "V269"="BodyAccSDX","V270"="BodyAccSDY","V271"="BodyAccSDZ",
                        "V345"="BodyAccJerkMeanX","V346"="BodyAccJerkMeanY","V347"="BodyAccJerkMeanZ",
                        "V348"="BodyAccJerkSDX","V349"="BodyAccJerkSDY","V350"="BodyAccJerkSDZ",
                        "V424"="BodyGyroMeanX","V425"="BodyGyroMeanY","V426"="BodyGyroMeanZ",
                        "V427"="BodyGyroSDX","V428"="BodyGyroSDY","V429"="BodyGyroSDZ",
                        "V503"="BodyAccMagMean","V504"="BodyAccMagSD","V516"="BodyAccJerkMagMean",
                        "V517"="BodyAccJerkMagSD","V529"="BodyGyroMagMean","V530"="BodyGyroMagSD",
                        "V542"="BodyGyroJerkMagMean","V543"="BodyGyroJerkMagSD"))

##Read in the activity table, y_test

ytest <- read.table("y_test.txt")

##Change the numeric type to a factor type

ytest <- as.factor(ytest$V1)

##Replace the factor levels with meaningful names

levels(ytest)[which(levels(ytest)=="1")] <- "walking"
levels(ytest)[which(levels(ytest)=="2")] <- "walking up"
levels(ytest)[which(levels(ytest)=="3")] <- "walking down"
levels(ytest)[which(levels(ytest)=="4")] <- "sitting"
levels(ytest)[which(levels(ytest)=="5")] <- "standing"
levels(ytest)[which(levels(ytest)=="6")] <- "laying"


##Read in the subject table, subject_test, and rename the column to something meaningful

subjecttest <- read.table("subject_test.txt")
subjecttest <- rename(subjecttest, c("V1"="subjectnum"))

##Combine the test data from the data, activity, and subject tables, and rename the activity column 

alltestdata <- cbind(xtest,ytest,subjecttest)
alltestdata <- rename(alltestdata,c("ytest"="activity"))

##Do the exact same steps as above with all tables related to the train data

xtrain <- read.table("x_train.txt")
xtrain <- xtrain[,c("V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46","V81","V82","V83",
                  "V84","V85","V86","V121","V122","V123","V124","V125","V126","V161","V162","V163",
                  "V164","V165","V166","V201","V202","V214","V215","V227","V228","V240","V241","V253",
                  "V254","V266","V267","V268","V269","V270","V271","V345","V346","V347",
                  "V348","V349","V350","V424","V425","V426","V427","V428","V429","V503","V504","V516",
                  "V517","V529","V530","V542","V543")]
xtrain <- rename(xtrain,c("V1"="BodyAccMeanX","V2"="BodyAccMeanY","V3"="BodyAccMeanZ","V4"= "BodyAccSDX",
                        "V5"="BodyAccSDY","V6"= "BodyAccSDZ","V41"="GravAccMeanX","V42"="GravAccMeanY",
                        "V43"="GravAccMeanZ","V44"="GravAccSDX","V45"="GravAccSDY","V46"="GravAccSDZ",
                        "V81"="BodyAccJerkMeanX","V82"="BodyAccJerkMeanY","V83"="BodyAccJerkMeanZ",
                        "V84"="BodyAccJerkSDX","V85"="BodyAccJerkSDY","V86"="BodyAccJerkSDZ",
                        "V121"="BodyGyroMeanX","V122"="BodyGyroMeanY","V123"="BodyGyroMeanZ",
                        "V124"="BodyGyroSDX","V125"="BodyGyroSDY","V126"="BodyGyroSDZ",
                        "V161"="BodyGyroJerkMeanX","V162"="BodyGyroJerkMeanY","V163"="BodyGyroJerkMeanZ",
                        "V164"="BodyGyroJerkSDX","V165"="BodyGyroJerkSDY","V166"="BodyGyroJerkSDZ",
                        "V201"="BodyAccMagMean","V202"="BodyAccMagSD","V214"="GravAccMagMean","V215"="GravAccMagSD",
                        "V227"="BodyAccJerkMagMean","V228"="BodyAccJerkMagSD",
                        "V240"="BodyGyroMagMean","V241"="BodyGyroMagSD","V253"="BodyGyroJerkMean",
                        "V254"="BodyGyroJerkSD","V266"="BodyAccMeanX","V267"="BodyAccMeanY","V268"="BodyAccMeanZ",
                        "V269"="BodyAccSDX","V270"="BodyAccSDY","V271"="BodyAccSDZ",
                        "V345"="BodyAccJerkMeanX","V346"="BodyAccJerkMeanY","V347"="BodyAccJerkMeanZ",
                        "V348"="BodyAccJerkSDX","V349"="BodyAccJerkSDY","V350"="BodyAccJerkSDZ",
                        "V424"="BodyGyroMeanX","V425"="BodyGyroMeanY","V426"="BodyGyroMeanZ",
                        "V427"="BodyGyroSDX","V428"="BodyGyroSDY","V429"="BodyGyroSDZ",
                        "V503"="BodyAccMagMean","V504"="BodyAccMagSD","V516"="BodyAccJerkMagMean",
                        "V517"="BodyAccJerkMagSD","V529"="BodyGyroMagMean","V530"="BodyGyroMagSD",
                        "V542"="BodyGyroJerkMagMean","V543"="BodyGyroJerkMagSD"))

ytrain <- read.table("y_train.txt")
ytrain <- as.factor(ytrain$V1)
levels(ytrain)[which(levels(ytrain)=="1")] <- "walking"
levels(ytrain)[which(levels(ytrain)=="2")] <- "walking up"
levels(ytrain)[which(levels(ytrain)=="3")] <- "walking down"
levels(ytrain)[which(levels(ytrain)=="4")] <- "sitting"
levels(ytrain)[which(levels(ytrain)=="5")] <- "standing"
levels(ytrain)[which(levels(ytrain)=="6")] <- "laying"

subjecttrain <- read.table("subject_train.txt")
subjecttrain <- rename(subjecttrain, c("V1"="subjectnum"))

alltraindata <- cbind(xtrain,ytrain,subjecttrain)
alltraindata <- rename(alltraindata,c("ytrain"="activity"))

##Combine all the train and test data into one table using rbind

alldatacombined <- rbind(alltestdata,alltraindata)

##Melt and cast the data so I can get the mean scores for each subject/activity combination

library(reshape2)

melted <- melt(alldatacombined,id=c("subjectnum","activity"))
casted <- dcast(melted, subjectnum + activity ~ variable, fun.aggregate=mean)

##Write the result to a new table

write.table(casted, file="tidydata.txt")
