install.packages("MicroStrategyR")
install.packages("dplyr")
install.packages("openxlsx")
install.packages("bitops")
install.packages("gplots")
install.packages("ROCR")


library(openxlsx) # how to easily open files
library(MASS) # modern applied statistics with S
library(dplyr) # to clean data
library(bitops)
library(gplots)
library(ROCR) # to create ROC 
library(MicroStrategyR)


# set working directory
# setwd("J:/individual work areas/Akshith/ICU Predictions/ICU Predictions")
setwd("J:/Ashley/ICU Prediction")

# 2016 NICU 21 Days
# NICU_cy2016.df <- read.xlsx("Create 7N NICU Training Dataset WIP 21 Days Full 2014-2016.xlsx") #, detectDates=TRUE)
# New service variable 
NICU_cy2016.df <- read.xlsx("Create 7N NICU Training Dataset WIP 14 Days Full 2016.xlsx", detectDates=TRUE)

# Validation data set
# NICU_JanOct2017.df <- read.xlsx("Create 7N NICU Training Dataset WIP 21 Days Full 2017.xlsx", detectDates=TRUE)
# New service variable
NICU_JanOct2017.df <- read.xlsx("Create 7N NICU Training Dataset WIP 5 Days Discharge Full 2017.xlsx", detectDates=TRUE)

# Fit model

## Select from the full dataset  just just the variables to try fitting.

ICUPredictors.7N.2016.df <- select(NICU_cy2016.df, At.Least.21.Days.Till.Checkout, Days.Since.Checkin, Last.Bedded.Service.Grouped:Total.Cont.Sedative.Medications, Gender, Major.Region)

## Fit a logistic regression model with all of the initial set of selected variables

ICUPredictors.7N.2016.logis <- glm(At.Least.21.Days.Till.Checkout ~ ., family=binomial(logit), data=ICUPredictors.7N.2016.df)
summary(ICUPredictors.7N.2016.logis)

## Use step-wise elimination to automatically remove those predictor variables that do not signficantly contribute to the model

ICUPredictors.7N.2016.steplogis <- stepAIC(ICUPredictors.7N.2016.logis, trace=0)
summary(ICUPredictors.7N.2016.steplogis)
# save the new model
save(ICUPredictors.7N.2016.steplogis, file="ICUPredictors.7N.2016.steplogis.Rda")


# Test model predictions on validation data


## First select from validation dataset just the variables we used in the training dataset

ICUPredictors.7N.JanOct2017.df <- select(NICU_JanOct2017.df, At.Least.21.Days.Till.Checkout, Days.Since.Checkin, Last.Bedded.Service.Grouped:Total.Cont.Sedative.Medications, Gender, Major.Region)
# save the 2017 validation data set
save(ICUPredictors.7N.JanOct2017.df, file="ICUPredictors.7N.JanOct2017.df.Rda")

## Predict outcomes by feeding the validation predictor variables into the model
ICUPredictors.7N.t2016.vJanOct2017.steplogis.predict <- predict(ICUPredictors.7N.2016.steplogis, newdata=ICUPredictors.7N.JanOct2017.df, type="response", se.fit=TRUE)

## Tally up the predicted outcomes vs. the actual outcomes included in the validation dataset (This is called scoring.)

evaluation.scores <- prediction(ICUPredictors.7N.t2016.vJanOct2017.steplogis.predict$fit, ICUPredictors.7N.JanOct2017.df$At.Least.21.Days.Till.Checkout)


## Calculate statistical measures of the quality of the model from the evaluation scores

evaluation.roc <- performance(evaluation.scores, "tpr", "fpr")          # ROC curve
evaluation.rocarea <- performance(evaluation.scores, "auc")@y.values    # Area under ROC curve
evaluation.cutoffs <- evaluation.roc@alpha.values[[1]]                  # Prediction cutoff values
evaluation.fpr <- evaluation.roc@x.values[[1]]                          # False positive rate
evaluation.tpr <- evaluation.roc@y.values[[1]]                          # True positive rate
evaluation.tnr <- performance(evaluation.scores, "tnr")                 # True negative rate
evaluation.ppv <- performance(evaluation.scores, "ppv")                 # Positive predictive value
evaluation.npv <- performance(evaluation.scores, "npv")                 # Negative predictive value
evaluation.acc <- performance(evaluation.scores, "acc")                 # Accuracy
evaluation.err <- performance(evaluation.scores, "err")                 # Error rate


## Plot the evaluation measures in various ways to visually assess the quality of the predictions


### Create ROC plot and write to file

plot(evaluation.roc, col = "red", lwd=2, ylim=c(0,1),xlim=c(0,1))
abline(0,1, lty = 8, col = "grey")
title( main="ROC Curve for Daily Predictions of 21+ More Days in 7N NICU",
       sub="Logistic model trained with CY2014-2016 and validated with Jan-Nov 2017 data")
legend("bottom",legend=paste("ROC Area:",format(evaluation.rocarea, digits=3)))


### Create TPR/TNR plot and write to file

plot(evaluation.tnr, ylim=c(0,1), col="black", lwd=2, ylab="Rates")
lines(evaluation.cutoffs, evaluation.tpr, ylim=c(0,1),col="red", lwd=2, lty=1)
legend("bottom",c("TPR   21+ days", "TNR   21+ days"), col=c("red","black"), lty=c(1,1), lwd=c(2,2))
title(main="True Positive and True Negative Rate Plots by Cutoff\nFor Daily Predictions of 21+ More Days in 7N NICU",
      sub="Logistic model trained with CY2014-2016 and validated with Jan-Nov 2017 data")


### Create PPV/NPV plot and write to file

plot(evaluation.ppv, ylim=c(0,1), col="red", lwd=2, ylab="Rates")
lines(evaluation.npv@x.values[[1]], evaluation.npv@y.values[[1]],
      ylim=c(0,1),col="black", lwd=2, lty=1)
legend("bottom",c("PPV   21+ days", "NPV   21+ days"),
       col=c("red","black"), lty=c(1,1), lwd=c(2,2))
title(main="Positive Predictive Value and Negative Predictive Value Plots by Cutoff\nFor Daily Predictions of 21+ More Days in 7N NICU",
      sub="Logistic model trained with CY2014-2016 and validated with Jan-Nov 2017 data")


### Create Accuracy/Error plot and write to file

plot(evaluation.acc@x.values[[1]], evaluation.acc@y.values[[1]], col="red",
     xlab=evaluation.acc@x.name, ylab="Accuracy", type="l",lwd=2,xlim=c(0,1),ylim=c(0,1))
lines(evaluation.err@x.values[[1]], evaluation.err@y.values[[1]],col="black", lwd=1, lty=2)
legend("bottomright",c("ACC   21+ days", "ERR   21+ days"),
       col=c("red","black"),lty=c(1,2), lwd=c(2,1))
title(main="Accuracy and Error Rates by Cutoff\nFor Daily Predictions of 21+ More Days in 7N NICU",
      sub="Logistic model trained with CY2014-2016 and validated with Jan-Nov 2017 data")
