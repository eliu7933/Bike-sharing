# Bike-sharing

1. The overall purpose of this project is to investigate which variables of the Bike-sharing dataset are the best predictors bike-rental demand.

2. What does each file in your repository do?
Each file takes the Bike-sharing dataset and runs different predictive models and feature engineering methods to draw predictions for bike-rental demand.

3. What methods did you use to clean the data or do feature engineering?
I created an hour variable, changed it to factor, and used that as my main response variable.
I used one-hot enconding methods to create dummy variables for "weather" and "workingday" variables.

4. What methods did you use to generate predictions?
To the fit the models and generate predictions, I used different methods found in the argument train such as "ranger" and "rf" (random forest). I also used the "repeatedcv" method with ranger and "oob" with the random forest method.
I would also add or takeaway different variables such as "temp" in order to generate different predictions.