#prepare data for exploratory analysis
library(dplyr)
data<-read.table('~/R/household_power_consumption.txt',header = TRUE,sep=';',stringsAsFactors = FALSE)#read table
data$datetime<-paste(data$Date,data$Time)
data<-filter(data,Date %in% c('1/2/2007','2/2/2007')) #filter dates of interest
newdata<-data[,c(10,3,4,5,6,7,8,9)] #rearrange coloumn orders
newdata1<-transform(newdata,datetime=strptime(newdata$datetime,'%d/%m/%Y %H:%M:%S')) #convert to date time format
newdata1[2:8]=as.numeric(unlist(newdata1[2:8])) #convert variables to numeric data
newdata1$weekday<-weekdays.POSIXt(newdata1$datetime,abbreviate = TRUE) #confirm the dates are Thursdays and Fridays

#plot1
quartz()
hist(newdata1$Global_active_power,col = 'red', main ='Global Active Power',xlab='Global Active Power (kilowatts)',ylim=c(0,1200))
dev.copy(png,'~/R/plot1.png',height=480,width=480)
dev.off()