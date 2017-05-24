## Readme.md

This directory contains my final submission for the JH Coursera (Course 4 - Getting and Cleaning Data) 

* 1 "run_analysis.R" - This is the file that executes all code in R.
* 2 "codebook.Rmd" - This is the R markdown code book to explain all code, variables, and transformations to derive the tidy data set.
* 3 "TidyDataSet_GrpRslt.txt" - This is the grouped/averaged results data set each volunteer, activity, and features.

Please keep in mind that for this exercise I chose a SHORT tidy data set, as opposed to a long/wide data set. The "measurement_type" is a single variable (which is a range of measurement types - similiar to the types of excercises 1-6), and the value makes each row a unique observation. Having a SQL back-ground, if I were to import this data into a database in wide format (single column for each feature - 60+ columns) to run analytics against, I would spend days coding to bring the data back together just to run simple aggregate/analytic queries with. Thus the reasoning for my direction.

To run:
Ensure that you have the "run_analysis.R" script in a single directory with a sub-directory structure of "data/UCI HAR Dataset/" that contain all the files included from the website link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  This is the course submission web site.  Official website can be found here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 