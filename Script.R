getwd()
#Sample code
library(readxl)
library("lubridate")
getwd()
cars<- read.csv("USA_cars_datasets.csv")
View(cars)
str(cars)
library(dplyr)
library(plyr)
class(cars$Date)
cars$Date<- as.character(cars$Date)
class(cars$Date)
cars<- rename(cars, c("X.1"= "Name"))
cars_Date <- strptime(cars$Date, format ="%m/%d/%Y %H:%M", tz="")
cars_Date
class(cars_Date)
#cars$Date <- as.POSIXct(cars$Date, tz="", optional=FALSE)
#cars$Date<- as.Date(cars$Date, format = c("%m/%d/%YT%H:%M"))
class(cars$Date)
by_month <- month(cars_Date, label=TRUE)
by_month
cars<- cbind(cars, month_col = by_month)
class(cars$month_col)
by_time1<- format(cars_Date, format= "%H")
by_time1<- as.character(by_time1)
class(by_time1)
by_time2<- format(cars_Date, format = "%M")
by_time2<- as.character(by_time2)
class(by_time2)
cars<- cbind(cars, time1_col = by_time1)
cars<- cbind(cars, time2_col = by_time2)
by_time <- paste0(cars$time1_col, cars$time2_col)
cars<- cbind(cars, time_col = by_time)
cars$time_col<- as.numeric(cars$time_col)
class(cars$time_col)
y<-0600
class(y)
#cars<- cbind(cars, time_col = by_time)
#cars$by_time <-as.hours(by_time)
#for (times in by_time){
#if (times>6 & times<=12){print("Morning")}
#else if (times >12 & times<= 17){print("Afternoon")}
#else if (times >17 & times<= 20){print("Evening")}
#else print("Night")
}

by_time2 <- function(){
  if (by_time>6 && by_time<=12){print("Morning")
  } else {print("Night")}
}
#by_time2()
#class(by_time)
#else if (times >12 && times<= 17){print("Afternoon")}
#else if (times >17 & times<= 20){print("Evening")}

x<-by_time
cars$time <- function (){for (num in x){
  if (num>6& num<=12){
    time <-print("Morning")} 
  else if (num>12 & num<= 17){
    time<-print("Afternoon")} 
  else if (num >17 & num<= 20){
    time<- print("Evening")}
  else {
    time<- print("Night")}
}
  return(time)}
x_time()
class(time)
cars$time <- NA
nrow(cars)
for (times in 1:nrow(cars)){
  if (cars$time_col1[times]>600 & cars$time_col1[times]<=1200){
    cars$time[times] <-"Morning"} 
  else if (cars$time_col1[times]>1200 & cars$time_col1[times]<= 1700){
    cars$time[times]<- "Afternoon"} 
  else if (cars$time_col1[times] >1700 & cars$time_col1[times]<= 2000){
    cars$time[times]<-"Evening"}
  else {
    cars$time[times]<- "Night"}
}
class(cars$time_col)

class(by_time)

cars <- cars %>% mutate(time_col1 = as.numeric(time_col))
View(cars$time_col1)

sort(mtcars, decreasing = FALSE)
data(mtcars)
df1 <- mtcars
View(mtcars)
sort(df1$mpg)
df2 <- airquality
sort(airquality$Ozone)