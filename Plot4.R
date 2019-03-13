#plot4 (see plot1.R for data preparation steps)
quartz()
par(mar=c(8,6,2,2),oma=c(2,1,1,1),bg='white',mfrow=c(2,2),las=3) #set margins/outermargins,bg color and layout
# first plot
plot(newdata1$datetime,newdata1$Global_active_power,type='l',ylab='Global Active Power',xlab='')
# second plot
plot(newdata1$datetime,newdata1$Voltage,type='l',xlab = 'datetime',ylab='Voltage')
# third plot
plot(newdata1$datetime,newdata1$Sub_metering_1,type='l',ann=FALSE)
par(new=T)
plot(newdata1$datetime,newdata1$Sub_metering_2,type='l',col='red',ylim=c(0,40),ann=FALSE,axes = FALSE)
par(new=T)
plot(newdata1$datetime,newdata1$Sub_metering_3,type='l',col='blue' ,ylim=c(0,40),ann=FALSE,axes = FALSE)
title(ylab = 'Energy sub metering')
legend('topright',cex=0.4,y.intersp =1,text.width = strwidth('Sub_metering_1')/2,lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
# fourth plot
plot(newdata1$datetime,newdata1$Global_reactive_power,type='l',yaxt='n',ylab='Global Reactive Power',xlab='datetime') #suppress y axis ticks
axis(2,at=seq(0,0.5,by=0.1),cex.axis=0.7) #add in y axis and make ticks smaller
dev.copy(png,'~/R/plot4.png',width=480,height=480)
dev.off()
