import pandas as pd
from sklearn.model_selection  import train_test_split
from sklearn.metrics import confusion_matrix, accuracy_score, precision_score, recall_score, f1_score
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
import os

def get_metrics(y_actual, y_predicted):
    print("Confusion Matrix: \n ", format(confusion_matrix(y_actual, y_predicted)))
    print("Accuracy: ", format(accuracy_score(y_actual, y_predicted)))
    print("Precision: ", format(precision_score(y_actual, y_predicted)))
    print("Recall: ", format(recall_score(y_actual, y_predicted)))
    print("F1 score: ", format(f1_score(y_actual, y_predicted)))


os.chdir('E:/SeattleU Education/3rd Quarter, Spring19/BUAN 5310 Statistical Learning/BUAN5310_Group4/Python codes')
data = pd.read_csv("export_from_code.csv")

print(data.describe())
print(data.info())

airport_data = data[["Airline", "AccessTime", "DepartureTime", "Age", "Destination", "Province"]]
y_airport = data["Airport"].astype('category').cat.codes

airline_data = data[["Airport", "DepartureTime", "Airfare", "Destination", "Province", "Nationality"]]
y_airline = data["Airline"].astype('category').cat.codes


# Convert all categorical variables to a matrix of zeros and ones
airport_data = pd.get_dummies(airport_data)
print(airport_data.head())


# Standardizing data improves computations and makes sure all features are weighted equally for SVMs and NN
scaler = StandardScaler()
airport_data = scaler.fit_transform(airport_data)


# Split the dataset into training and testing data
X_train, X_test, y_train, y_test = train_test_split(airport_data, y_airport, test_size=0.30, random_state=109)


print("\n **** SVM with Kernel = Linear ****")
svclassifier = SVC(kernel='linear')    	# Linear SVM
svclassifier.fit(X_train, y_train)
y_pred_svm_linear = svclassifier.predict(X_test)  	# predict test set
# print(metrics.confusion_matrix(y_test, y_pred_svm_linear))

print("Support Vector Machine Linear Model: Airport")
get_metrics(y_test, y_pred_svm_linear)

print("\n **** SVM with Kernel = Poly with degree 3 ****")
svclassifier = SVC(kernel='poly', degree=3)    	# cubic polynomial SVM
svclassifier.fit(X_train, y_train)
y_pred_svm_poly = svclassifier.predict(X_test)  	# predict test set
# print(metrics.confusion_matrix(y_test, y_pred_svm_poly))

print("Support Vector Machine Poly(3) Model: Airport")
get_metrics(y_test, y_pred_svm_poly)

print("\n **** SVM with Kernel = RBF ****")
svclassifier = SVC(kernel='rbf')    	# RBF SVM
svclassifier.fit(X_train, y_train)
y_pred_svm_rbf = svclassifier.predict(X_test)  	# predict test set
# print(metrics.confusion_matrix(y_test, y_pred_svm_rbf))

print("Support Vector Machine RBF Model: Airport")
get_metrics(y_test, y_pred_svm_rbf)
