import statsmodels.api as sm
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix, accuracy_score, precision_score, recall_score, f1_score
import sklearn as sk
import pandas as pd
import numpy as np
import os

def get_metrics(y_actual, y_predicted):
    print("Confusion Matrix: \n ", format(confusion_matrix(y_actual, y_predicted.round())))
    print("Accuracy: ", format(accuracy_score(y_actual, y_predicted.round())))
    print("Precision: ", format(precision_score(y_actual, y_predicted.round())))
    print("Recall: ", format(recall_score(y_actual, y_predicted.round())))
    print("F1 score: ", format(f1_score(y_actual, y_predicted.round())))

data = pd.read_csv("export_from_code.csv")

print(data.describe())
print(data.info())

data["Intercept"] = 1.0
airport_data = data[["Intercept","Airline", "AccessTime", "DepartureTime", "Age", "Destination", "Nationality"]]
y_airport = data["Airport"].astype('category').cat.codes

# Convert all categorical variables to a matrix of zeros and ones
X_airport = pd.get_dummies(airport_data)
print(X_airport.head())

## Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(X_airport,y_airport,test_size =0.3,random_state=101)

#Design Model
logit_model = sm.Logit(y_train,X_train).fit()
print(logit_model.summary())

##Compute predicted probabilities using validation dataset with Threshold = 0.5

y_pred_prob_1 = logit_model.predict(X_test)
X_test.loc[:,'prediction']=0
X_test.loc[y_pred_prob_1 > 0.5,'prediction']=1

print("***-----------Logistic regression Model for airport with threshold:0.5---------------*******")
get_metrics(y_test, y_pred_prob_1)

##Compute predicted probabilities using validation dataset with Threshold = 0.7

## Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(X_airport,y_airport,test_size =0.3,random_state=101)

#Design Model
logit_model = sm.Logit(y_train,X_train).fit()

y_pred_prob_2 = logit_model.predict(X_test)
X_test.loc[:,'prediction']=0
X_test.loc[y_pred_prob_2 > 0.7,'prediction']=1

print("***-----------Logistic regression Model for airport with threshold:0.7---------------*******")
get_metrics(y_test, y_pred_prob_2)

##Compute predicted probabilities using validation dataset with Threshold = 0.3

## Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(X_airport,y_airport,test_size =0.3,random_state=101)

#Design Model
logit_model = sm.Logit(y_train,X_train).fit()

y_pred_prob_3 = logit_model.predict(X_test)
X_test.loc[:,'prediction']=0
X_test.loc[y_pred_prob_3 > 0.3,'prediction']=1

print("***-----------Logistic regression model for airport with threshold:0.3---------------*******")
get_metrics(y_test, y_pred_prob_3)



#Output:

#Confusion Matrix: 
#  [[66  4]
# [24 49]]
#Accuracy:  0.8041958041958042
#Precision:  0.9245283018867925
#Recall:  0.6712328767123288
#F1 score:  0.7777777777777778

##**--------------------AIRLINE------------------------**##
'''
data["Intercept"] = 1.0
airline_data = data[["Airport", "AccessTime", "DepartureTime", "Airfare", "Destination", "Nationality"]]
y_airline = data["Airline"].astype('category').cat.codes

# Convert all categorical variables to a matrix of zeros and ones
X_airline = pd.get_dummies(airline_data)
print(X_airline.head())

## Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(X_airline,y_airline,test_size =0.3,random_state=101)

#Design Model
logit_model = sm.Logit(y_train,X_train).fit()
print(logit_model.summary())

##Compute predicted probabilities using validation dataset with Threshold = 0.5

y_pred_prob_4 = logit_model.predict(X_test)
X_test.loc[:,'prediction']=0
X_test.loc[y_pred_prob_4 > 0.5,'prediction']=1

print("***-----------Logistic regression Model for airline with threshold:0.5---------------*******")
get_metrics(y_test, y_pred_prob_4)

##Compute predicted probabilities using validation dataset with Threshold = 0.7

## Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(X_airport,y_airport,test_size =0.3,random_state=101)

#Design Model
logit_model = sm.Logit(y_train,X_train).fit()

y_pred_prob_5 = logit_model.predict(X_test)
X_test.loc[:,'prediction']=0
X_test.loc[y_pred_prob_5 > 0.7,'prediction']=1

print("***-----------Logistic regression Model for airline with threshold:0.7---------------*******")
get_metrics(y_test, y_pred_prob_5)

##Compute predicted probabilities using validation dataset with Threshold = 0.3

## Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(X_airport,y_airport,test_size =0.3,random_state=101)

#Design Model
logit_model = sm.Logit(y_train,X_train).fit()

y_pred_prob_6 = logit_model.predict(X_test)
X_test.loc[:,'prediction']=0
X_test.loc[y_pred_prob_6 > 0.3,'prediction']=1

print("***-----------Logistic regression Model for airline with threshold:0.3---------------*******")
get_metrics(y_test, y_pred_prob_6)
'''