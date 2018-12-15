import pandas as pd


class forecastingMethods(object):

    def __init__(self):
        # initialize training and validation data set
        self.trainingData = pd.read_csv("/Users/nancyjain/Documents/nancy/SeattleUniversity/1/ProgrammingForBusinessAnalytics/Project/airline_booking_trainingData.csv",sep=',')
        self.validationData = pd.read_csv("/Users/nancyjain/Documents/nancy/SeattleUniversity/1/ProgrammingForBusinessAnalytics/Project/airline_booking_validationData.csv",sep=',')
        
        self.forecastingMethod = 0

    def choose_Forecasting_Method(self):
        # calculate days prior for training data and validation data
        self.trainingData['days_prior'] = (pd.to_datetime(self.trainingData['departure_date']) - pd.to_datetime(self.trainingData['booking_date'])).dt.days
        self.validationData['days_prior'] = (pd.to_datetime(self.validationData['departure_date']) - pd.to_datetime(self.validationData['booking_date'])).dt.days

        self.forecastingMethod = int(
            input('Please enter which forecasting method do you want to use from the following options (enter 1 / 2 / 3 / 4 / 5) : \n'
                  '1)Days Prior Additive Forecasting \n2)Days Prior Multiplicative  Forecasting \n3)Weekly Additive Forecasting \n'
                  '4)Weekly Multiplicative Forecasting \n5)Weighted average Forecasting :'))
                  
        if self.forecastingMethod == 1:
            return self.additiveForecast_DaysPrior()
        elif self.forecastingMethod == 2:
            return self.multiplicativeForecast_DaysPrior()
        elif self.forecastingMethod == 3:
            return self.additiveForecast_daysPrior_Weekly()
        elif self.forecastingMethod == 4:
            return self.multiplicativeForecast_daysPrior_Weekly()
        elif self.forecastingMethod == 5:
            return self.weighted_average()

    def additiveForecast_DaysPrior(self):

        # sort values by departure date and days prior
        trainingData1 = self.trainingData.sort_values(by=['departure_date', 'days_prior'])

        # calculate final bookings when days prior = 0 and create a column for that
        trainingData1['final_bookings(days_prior=0)'] = trainingData1.groupby(['departure_date'])['cum_bookings'].transform(max)

        # calculate remaining bookings : remaining bookings = (final bookings - cumulative bookings)
        trainingData1['remaining_bookings'] = trainingData1['final_bookings(days_prior=0)'] - trainingData1['cum_bookings']

        # create another data frame "historical_remaining_day_avg" , from training data, that contains historical average remaining,
        # which further will be used to calculate forecasting value for validation data
        # historical average remaining = average(sum(remaining bookings) when days prior = 0 / 1 / 2....)
        historical_remaining_day_avg = trainingData1.groupby('days_prior')['remaining_bookings'].mean().rename('historical_avg_remaining').reset_index()

        # left join "validationData" and "historical_remaining_day_avg" on "days_prior" column
        validationData1 = self.validationData.merge(historical_remaining_day_avg, left_on=['days_prior'],right_on=['days_prior'], how='left')

        # remove all records when days prior = 0
        validationData1 = validationData1.drop(validationData1[validationData1['days_prior'] == 0].index)

        # calculate additive forecast : (additive forecast = cumulative bookings + historical average remaining)
        validationData1['AdditiveForecast'] = validationData1['cum_bookings'] + validationData1['historical_avg_remaining']

        # calculate error term for additive model: (error term = final demand - additive forecast)
        validationData1['Error_Term'] = abs(validationData1['final_demand'] - validationData1['AdditiveForecast'])

        # sum_errorTerm = summation of all the error terms for the additive model
        sum_errorTerm = validationData1['Error_Term'].sum()

        # calculate error term for naive model: (error term = final demand - naive forecast)
        validationData1['Denominator'] = abs(validationData1['final_demand'] - validationData1['naive_forecast'])

        # sum_errorTerm = summation of all the error terms for the naive model
        sum_Denominator = validationData1['Denominator'].sum()

        # create output data frame
        forecasts = validationData1[['departure_date', 'booking_date', 'AdditiveForecast']]

        # calculate MASE value
        MASE = (sum_errorTerm / sum_Denominator)

        # return output dataframe consisting of departure date , booking date and forecast values from the model
        # return MASE value
        return [forecasts, MASE]

    def multiplicativeForecast_DaysPrior(self):
        trainingData1 = self.trainingData.sort_values(by = ['departure_date','days_prior'])
        
        # calculate final bookings when days prior = 0 and create a column for that
        trainingData1['final_bookings(days_prior=0)'] = trainingData1.loc[trainingData1.days_prior == 0,'cum_bookings']
        trainingData1['final_bookings(days_prior=0)'] = trainingData1.groupby(['departure_date'])['final_bookings(days_prior=0)'].transform(lambda x:x.fillna(x.value_counts().index[0]))
        
        # calculate booking ratio : booking ratio = (cumulative bookings / final bookings)
        trainingData1['booking_ratio'] = trainingData1['cum_bookings'] / trainingData1['final_bookings(days_prior=0)']
    
        # create another data frame "historical_remaining_day_Ratioavg" , from training data, that contains historical remaining day ratio, 
        # which further will be used to calculate forecasting value for validation data
        # historical remaining day ratioAvg = average(sum(booking ratio) when days prior = 0 / 1 / 2....)
        historical_remaining_day_RatioAvg = trainingData1.groupby('days_prior')['booking_ratio'].mean().rename('historical_avg_ratio').reset_index()
        
        # left join "validationData" and "historical_remaining_day_RatioAvg" on "days_prior" column
        validationData1 = self.validationData.merge(historical_remaining_day_RatioAvg, left_on = ['days_prior'], right_on = ['days_prior'], how = 'left')

        # remove all records when days prior = 0
        validationData1 = validationData1.drop(validationData1[validationData1['days_prior'] == 0].index)

        # calculate multiplicative forecast : (multiplicative forecast = cumulative bookings / historical average ratio average)
        validationData1['MultiplicativeForecast'] = validationData1['cum_bookings'] / validationData1['historical_avg_ratio']

        # calculate error term for multiplicative model: (error term = final demand - multiplicative forecast)
        validationData1['Error_Term'] = abs(validationData1['final_demand'] - validationData1['MultiplicativeForecast'])

        # sum_errorTerm = summation of all the error terms for the multiplicative model
        sum_errorTerm = validationData1['Error_Term'].sum()

        # calculate error term for naive model: (error term = final demand - naive forecast)
        validationData1['Denominator'] = abs(validationData1['final_demand'] - validationData1['naive_forecast'])

        # sum_errorTerm = summation of all the error terms for the naive model
        sum_Denominator = validationData1['Denominator'].sum()

        # create output data frame
        forecasts = validationData1[['departure_date', 'booking_date', 'MultiplicativeForecast']]

        # calculate MASE value
        MASE = (sum_errorTerm / sum_Denominator)

        # return output dataframe consisting of departure date , booking date and forecast values from the model
        # return MASE value
        return [forecasts, MASE]

    def additiveForecast_daysPrior_Weekly(self):
        # convert 'booking date' to pandas 'date time' format
        self.trainingData['booking_date1'] = pd.to_datetime(self.trainingData['booking_date'])

        # assign weekday to each booking date
        # 0 : Monday , 1 : Tuesday, 2 : Wednesday, 3 : Thursday, 4 : Friday, 5 : Saturday, 6 : Sunday
        self.trainingData['weekday'] = self.trainingData['booking_date1'].dt.dayofweek

        # sort the training data
        trainingData1 = self.trainingData.sort_values(by=['departure_date', 'weekday', 'days_prior'])

        # calculate final bookings when days prior = 0
        trainingData1['final_bookings(days_prior=0)'] = trainingData1.groupby(['departure_date'])['cum_bookings'].transform(max)

        # calculate remaining bookings : remaining bookings = (final bookings - cumulative bookings)
        trainingData1['remaining_bookings'] = trainingData1['final_bookings(days_prior=0)'] - trainingData1['cum_bookings']

        # create another data frame "historical_remaining_day_avg" , from training data, that contains historical average remaining,
        # which further will be used to calculate forecasting value for validation data
        # historical average remaining = average(sum(remaining bookings) when days prior = 0 / 1 / 2.... and weekday = Monday / Tuesday / .....)
        historical_remaining_day_avg = trainingData1.groupby(['days_prior', 'weekday'])['remaining_bookings'].mean().rename('historical_avg_remaining').reset_index()

        # convert 'booking date' to pandas 'date time' format
        self.validationData['booking_date1'] = pd.to_datetime(self.validationData['booking_date'])

        # assign weekday to each booking date
        # 0 : Monday , 1 : Tuesday, 2 : Wednesday, 3 : Thursday, 4 : Friday, 5 : Saturday, 6 : Sunday
        self.validationData['weekday'] = self.validationData['booking_date1'].dt.dayofweek

        # left join "validationData" and "historical_remaining_day_avg" on "days_prior" and "weekday" column
        validationData1 = self.validationData.merge(historical_remaining_day_avg, left_on=['days_prior', 'weekday'],right_on=['days_prior', 'weekday'], how='left')

        # remove all records when days prior = 0
        validationData1 = validationData1.drop(validationData1[validationData1['days_prior'] == 0].index)

        # calculate additive forecast : (additive forecast = cumulative bookings + historical average remaining)
        validationData1['AdditiveForecast'] = validationData1['cum_bookings'] + validationData1['historical_avg_remaining']

        # calculate error term for additive model: (error term = final demand - additive forecast)
        validationData1['Error_Term'] = abs(validationData1['final_demand'] - validationData1['AdditiveForecast'])

        # Total sum the error term
        sum_errorTerm = validationData1['Error_Term'].sum()

        # sum_errorTerm = summation of all the error terms for the naive model
        validationData1['Denominator'] = abs(validationData1['final_demand'] - validationData1['naive_forecast'])

        # sum_errorTerm = summation of all the error terms for the naive model
        sum_Denominator = validationData1['Denominator'].sum()
        
        # create output data frame to be displayed and to be used in weigted average method to calculate forecast
        # error_term and historical average is also included in the data frame so that it can be used in weighted average forecasting method
        forecasts = validationData1[['departure_date', 'booking_date', 'AdditiveForecast', 'Error_Term', 'historical_avg_remaining']]

        # calculate MASE value
        MASE = (sum_errorTerm / sum_Denominator)

        # return output dataframe consisting of departure date , booking date and forecast values from the model
        # return MASE value
        
        return [forecasts, MASE]

    def multiplicativeForecast_daysPrior_Weekly(self):
        # convert 'booking date' to pandas 'date time' format
        self.trainingData['booking_date1'] = pd.to_datetime(self.trainingData['booking_date'])

        # assign weekday to each booking date
        # 0 : Monday , 1 : Tuesday, 2 : Wednesday, 3 : Thursday, 4 : Friday, 5 : Saturday, 6 : Sunday
        self.trainingData['weekday'] = self.trainingData['booking_date1'].dt.dayofweek

        # sort the training data
        trainingData1 = self.trainingData.sort_values(by=['departure_date', 'weekday', 'days_prior'])

        # calculate final bookings when days prior = 0
        trainingData1['final_bookings(days_prior=0)'] = trainingData1.groupby(['departure_date'])['cum_bookings'].transform(max)

        # calculate booking ratio : booking ratio = (cumulative bookings / final bookings)
        trainingData1['booking_ratio'] = trainingData1['cum_bookings'] / trainingData1['final_bookings(days_prior=0)']

        # create another data frame "historical_remaining_day_Ratioavg" , from training data, that contains historical remaining day ratio,
        # which further will be used to calculate forecasting value for validation data
        # historical remaining day ratioAvg = average(sum(booking ratio) when days prior = 0 / 1 / 2....and weekday = Monday / Tuesday / .....)
        historical_remaining_day_Ratioavg = trainingData1.groupby(['days_prior', 'weekday'])['booking_ratio'].mean().rename('historical_avg_ratio').reset_index()

        # convert 'booking date' to pandas 'date time' format
        self.validationData['booking_date1'] = pd.to_datetime(self.validationData['booking_date'])

        # assign weekday to each booking date
        # 0 : Monday , 1 : Tuesday, 2 : Wednesday, 3 : Thursday, 4 : Friday, 5 : Saturday, 6 : Sunday
        self.validationData['weekday'] = self.validationData['booking_date1'].dt.dayofweek

        # left join "validationData" and "historical_remaining_day_RatioAvg" on "days_prior" and "weekday" column
        validationData1 = self.validationData.merge(historical_remaining_day_Ratioavg,left_on=['days_prior', 'weekday'],right_on=['days_prior', 'weekday'], how='left')

        # remove all records when days prior = 0
        validationData1 = validationData1.drop(validationData1[validationData1['days_prior'] == 0].index)

        # calculate multiplicative forecast : (multiplicative forecast = cumulative bookings / historical average ratio average)
        validationData1['MultiplicativeForecast'] = validationData1['cum_bookings'] / validationData1['historical_avg_ratio']

        # calculate error term for additive model: (error term = final demand - additive forecast)
        validationData1['Error_Term'] = abs(validationData1['final_demand'] - validationData1['MultiplicativeForecast'])

        # Total sum the error term
        sum_errorTerm = validationData1['Error_Term'].sum()

        # calculate error term for naive model: (error term = final demand - naive forecast)
        validationData1['Denominator'] = abs(validationData1['final_demand'] - validationData1['naive_forecast'])

        # sum_errorTerm = summation of all the error terms for the naive model
        sum_Denominator = validationData1['Denominator'].sum()

        # create output data frame
        forecasts = validationData1[['departure_date', 'booking_date', 'MultiplicativeForecast']]

        # calculate MASE value
        MASE = (sum_errorTerm / sum_Denominator)

        # return output dataframe consisting of departure date , booking date and forecast values from the model
        # return MASE value
        return [forecasts, MASE]

    def weighted_average(self):
        # to calculate weights from the error of additive forecast , assign the output of weekly additive forecast to df data frame.
        # here training data frame is not required since the error values in df data frame are calculated using training data frame in "self.additiveForecast_daysPrior_Weekly()" method.
        df = self.additiveForecast_daysPrior_Weekly()[0]
    
        # remove all records when days prior = 0
        # validationData1 = validationData1.drop(validationData1[validationData1['days_prior'] == 0].index)
        
        # calculate additive forecast : (additive forecast = cumulative bookings + historical average remaining)
        validationData1 = self.validationData.merge(df, left_on=['departure_date', 'booking_date'],right_on=['departure_date', 'booking_date'], how='left')

        # assigned weights to the validation data on the basis of error term
        # higher weights are assigned to lower error terms 
        # weights are assigned such that sum of all the weights = 1 
        validationData1.loc[(validationData1['Error_Term'] >= 0) & (validationData1['Error_Term'] <= 5), 'code'] = 0.4
        validationData1.loc[(validationData1['Error_Term'] > 5) & (validationData1['Error_Term'] <= 10), 'code'] = 0.3
        validationData1.loc[(validationData1['Error_Term'] > 10) & (validationData1['Error_Term'] <= 20), 'code'] = 0.1
        validationData1.loc[(validationData1['Error_Term'] > 20) & (validationData1['Error_Term'] <= 30), 'code'] = 0.08
        validationData1.loc[(validationData1['Error_Term'] > 30) & (validationData1['Error_Term'] <= 40), 'code'] = 0.06
        validationData1.loc[(validationData1['Error_Term'] > 40) & (validationData1['Error_Term'] <= 50), 'code'] = 0.04
        validationData1.loc[validationData1['Error_Term'] > 50, 'code'] = 0.02
        
        # remove all records when days prior = 0
        validationData1 = validationData1.drop(validationData1[validationData1['days_prior'] == 0].index)
        
        # calculate additive forecast : (additive forecast = cumulative bookings + historical average remaining)
        validationData1['forecastValue'] = validationData1['cum_bookings'] + validationData1['historical_avg_remaining']        
        
        # calculate error term for weighted model: (error term = (final demand - additive forecast) * weights)
        validationData1['Error_Term'] = abs((validationData1['final_demand'] - validationData1['forecastValue']) * validationData1['code'])
        
        # Total sum the error term
        sum_errorTerm = validationData1['Error_Term'].sum()
        
        # calculate error term for naive model: (error term = final demand - naive forecast)
        validationData1['Denominator'] = abs(validationData1['final_demand'] - validationData1['naive_forecast'])
        
        # sum_errorTerm = summation of all the error terms for the naive model
        sum_Denominator = validationData1['Denominator'].sum()
        
        # create output data frame
        forecasts = validationData1[['departure_date', 'booking_date',  'forecastValue']]
        
        # calculate MASE value
        MASE = (sum_errorTerm / sum_Denominator)
        
        # return output dataframe consisting of departure date , booking date and forecast values from the model
        # return MASE value
        return [forecasts, MASE]
    

def main():
    forecast = forecastingMethods()
    ans = (forecast.choose_Forecasting_Method())
    if ans is not None:
        print("Forecasts data frame : ")
        print(ans[0])
        print("MASE value is : " + str(ans[1]))
    else:
        print('Error : Enter from the given options.')

main()