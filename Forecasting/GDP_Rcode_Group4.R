# loading packages
library(forecast)
library(ggplot2)
library(fpp2)
library(readxl)
library(xts)
library(olsrr)
library(seasonal)


# load data
gdp_quarter <- read_excel("gdp_Quarterly.xls", sheet = 2)

# transform data to time series 
gdp_quarter_col <- ts(as.numeric(unlist(gdp_quarter[,2])),frequency = 4, start = c(1947,1))


# time Plot
autoplot(gdp_quarter_col) +
  ggtitle("Time Plot of US GDP") +
  xlab("Year") +
  ylab("Billion $")

# Plot "gdp_quarter" and the forecasting based on average method, Naive method, seasonal naive method, 
# and drift method with 5 period of forecasting.
autoplot(gdp_quarter_col) +
  autolayer(meanf(gdp_quarter_col, h =5), series = "Mean", PI = FALSE) +
  autolayer(naive(gdp_quarter_col, h=5),
            series="Naive", PI=FALSE) +
  autolayer(snaive(gdp_quarter_col, h=5),
            series="Seasonal naive", PI=FALSE) +
  ggtitle("Forecasts for quarterly US GDP") +
  xlab("Year") + ylab("Billion $") +
  guides(colour=guide_legend(title="Forecast"))

# autocorrelation measures the linear relationship between lagged values of a time series.
ggAcf(gdp_quarter_col)

# use the Box-Cox transformation to stabilize the variance.
lambda <- (BoxCox.lambda(gdp_quarter_col))
autoplot(BoxCox(gdp_quarter_col,lambda)) +
  ggtitle("Time Plot of US GDP") +
  xlab("Year") +
  ylab("Billion $")


# using the lambda parameter found above, plot the back-transformation seasonal naive 
# forecasting of "gdp_quarter"
autoplot(snaive(gdp_quarter_col, lambda=lambda))
autoplot(naive(gdp_quarter_col, lambda = lambda))


# Split the data into two parts: training data from Jan 1947 to Oct 2009 and 
# testing data from Jan 2010 to Oct 2018.
training <- window(gdp_quarter_col, start=1947, end=c(2009,10)) 
testing <- window(gdp_quarter_col, start=2010) 

# Calculate forecasts using average method, naive method, and drift method applied to transformed 
# training data.
avgforecast <- meanf(training) 
naiveforecast <- rwf(training) 
driftforecast <- rwf(training, drift = TRUE) 

# Plot "training" and the forecasting based on average method, Naive method, 
# and drift method.
autoplot(training) +
  autolayer(testing, series = "Test Dataset") +
  autolayer(meanf(training, h=40),
            series="Mean", PI=FALSE) +
  autolayer(rwf(training, h=40),
            series="Naïve", PI=FALSE) +
  autolayer(rwf(training, drift=TRUE, h=40),
            series="Drift", PI=FALSE) +
  ggtitle("US GDP till 2009 and its forecast") +
  xlab("Year") + ylab("Billion $") +
  guides(colour=guide_legend(title="Forecast"))


# Compare the accuracy of all simple forecasts. In term of RMSE which method is more accurate?
accuracy(avgforecast, testing) 
accuracy(naiveforecast, testing) 
accuracy(driftforecast, testing)

# Using time series "gdp_quarter", fit a linear trend, an exponential trend, a cubic spline trend (using splinef() function), and  a piecewise trend to the data.
# Plot them in a single plot. Which one do you find more accurate? Use time horizon h=5.
h <- 5
fit.lin <- tslm(gdp_quarter_col ~ trend)
fcasts.lin <- forecast(fit.lin, h = h)
fit.exp <- tslm(gdp_quarter_col~trend, lambda = 0)
fcasts.exp <- forecast(fit.exp, h = h)
t <- time(gdp_quarter_col)
t.break1 <- 1975 
t.break2 <- 2000
tb1 <- ts(pmax(0, t-t.break1), start = 1947)
tb2 <- ts(pmax(0, t-t.break2), start = 1947)
fit.pw <- tslm(gdp_quarter_col~ t + tb1 + tb2)
t.new <- t[length(t)] + seq(h)
tb1.new <- tb1[length(tb1)] + seq(h) 
tb2.new <- tb2[length(tb2)] + seq(h) 
newdata <- cbind(t=t.new, tb1=tb1.new, tb2=tb2.new) %>% as.data.frame()
fcasts.pw <- forecast(fit.pw, newdata = newdata) 
fit.spline <- tslm(gdp_quarter_col ~ t + I(t^2) + I(t^3) + I(tb1^3) + I(tb2^3)) 
fcasts.spl <- forecast(fit.spline, newdata = newdata) 
autoplot(gdp_quarter_col) + 
  autolayer(fitted(fit.lin), series = "Linear") + 
  autolayer(fitted(fit.exp), series = "Exponential") + 
  autolayer(fitted(fit.pw), series = "Piecewise") + 
  autolayer(fitted(fit.spline), series = "Cubic Spline") + 
  autolayer(fcasts.pw, series="Piecewise") + 
  autolayer(fcasts.lin, series="Linear", PI=FALSE) + 
  autolayer(fcasts.exp, series="Exponential", PI=FALSE) + 
  autolayer(fcasts.spl, series="Cubic Spline", PI=FALSE) + 
  xlab("Year") + 
  ylab("Billion $") + 
  ggtitle("GDP of US") + 
  guides(colour = guide_legend(title = " "))



# STL decomposition of US GDP 
fit <- stl(gdp_quarter_col, s.window="periodic", robust=TRUE)
autoplot(fit) + ggtitle("STL decomposition of US gdp")

fit %>% seasadj() %>% naive() %>%
  autoplot() + ylab("GDP") +
  ggtitle("Naive forecasts of seasonally adjusted data")

fit %>% forecast(method="naive") %>%
  autoplot() + ylab("New orders index")  +
  ggtitle("Naive forecasts of data with seasonality") # with seasonality

# forecasting results
fc_stl <- stlf(training, s.window="periodic", method='naive')
accuracy(fc_stl, testing)


# Exponential Smoothing Methods
# forecasting with holt's linear trend method
fc_linear <- holt(training)

fc_damped <- holt(training, damped = TRUE)

# Holt_Winter
fc_damped_add <- hw(training, damped = TRUE, seasonal = "additive")
fc_add <- hw(training, damped = FALSE, seasonal = "additive")
fc_damped_mul <- hw(training, damped = TRUE, seasonal = "multiplicative")
fc_mul <- hw(training, damped = FALSE, seasonal = "multiplicative")

# comparing all exponential smoothing methods
accuracy(fc_linear, testing)
accuracy(fc_damped, testing)
accuracy(fc_damped_add, testing)
accuracy(fc_add, testing)
accuracy(fc_damped_mul, testing)
accuracy(fc_mul, testing)

# Holt linear has the best forecast
# ARIMA
fit_arima <- auto.arima(gdp_quarter_col, seasonal=FALSE) # use training dataset will generate less RMSE
summary(fit_arima)

fit_arima %>% forecast() %>% autoplot(include=80) + xlab("Year") + ylab("Billion $")

checkresiduals(fit_arima)
autoplot(forecast(fit_arima))
autoplot(fit_arima)
