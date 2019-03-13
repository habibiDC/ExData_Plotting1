#plot3 (see plot1.R for data preparation steps)
quartz()
par(mar=c(8,6,4,2),bg='white') #set margins and backgorund color
plot(newdata1$datetime,newdata1$Sub_metering_1,type='l',ann=FALSE, ylim=c(0,40))
par(new=T) #tell R to build upon the previous plot
plot(newdata1$datetime,newdata1$Sub_metering_2,type='l',col='red',ylim=c(0,40),ann=FALSE,axes = FALSE) #set ylim the same as previous plot and remove annotation and axes so they don't overlap
par(new=T)
plot(newdata1$datetime,newdata1$Sub_metering_3,type='l',col='blue' ,ylim=c(0,40),ann=FALSE,axes = FALSE)
title(ylab = 'Energy sub metering')
legend('topright',cex=1.2,y.intersp =1,text.width = strwidth('Sub_metering_1')*1.5,lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))#adjust lengend width and spacing
dev.copy(png,'~/R/plot3.png',width=480,height=480)
dev.off()