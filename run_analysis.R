# use setwd('path to the data directory') to ensure you are in the directory where the data was unpacked

# load all the relevant data files in R
subj_train <- read.table('train/subject_train.txt')
x_train <- read.table('train/X_train.txt')
y_train <- read.table('train/y_train.txt')
subj_test <- read.table('test/subject_test.txt')
x_test <- read.table('test/X_test.txt')
y_test <- read.table('test/y_test.txt')
features <- read.table('features.txt')
activities <- read.table('activity_labels.txt')

# Step 1: Merge train and test data
subj <- rbind(subj_train, subj_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)

# Step2: Extract mean() and std() data
std <- features[grep("std()", features$V2),]
mean <- features[grep("mean()", features$V2),]
std_names <- std[,2]
mean_names <- mean[,2]
std <- std[,1]
mean <- mean[,1]
x_std <- x[,std]
x_mean <- x[,mean]

# Step 3: Readable activity names
y_readable <- as.data.frame(rapply(y, function(x) {activities[y$V1,]$V2}))

# Step 4: Name the variables
names(x_std) <- std_names
names(x_mean) <- mean_names
names(subj) <- c("Subject")
names(y_readable) <- c("Activity")

# Step 5: Create tidy dataset
x_std_ave <- as.data.frame(rowMeans(x_std))
names(x_std_ave) <- c("Standard Deviation Average")
x_mean_ave <- as.data.frame(rowMeans(x_mean))
names(x_mean_ave) <- c("Mean Average")
clean_data <- cbind(subj, x_mean_ave, x_std_ave, y_readable)
write.table(clean_data, file="cleaned_data.txt", row.names=FALSE)
