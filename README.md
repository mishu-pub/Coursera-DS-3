# Coursera-DS-3

This is the submission for the Course Project 

The script that does the magic is run_analysis.R
The script does the following, as can also be identified in the comments.

1. downloads the file
2. unzips the files
3. reads the feature labels files
4. identifies those features that are of interest, average and standard deviation
5. reads the training set and the test set
6. merges them
7. selects just the features of interest
8. reads the y values for train and test
9. merges the y values
10. translates the y values to text with the help of the activity labels file
11. reads the subject data for train and test
12. merges the subject data
13. merges the subject data, features data and y-labels data, in the coolData 
14. transforms the cool data into the tidy data needed, by grouping and summarising the mean
15. writes the tidy data set to the "tidy.txt" file
