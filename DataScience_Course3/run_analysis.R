setwd('/Project/OneDrive/Coursera/DataScience_Course3/')
library(dplyr)
#library(lubridate)
#library(ggplot2)
require(data.table)
library(reshape2)

# ====================
# START FILE READING

  # load in the description files
  activity_labels <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep=" ")
  features <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/features.txt", header = FALSE, sep=" ")
  head(activity_labels)
  head(features)
  
  # Start reading in the files
  # Test
  test_subject_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep=" ")
  nrow(test_subject_test) # 2947 - num read in check
  test_X_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
  nrow(test_X_test) # 2947 - num read in check
  test_Y_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Y_test.txt", header = FALSE, sep=" ")
  nrow(test_Y_test) # 2947 - num read in check
  test_body_acc_x_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header = FALSE)
  nrow(test_body_acc_x_test) # 2947 - num read in check
  test_body_acc_y_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header = FALSE)
  nrow(test_body_acc_y_test) # 2947 - num read in check
  test_body_acc_z_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header = FALSE)
  nrow(test_body_acc_z_test) # 2947 - num read in check
  test_body_gyro_x_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header = FALSE)
  nrow(test_body_gyro_x_test) # 2947 - num read in check
  test_body_gyro_y_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header = FALSE)
  nrow(test_body_gyro_y_test) # 2947 - num read in check
  test_body_gyro_z_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header = FALSE)
  nrow(test_body_gyro_z_test) # 2947 - num read in check
  test_total_acc_x_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header = FALSE)
  nrow(test_total_acc_x_test) # 2947 - num read in check
  test_total_acc_y_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header = FALSE)
  nrow(test_total_acc_y_test) # 2947 - num read in check
  test_total_acc_z_test <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", header = FALSE)
  nrow(test_total_acc_z_test) # 2947 - num read in check
  
  # 7352 for all
  train_subject_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep=" ")
  nrow(train_subject_train) # 7352 - num read in check
  train_X_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
  nrow(train_X_train) # 7352 - num read in check
  train_Y_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Y_train.txt", header = FALSE, sep=" ")
  nrow(train_Y_train) # 7352 - num read in check
  train_body_acc_x_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header = FALSE)
  nrow(train_body_acc_x_train) # 7352 - num read in check
  train_body_acc_y_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header = FALSE)
  nrow(train_body_acc_y_train) # 7352 - num read in check
  train_body_acc_z_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header = FALSE)
  nrow(train_body_acc_z_train) # 7352 - num read in check
  train_body_gyro_x_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header = FALSE)
  nrow(train_body_gyro_x_train) # 7352 - num read in check
  train_body_gyro_y_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header = FALSE)
  nrow(train_body_gyro_y_train) # 7352 - num read in check
  train_body_gyro_z_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header = FALSE)
  nrow(train_body_gyro_z_train) # 7352 - num read in check
  train_total_acc_x_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header = FALSE)
  nrow(train_total_acc_x_train) # 7352 - num read in check
  train_total_acc_y_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header = FALSE)
  nrow(train_total_acc_y_train) # 7352 - num read in check
  train_total_acc_z_train <- read.table("/Project/OneDrive/Coursera/DataScience_Course3/data/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header = FALSE)
  nrow(train_total_acc_z_train) # 7352 - num read in check
  
# END FILE READING
# ====================


# ============================================================
# START DATA EXPLORING - Exploring the data to see what files contain what numbers. 
  
  # merge all the data tables for test
  head(test_subject_test, 1)
  table(test_subject_test) # 2, 4, 9, 10, 12, 13, 18, 20, 24 - # These are the volunteers
  
  #table(train_subject_train) #1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 29, 30
  head(test_X_test, 1) # this is 561 - the features.
  head(test_Y_test, 1) # this is the action being taken
  table(test_Y_test) # 1, 2, 3, 4, 5, 6 - these are the activity labels
  head(test_body_acc_x_test, 1) # 128 columns - do I need these?  I don't explicitly see it in the requirements, so I could be mis-interpreting here

# END EXPLORING
# ============================================================

  
# ============================================================
# START RENAMING COLUMNS
# rename the columns

  setnames(activity_labels, "V1","activity.num")
  setnames(activity_labels, "V2","activity.desc")
  
  setnames(features, "V1","feature.num")
  setnames(features, "V2","feature.desc")
  
  setnames(test_subject_test, "V1","volunteer")
  setnames(train_subject_train, "V1","volunteer")
  
    # testing -  now need to rename the columns
    head(test_X_test, 1) # the 561 features
    t(features$feature.desc) # the 561 feature description
    class(t(features$feature.desc)) # class type is - factor
    colnames(test_X_test) # get the existing column names
    # end testing
  
  # rename all the column headers - features
  setnames(test_X_test, old=colnames(test_X_test), new = as.vector(t(features$feature.desc)))
  setnames(train_X_train, old=colnames(train_X_train), new = as.vector(t(features$feature.desc)))
  head(test_X_test, 1)
  
  # rename the  activities - this is the large list
  setnames(test_Y_test, "V1","activity.num")
  setnames(train_Y_train, "V1","activity.num")
  
  # Need to test and omit, ended up pulling it down below
  # Had to add this here - pull only std and mean column features - as there are duplicate
  # feature_list <- features
  # grep("std", features$feature.desc)
  # grep("mean", features$feature.desc)
  # grep("std|mean", features$feature.desc)

# END RENAMING COLUMNS
# ============================================================


# ============================================================
# MERGING THE DATA 
  head(test_subject_test)
  nrow(test_subject_test) # 2947 - which volunteer
  #nrow(features) # 561 - descriptions of features - DONT NEED THIS SINCE WE RE-LABELED COLUMNS ABOVE
  nrow(test_X_test) # 2947 - all the detailed measurements / features
  nrow(test_Y_test) # 2947 - all the activities (1/6)
  
  # NEED TO JOIN THE ACTIVITIES - so we can have the activity name in the data set
  head(test_Y_test)
  test_activity_set = merge(x = test_Y_test, y=activity_labels, by = "activity.num")
  train_activity_set = merge(x = train_Y_train, y=activity_labels, by = "activity.num")
  
  # Need to MERGE all three together first - volunteers w/features.
  full_test_set <- cbind(test_subject_test, test_activity_set, test_X_test)
  # head(full_test_set, 2)
  
  full_train_set <- cbind(train_subject_train, train_activity_set, train_X_train)
  # head(full_train_set, 2)
  
  # row bind back into a single set
  full_set <- rbind(full_test_set, full_train_set)
  # head(full_set, 1)

# END MERGING THE DATA 
# ============================================================


# ========================
# EXTRACT ONLY NEEDED DATA - only pull std and mean

  #head(full_set, 1)
  grep("std|mean", features$feature.desc)
  
  # volunteer|activity.num|activity.desc
  # this is kind of quirky here, but we are taking the first three important columns (volunteer|activity.num|activity.desc), + everything esel with std and mean in the name
  #  I had to do this becuase I didn't realize there were duplicate names in the features that was throwing an error with grep.
  #  so intead pulling the columns values by #, and then sub-set from there
  # colsToKeep <- grep("-mean\(\)$", features$feature.desc) # grab the named column
  colsToKeep <- grep("mean|std", features$feature.desc) # grab the named column
  colsToKeep <- c(1, 2,3, colsToKeep +3)  # grab important 1,2,3 + std/mean (with proper offsets)
  fullset_stdAndmean <- full_set[, colsToKeep]
  head(fullset_stdAndmean,1)
  ncol(fullset_stdAndmean)
  
  # Melting Data
  library(tidyr)
  fullset_melted <- melt(fullset_stdAndmean, id=c("volunteer","activity.num","activity.desc"))
  # write.csv(as.data.table(benMelt), file = "ben_melt.csv", row.names = FALSE)
  head(fullset_melted)
  tail(fullset_melted)

# END EXTRACTED DATA
# ========================

# ======================
# WRITING THE DATA 
  
  #write.table(as.data.table(fullset_stdAndmean), file = "fullset_stdAndmean.txt", row.names = FALSE)
  #write.csv(as.data.table(fullset_stdAndmean), file = "fullset_stdAndmean.csv", row.names = FALSE)
  write.table(as.data.table(fullset_melted), file = "TidyDataSet_Flat.txt", row.names = FALSE)
  # write.csv(as.data.table(fullset_melted), file = "fullset_melted.csv", row.names = FALSE)
  
# END WRITING THE DATA 
# ======================


# ======================
# GROUPING DATA FOR AVERAGE

  # need to show the average by each variable and each subject (volunteer) 
  grouped_result <-
    fullset_melted %>%
    group_by(volunteer, activity.num, activity.desc, variable) %>%
    summarize(avg_variable_value = mean(value)
    ) %>%
    arrange(volunteer, activity.num)
  
  head(grouped_result, 20)
  
  write.table(as.data.table(grouped_result), file = "TidyDataSet_GrpRslt.txt", row.names = FALSE)

# END GROUPING
# ======================


