import pandas as pd
from sklearn.model_selection  import train_test_split
from sklearn import metrics
from sklearn import tree
import graphviz
import statsmodels.api as sm
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix,accuracy_score, precision_score, recall_score, f1_score

def get_metrics(y_actual, y_predicted):
    print("Confusion Matrix: \n ", format(confusion_matrix(y_actual, y_predicted)))
    print("Accuracy: ", format(accuracy_score(y_actual, y_predicted)))
    print("Precision: ", format(precision_score(y_actual, y_predicted)))
    print("Recall: ", format(recall_score(y_actual, y_predicted)))
    print("F1 score: ", format(f1_score(y_actual, y_predicted)))

data = pd.read_csv("export_from_code.csv", sep=',', header=0)

airport_data = data[["Airline", "AccessTime", "DepartureTime", "Age", "Destination", "Distance"]]
y_airport = data["Airport"].astype('category').cat.codes

airline_data = data[["Airport", "AccessTime", "DepartureTime", "Airfare", "Destination", "Distance"]]
y_airline = data["Airline"].astype('category').cat.codes

# Convert all categorical variables to a matrix of zeros and ones
airport_data = pd.get_dummies(airport_data)
print(airport_data.head())

airline_data = pd.get_dummies(airline_data)
print(airline_data.head())

# decision tree model for airport data
X_train, X_test, y_train, y_test = train_test_split(airport_data,y_airport,test_size =0.3,random_state=101) 
clf= tree.DecisionTreeClassifier(class_weight=None, criterion='gini', max_depth=None, max_features=None, max_leaf_nodes=None, min_samples_leaf=1, min_samples_split=2, min_weight_fraction_leaf=0.0, presort=False, random_state=109, splitter='best')
clf = clf.fit(X_train, y_train)
y_pred = clf.predict(X_test)
## export estimated tree into dot graphic file
dot_data = tree.export_graphviz(clf, out_file='DtreeAirport.dot', feature_names=airport_data.columns)
print("Decision Tree Model: Airport")
get_metrics(y_test, y_pred)


# decision tree model for airline data
X_train, X_test, y_train, y_test = train_test_split(airline_data,y_airline,test_size =0.3,random_state=101) 
clf= tree.DecisionTreeClassifier(class_weight=None, criterion='gini', max_depth=None, max_features=None, max_leaf_nodes=None, min_samples_leaf=1, min_samples_split=2, min_weight_fraction_leaf=0.0, presort=False, random_state=109, splitter='best')
clf = clf.fit(X_train, y_train)
y_pred = clf.predict(X_test)
## export estimated tree into dot graphic file
dot_data = tree.export_graphviz(clf, out_file='DtreeAirline.dot', feature_names=airline_data.columns)
print("Decision Tree Model: Airline")
get_metrics(y_test, y_pred)