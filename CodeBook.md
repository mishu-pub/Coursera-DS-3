The script run_analysis.R downloads the input dataset and produces a tidy dataset "tidy.txt"

The tidy dataset consists of 
 the average of each variable for each activity and each subject.
 extracted from the merged train and test set, together with subjects and activities(textual description)

This is done via the following steps, by the script as it:
1. reads the feature labels files
2. identifies those features that are of interest, average and standard deviation
3. reads the training set and the test set
4. merges them
5. selects just the features of interest
6. reads the y values for train and test
7. merges the y values
8. translates the y values to text with the help of the activity labels file
9. reads the subject data for train and test
10. merges the subject data
11. merges the subject data, features data and y-labels data, in the coolData
12. transforms the cool data into the tidy data needed, by grouping and summarising the mean
13. writes the tidy data set to the "tidy.txt" file
