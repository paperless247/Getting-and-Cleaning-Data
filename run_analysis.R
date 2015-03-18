## run_analysis.R
## written by paperless247

## Check if have the file ... download if needed!
### Download and unzip the file "getdata_projectfiles_UCI HAR Dataset.zip"
### All the folders and files are in subfolder: "UCI HAR Dataset"

## 0. Read the data sets
X_train	<- read.table('./UCI HAR Dataset/train/X_train.txt')	## Training set
y_train	<- read.table('./UCI HAR Dataset/train/y_train.txt')	## Training labels
	names(y_train) <- "acode"
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
	names(subject_train) <- "subject"
train <- cbind(subject_train, y_train, X_train)
rm(subject_train, y_train, X_train)

X_test	<- read.table('./UCI HAR Dataset/test/X_test.txt')	## Test set
y_test	<- read.table('./UCI HAR Dataset/test/y_test.txt')	## Test labels
	names(y_test) <- "acode"
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
	names(subject_test) <- "subject"
test <- cbind(subject_test, y_test, X_test)
rm(subject_test, y_test, X_test)

activity	<- read.table('./UCI HAR Dataset/activity_labels.txt')## Activity label
	names(activity) <- c("acode", "activity")
features	<- read.table('./UCI HAR Dataset/features.txt')		## 561 features


## 1.Merges the training and the test sets to create one data set.
dat	<- rbind(train, test)			## Combine training and the test sets
rm(train, test)					## Remove the objects


## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
m	<- apply(dat, 2, mean)
sd	<- apply(dat, 2, sd)
m_sd	<- data.frame( mean = m, sd = sd)
m_sd	<- m_sd[-c(1,2),]				## remove the first and second rows
rm(m, sd)
m_sd


## 3.Uses descriptive activity names to name the activities in the data set
dat$acode <- activity$activity[match(dat$acode, activity$acode)]


## 4.Appropriately labels the data set with descriptive variable names. 
names(dat)[3:length(dat)] <- as.character(features[,2])


## 5. Tidy data set with the average of each variable for each activity and each subject.
dat2 <- lapply(split(dat, list(dat$acode, dat$subject)),
		   function(x) colMeans(dat[, c(3:length(dat))]))

df <- as.data.frame(t(as.data.frame(dat2)))				## list to data.frame
sa <- row.names(df)
ss <- strsplit(sa, "\\.")
dfn <- as.data.frame(t(as.data.frame(ss)))
df <- cbind(dfn[2],dfn[1], df)
row.names(df) <- NULL
colnames(df)[c(1,2)] <- c("subject", "activity")
write.table(df, file = "tidydata.txt", row.names=FALSE)