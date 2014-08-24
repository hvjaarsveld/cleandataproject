# use setwd('path to the data directory') to ensure you are in the directory where the data was unpacked

# load all the relevant data files in R
subj_train <- read.table('train/subject_train.txt')
x_train <- read.table('train/X_train.txt')
y_train <- read.table('train/y_train.txt')
subj_test <- read.table('test/subject_test.txt')
x_test <- read.table('test/X_test.txt')
y_test <- read.table('test/y_test.txt')
features <- read.table('features.txt')

# Step 1: Merge train and test data
subj <- rbind(subj_train, subj_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)

