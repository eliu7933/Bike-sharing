# Bike-sharing

The overall purpose of this project is to investigate which variables of the Bike-sharing dataset are the best predictors for bike-rental demands.

This README.md file contains information about the Bike-sharing project. The test.csv and train.csv files are the initial bike-sharing datasets with data including the number of bike rentals that occurred over a period of time. Bike-sharing Analysis.R file is the file that contains prediction analyses on the dataset.
The .gitignore file is a file that tells Git to ignore certain files.

The methods that are used to clean the data and perform feature engineering include changing explanatory variables into factors and removing variables that are irrevelant to the analysis such as casual and registered. An additional variable "hour" is also created. Target encoding methods are also applied to create dummy variables for categorical variables.

Methods used to generate predictions include using the train function and its corresponding ranger and random forest designs. Additional arguments corresponding with these methods such as repeatedcv and oob are applied respectively. Variables hour, weather, workingday, and temp are set as explanatory variables in order to generate predictions.
