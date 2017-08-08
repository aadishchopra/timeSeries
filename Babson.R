attach(Book1)
library(forecast)
`Incoming Examinations`<-ts(Book1$`Incoming Examinations`,start = c(2006,1),end=c(2013,12),frequency=12)
plot(`Incoming Examinations`)
View(`Incoming Examinations`)
library(tseries)
adf.test(`Incoming Examinations`,alternative = "stationary",k=0)
# results of this test show that this is a stationary data

# now doing ACF and PACF test

acf(`Incoming Examinations`)
# this shows that lags are important and having a significant effect
pacf(`Incoming Examinations`)
# pacf is similar to that for a stationary data

Arima(`Incoming Examinations`,order = c(1,0,0))
auto.arima(`Incoming Examinations`,allowdrift = FALSE)

Arima(`Incoming Examinations`,order = c(1,0,1))
Arima(`Incoming Examinations`,order=c(1,2,1))
Arima(`Incoming Examinations`,order=c(1,1,1))
fit_ar<-Arima(`Incoming Examinations`,order = c(1,2,1))

#forecasting
fit_arf<-forecast(fit_ar,h=6)
plot.forecast(fit_arf,include=20,PI = TRUE)
fit_arf$residuals
fit_arf$fitted
fit_ar$residuals


