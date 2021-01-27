################## BIKE-SHARING ANALYSIS ####################

##### Libraries #####

library(tidyverse)
library(DataExplorer)
library(caret)
library(vroom)
library(lubridate)

##### Read in the data #####

system.time(bike.train <- read.csv("~/Bike-sharing/train.csv"))
bike.test <- vroom("~/Bike-sharing/test.csv")

bike.test$datetime <- as.character(bike.test$datetime)
bike <- bind_rows(train=bike.train, test=bike.test, .id="id")


##### Feature Engineering #####

bike <- bike %>% select(-casual, -registered) # drop casual and registered
bike$hour <- hour(bike$datetime) %>% as.factor() # create hour variable
bike$weather <- as.factor(bike$weather) # change weather to factor
bike$workingday <- as.factor(bike$workingday) # change workingday to factor


##### Exploratory Plots #####

ggplot(data = bike, aes(x = hour, y = count, color = as.factor(month(datetime)))) +
  geom_point()
plot_missing(bike)
plot_correlation(bike, type="continuous",
                 cor_args=list(use='pairwise.complete.obs'))


##### Target encoding #####

bike$weather <- lm(count ~ weather, data = bike) %>% # create weather dummy variable
  predict(., newdata=bike %>% select(-count))

bike$workingday <- lm(count ~ workingday, data = bike) %>% # create workingday dummy variable
  predict(., newdata=bike %>% select(-count))


##### Fit model #####
bike.model <- train(form = count ~ hour + weather + workingday + temp,
                    data = bike %>% filter(id == 'train'),
                    method = "ranger",
                    tuneLength = 2,
                    trControl = trainControl(
                      method = "repeatedcv",
                      number = 10,
                      repeats=2) #repeats are for repeatedcv
)

plot(bike.model)
preds <- predict(bike.model, newdata=bike %>% filter(id=="test"))
submission <- data.frame(datetime=bike %>% filter(id=="test") %>% pull(datetime),
                         count=preds)
write.csv(x=submission, file="~/Bike-sharing/Submissions.csv", row.names=FALSE)                   
