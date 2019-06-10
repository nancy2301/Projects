import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix,accuracy_score, precision_score, recall_score, f1_score
from sklearn.neural_network import MLPClassifier

def get_metrics(y_actual, y_predicted):
    print("Confusion Matrix: \n ", format(confusion_matrix(y_actual, y_predicted)))
    print("Accuracy: ", format(accuracy_score(y_actual, y_predicted)))
    print("Precision: ", format(precision_score(y_actual, y_predicted)))
    print("Recall: ", format(recall_score(y_actual, y_predicted)))
    print("F1 score: ", format(f1_score(y_actual, y_predicted)))

data = pd.read_csv("export_from_code.csv")

print(data.describe())
print(data.info())

airport_data = data[["Airline", "AccessTime", "DepartureTime", "Age", "Destination", "Distance"]]
y_airport = data["Airport"].astype('category').cat.codes

airline_data = data[["Airport", "AccessTime", "DepartureTime", "Airfare", "Destination", "Distance"]]
y_airline = data["Airline"].astype('category').cat.codes

# Convert all categorical variables to a matrix of zeros and ones
airport_data = pd.get_dummies(airport_data)
print(airport_data.head())

## Standardizing data improves computations and makes sure all features are weighted equally for SVMs and NN
scaler = StandardScaler()
airport_data = scaler.fit_transform(airport_data)

## Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(airport_data,y_airport,test_size =0.3,random_state=101)

clf_nn = MLPClassifier(hidden_layer_sizes = (10, 10, 10), activation='logistic', random_state=101)
clf_nn.fit(X_train, y_train)

y_pred_nn = clf_nn.predict(X_test)

print("Neural Network Classifier Model: Airport")
get_metrics(y_test, y_pred_nn)