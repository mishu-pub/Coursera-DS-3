#read features file
flabels <- read.table("/Users/m.georgescu/weiterbildung/coursera/data\ science/getting-cleaning/week3/UCI\ HAR\ Dataset/features.txt", header=FALSE)
featureNames <- flabels$V2

#identify just interesting features, containing mean or std
interestingFeaturesIdx <- grep("mean|std", featureNames)
featureNames[interestingFeaturesIdx]


#read training set
train <- read.table("/Users/m.georgescu/weiterbildung/coursera/data\ science/getting-cleaning/week3/UCI\ HAR\ Dataset/train/X_train.txt", header=FALSE)
#read testing set
test <- read.table("/Users/m.georgescu/weiterbildung/coursera/data\ science/getting-cleaning/week3/UCI\ HAR\ Dataset/test/X_test.txt", header=FALSE)
#merge them
allFeatures <- rbind(train, test)

features <- allFeatures %>% select(interestingFeaturesIdx)
names(features) <- featureNames[interestingFeaturesIdx]

#read label values for train
ytrain <- read.table("/Users/m.georgescu/weiterbildung/coursera/data\ science/getting-cleaning/week3/UCI\ HAR\ Dataset/train/y_train.txt", header=FALSE)
#read label values for test
ytest <- read.table("/Users/m.georgescu/weiterbildung/coursera/data\ science/getting-cleaning/week3/UCI\ HAR\ Dataset/test/y_test.txt", header=FALSE)
#merge them
yall <- rbind(ytrain, ytest)

#read values to activites legend
activityLabels <- read.table("/Users/m.georgescu/weiterbildung/coursera/data\ science/getting-cleaning/week3/UCI\ HAR\ Dataset/activity_labels.txt", header=FALSE)
#resolve the labels and have them nice now
mergedLabels <- merge(yall, activityLabels)
names(mergedLabels) <- c("id", "Activity")
labels <- mergedLabels %>% select(Activity)


#read subject data 
subjectTrain <- read.table("/Users/m.georgescu/weiterbildung/coursera/data\ science/getting-cleaning/week3/UCI\ HAR\ Dataset/train/subject_train.txt", header=FALSE)
subjectTest <- read.table("/Users/m.georgescu/weiterbildung/coursera/data\ science/getting-cleaning/week3/UCI\ HAR\ Dataset/test/subject_test.txt", header=FALSE)
subject <- rbind(subjectTrain, subjectTest)
names(subject) <- c("Subject")

#now merge everything so that it looks nice for the step 4 

coolData <- cbind(subject, features, labels)


#now to make that tidy data set

tidyNiceData <- coolData %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))
write.table(tidyNiceData, "tidy.csv")
