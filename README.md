# Bike-sharing

The overall purpose of this project is to investigate which variables of the Bike-sharing dataset are the best predictors for bike-rental demands.

Information about each file in my repository:\n
This README.md file contains information about the Bike-sharing project.\n
test.csv and train.csv are the initial bike-sharing datasets.\n
Bike-sharing Analysis.R file is the file that contains prediction analyses on the dataset.\n
The .gitignore file is a file that tells Git to ignore certain files.\n

The methods that are used to clean the data and perform feature engineering include changing explanatory variables into factors and removing variables that are irrevelant to the analysis such as casual and registered. An additional variable "hour" is also created. Target encouding methods are also applied to create dummy variables for categorical variables.

Methods used to generate predictions include using the train function and its corresponding ranger and random forest designs. Additional arguments corresponding with these methods such as repeatedcv and oob are applied respectively. Variables hour, weather, workingday, and temp are set as explanatory variables in order to generate predictions.
