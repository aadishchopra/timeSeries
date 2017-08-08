install.packages("forecast")
library(forecast) 
summary(inf_data)
dUKCPI<-diff(inf_data$UKCPI)
inf_data$UKCPI <- ts(inf_data$UKCPI, start=c(1988, 1), end=c(2013, 4), frequency=4)
dUKCPI<-diff(inf_data$UKCPI,4)
plot(dUKCPI)

#Estimating AR Model
fit_diff_ar<-Arima(dUKCPI,order=c(4,0,0))
summary(fit_diff_ar)

#forecasting
fit_diff_arf<-forecast(fit_diff_ar,h=12)
plot(fit_diff_arf,include=20)
 