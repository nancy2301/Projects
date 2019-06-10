import statsmodels.api as sm
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
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

#airline_data = data[["Airport", "AccessTime", "DepartureTime", "Airfare", "Destination", "Distance"]]
#y_airline = data["Airline"].astype('category').cat.codes

# Convert all categorical variables to a matrix of zeros and ones
X_airport = pd.get_dummies(airport_data)
print(X_airport.head())

## Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(X_airport,y_airport,test_size =0.3,random_state=101)
 
# Train logistic regression model
multinomial_logit = LogisticRegression(random_state=0, solver='lbfgs',multi_class='multinomial').fit(X_train, y_train)

##Compute predicted probabilities using validation dataset with Threshold = 0.5

y_pred_prob_1 = multinomial_logit.predict(X_test)
X_test.loc[:,'prediction']=0
X_test.loc[y_pred_prob_1 > 0.3,'prediction']=1

print("***-----------Multinomial Logistic regression Model with threshold:0.5---------------*******")
get_metrics(y_test, y_pred_prob_1)

#Output:
#Confusion Matrix: 
#  [[66  4]
# [24 49]]
#Accuracy:  0.8041958041958042
#Precision:  0.9245283018867925
#Recall:  0.6712328767123288
#F1 score:  0.7777777777777778

##**--------------------AIRLINE------------------------**##
def get_metrics_airline(y_actual, y_predicted):
    print("Confusion Matrix: \n ", format(confusion_matrix(y_actual, y_predicted.round())))
    print("Accuracy: ", format(accuracy_score(y_actual, y_predicted.round())))
    print("Precision: ", format(precision_score(y_actual, y_predicted.round(), average = 'weighted')))
    print("Recall: ", format(recall_score(y_actual, y_predicted.round(), average = 'weighted')))
    print("F1 score: ", format(f1_score(y_actual, y_predicted.round(), average = 'weighted')))

data["Intercept"] = 1.0
airline_data = data[["Intercept","Airport", "AccessTime", "DepartureTime", "Age", "Destination", "Nationality"]]
y_airline = data["Airline"].astype('category').cat.codes

# Convert all categorical variables to a matrix of zeros and ones
X_airline = pd.get_dummies(airline_data)
print(X_airline.head())

## Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(X_airline,y_airline,test_size =0.3,random_state=109)
 
# Train logistic regression model
multinomial_airline = LogisticRegression(solver='lbfgs',multi_class='multinomial').fit(X_train, y_train)

##Compute predicted probabilities using validation dataset with Threshold = 0.5

y_pred_prob_2 = multinomial_airline.predict(X_test)
X_test.loc[:,'prediction']=0
X_test.loc[y_pred_prob_2 > 0.5,'prediction']=1

print("***-----------Multinomial Logistic regression Model with threshold:0.5---------------*******")
get_metrics_airline(y_test, y_pred_prob_2)
