#MICROSTRATEGY_BEGIN
#
#RVAR Days.Since.Checkin -input -numeric -vector
#RVAR Last.Bedded.Service.Grouped -input -string -vector
#RVAR Critical.Care.Indicator -input -numeric -vector
#RVAR Subsequent.Indicator -input -numeric -vector
#RVAR Cardiovascular.dx.category -input -numeric -vector
#RVAR CCC.drugs.dx.category -input -numeric -vector
#RVAR Genetic.dx.category -input -numeric -vector
#RVAR GI.dx.category -input -numeric -vector
#RVAR Hem.imm.dx.category -input -numeric -vector
#RVAR Neonatal.dx.category -input -numeric -vector
#RVAR Neuro.dx.category -input -numeric -vector
#RVAR Renal.dx.category -input -numeric -vector
#RVAR Respiratory.dx.category -input -numeric -vector
#RVAR Technology.dependent.dx.category -input -numeric -vector
#RVAR Weeks.gestatation.category -input -string -vector
#RVAR CVL1.Indicator -input -numeric -vector
#RVAR ECMO.Indicator -input -numeric -vector
#RVAR Oxygen.Indicator -input -numeric -vector
#RVAR Vent.Indicator -input -numeric -vector
#RVAR IO.Difference.Category -input -string -vector
#RVAR Problem.Count -input -numeric -vector
#RVAR NPO.Indicator -input -numeric -vector
#RVAR Birthweight.categories -input -string -vector
#RVAR Albumin.Result.Most.Recent.or.Unmeasured.on.Bedded.Day -input -string -vector
#RVAR C.Reactive.Protein.Result.Most.Recent.or.Unmeasured.on.Bedded.Day -input -string -vector
#RVAR ESR.Result.Most.Recent.or.Unmeasured.on.Bedded.Day -input -string -vector
#RVAR WBC.Result.Most.Recent.or.Unmeasured.on.Bedded.Day -input -string -vector
#RVAR Weaning.Phase -input -string -vector
#RVAR Pressor.Med.Indicator -input -numeric -vector
#RVAR Clonidine.Inter.Indicator -input -numeric -vector
#RVAR Diazepam.Inter.Indicator -input -numeric -vector
#RVAR Fentanyl.Inter.Indicator -input -numeric -vector
#RVAR Methadone.Inter.Indicator -input -numeric -vector
#RVAR Morphine.Inter.Indicator -input -numeric -vector
#RVAR Intermittent.Sedative.Medication.Admin.Count -input -numeric -vector
#RVAR Midazolam.Cont.Indicator -input -numeric -vector
#RVAR Major.Region -input -string -vector

#
#RVAR predicted.fit -output -numeric -vector  #Metric Expression: RScript<_RScriptFile="J:\individual work areas\Akshith\ICU Predictions\ICU Predictions\7N 14 Day Discharge Prediction.R", _InputNames=" Days.Since.Checkin, Last.Bedded.Service.Grouped, Critical.Care.Indicator, Subsequent.Indicator, Cardiovascular.dx.category, CCC.drugs.dx.category, Genetic.dx.category, GI.dx.category, Hem.imm.dx.category, Neonatal.dx.category, Neuro.dx.category, Renal.dx.category, Respiratory.dx.category, Technology.dependent.dx.category, Weeks.gestatation.category, CVL1.Indicator, ECMO.Indicator, Oxygen.Indicator, Vent.Indicator, IO.Difference.Category, Problem.Count, NPO.Indicator, Birthweight.categories, Albumin.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, C.Reactive.Protein.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, ESR.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, WBC.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, Weaning.Phase, Pressor.Med.Indicator, Clonidine.Inter.Indicator, Diazepam.Inter.Indicator, Fentanyl.Inter.Indicator, Methadone.Inter.Indicator, Morphine.Inter.Indicator, Intermittent.Sedative.Medication.Admin.Count, Midazolam.Cont.Indicator, Major.Region", _WorkingDir="\\BI_ISD\BI_Share\individual work areas\Akshith\ICU Predictions\ICU Predictions">( Days.Since.Checkin, Last.Bedded.Service.Grouped, Critical.Care.Indicator, Subsequent.Indicator, Cardiovascular.dx.category, CCC.drugs.dx.category, Genetic.dx.category, GI.dx.category, Hem.imm.dx.category, Neonatal.dx.category, Neuro.dx.category, Renal.dx.category, Respiratory.dx.category, Technology.dependent.dx.category, Weeks.gestatation.category, CVL1.Indicator, ECMO.Indicator, Oxygen.Indicator, Vent.Indicator, IO.Difference.Category, Problem.Count, NPO.Indicator, Birthweight.categories, Albumin.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, C.Reactive.Protein.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, ESR.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, WBC.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, Weaning.Phase, Pressor.Med.Indicator, Clonidine.Inter.Indicator, Diazepam.Inter.Indicator, Fentanyl.Inter.Indicator, Methadone.Inter.Indicator, Morphine.Inter.Indicator, Intermittent.Sedative.Medication.Admin.Count, Midazolam.Cont.Indicator, Major.Region)
#RVAR predicted.se.fit -output -numeric -vector  #Metric Expression: RScript<_RScriptFile="J:\individual work areas\Akshith\ICU Predictions\ICU Predictions\7N 14 Day Discharge Prediction.R", _InputNames=" Days.Since.Checkin, Last.Bedded.Service.Grouped, Critical.Care.Indicator, Subsequent.Indicator, Cardiovascular.dx.category, CCC.drugs.dx.category, Genetic.dx.category, GI.dx.category, Hem.imm.dx.category, Neonatal.dx.category, Neuro.dx.category, Renal.dx.category, Respiratory.dx.category, Technology.dependent.dx.category, Weeks.gestatation.category, CVL1.Indicator, ECMO.Indicator, Oxygen.Indicator, Vent.Indicator, IO.Difference.Category, Problem.Count, NPO.Indicator, Birthweight.categories, Albumin.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, C.Reactive.Protein.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, ESR.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, WBC.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, Weaning.Phase, Pressor.Med.Indicator, Clonidine.Inter.Indicator, Diazepam.Inter.Indicator, Fentanyl.Inter.Indicator, Methadone.Inter.Indicator, Morphine.Inter.Indicator, Intermittent.Sedative.Medication.Admin.Count, Midazolam.Cont.Indicator, Major.Region", _WorkingDir="\\BI_ISD\BI_Share\individual work areas\Akshith\ICU Predictions\ICU Predictions">( Days.Since.Checkin, Last.Bedded.Service.Grouped, Critical.Care.Indicator, Subsequent.Indicator, Cardiovascular.dx.category, CCC.drugs.dx.category, Genetic.dx.category, GI.dx.category, Hem.imm.dx.category, Neonatal.dx.category, Neuro.dx.category, Renal.dx.category, Respiratory.dx.category, Technology.dependent.dx.category, Weeks.gestatation.category, CVL1.Indicator, ECMO.Indicator, Oxygen.Indicator, Vent.Indicator, IO.Difference.Category, Problem.Count, NPO.Indicator, Birthweight.categories, Albumin.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, C.Reactive.Protein.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, ESR.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, WBC.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, Weaning.Phase, Pressor.Med.Indicator, Clonidine.Inter.Indicator, Diazepam.Inter.Indicator, Fentanyl.Inter.Indicator, Methadone.Inter.Indicator, Morphine.Inter.Indicator, Intermittent.Sedative.Medication.Admin.Count, Midazolam.Cont.Indicator, Major.Region)
if(exists("mstr.WorkingDir")) setwd(mstr.WorkingDir)  #Working Directory if executed by MicroStrategy
#
#MICROSTRATEGY_END

if(exists("mstr.WorkingDir")) setwd(mstr.WorkingDir)  #Working Directory if executed by MicroStrategy
## Rscript for predicting discharge within 7 days from 7N NICU based on logistic model trained on 2014-2016 data
mstr.ErrMsg <- tryCatch({                                      #tryCatch for Exception Handling
  if(exists("mstr.WorkingDir")) setwd(mstr.WorkingDir)         #Working Directory if executed by MicroStrategy
  #Get the prediction model
  load("ICUPredictors.7N.14.2016.steplogis.Rda")
  #Get the data
  if(exists("mstr.ExFlag")) {
    #Create a data frame from the input variables
    predictors.df <- data.frame( Days.Since.Checkin, Last.Bedded.Service.Grouped, Critical.Care.Indicator, Initial.Indicator, Subsequent.Indicator, Cardiovascular.dx.category, CCC.drugs.dx.category, Genetic.dx.category, GI.dx.category, Hem.imm.dx.category, Metabolism.dx.categoy, Neonatal.dx.category, Neuro.dx.category, Renal.dx.category,Respiratory.dx.category, Technology.dependent.dx.category, Weeks.gestatation.category, ArtLine.Indicator, CVL1.Indicator, ECMO.Indicator, Oxygen.Indicator, Vent.Indicator, IO.Difference.Category, Problem.Count, NPO.Indicator, Birthweight.categories, Albumin.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, C.Reactive.Protein.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, ESR.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, WBC.Result.Most.Recent.or.Unmeasured.on.Bedded.Day, Weaning.Phase, Pressor.Med.Indicator, Clonidine.Inter.Indicator, Fentanyl.Inter.Indicator, Lorazepam.Inter.Indicator, Midazolam.Cont.Indicator, Morphine.Cont.Indicator, Major.Region)
    #If InputNames is non-empty
    if(length(mstr.InputNames) > 0) {
      #Name these variables
      colnames(predictors.df) <- mstr.InputNames
    }
    #If this is NOT via a MicroStrategy Report Execution
  } else {
    load("ICUPredictors.7N.14.2016.steplogis.Rda")
    predictors.df <- ICUPredictors.7N.14.2017.df
  }
  #Make Predictions
  ## Debug Printing Input
  # library(openxlsx)
  # write.xlsx(predictors.df,"debug_predictors.xlsx")
  ## End Debug Printing Input
  predicted.values <- predict(ICUPredictors.7N.14.2016.steplogis, newdata=predictors.df, type="response", se.fit=TRUE)
  predicted.fit <- predicted.values$fit
  predicted.se.fit <- predicted.values$se.fit
  ## Deug Printing Output
  # write.xlsx(predicted.fit,"debug_predictedfit.xlsx")
  ## End Debug Printing Output
  #Finish
  try(print("Success!"))                                       #Print completion message when run from the console                                             #If we made it here, no errors were caught (using try to continue on any print error)
  mstr.ErrMsg <- ""                                            #If we made it here, no errors were caught
}, error = function(err) {                                     #Catch block to report an error
  try(print(err))                                              #  Print error message to console (using try to continue on any print error)
  return(err$message)                                          #  Return error Message
})