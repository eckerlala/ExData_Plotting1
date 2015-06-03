library(lubridate)
## parameter-setting for file input
filename <- "C:/MATH-UP/R_Studies/Coursera/Explanatory Data Analysis/household_power_consumption.txt"

## parameter-setting for PNG-file output
imagefile <- "C:/MATH-UP/R_Studies/Coursera/Explanatory Data Analysis/plot4.png"

## data will be imported here and subset will be created
data<-read.csv(filename,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".",na.strings="?")
data$Date<-as.Date(dmy(data$Date))
data4plot<-subset(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
data4plot$Timestamp <-as.POSIXct(paste(data4plot$Date, data4plot$Time), format="%Y-%m-%d %H:%M:%S")

### plotting and output to file plot4.png
png(filename=imagefile,width=480,height=480)
par(mfrow=c(2,2))
#plot1 - upperleft
plot(data4plot$Timestamp,data4plot$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")

#plot2 - upperright
plot(data4plot$Timestamp,data4plot$Voltage,type="l",main="",xlab="datetime",ylab="Voltage",col="black")

#plot3 - bottomleft
plot(data4plot$Timestamp,data4plot$Sub_metering_1,type="l",main="",xlab="",ylab="",ylim=range(data4plot[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]),col="black")
par(new=TRUE)
plot(data4plot$Timestamp,data4plot$Sub_metering_2,type="l",main="",xlab="",ylab="",ylim=range(data4plot[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]),col="red")
par(new=TRUE)
plot(data4plot$Timestamp,data4plot$Sub_metering_3,type="l",main="",xlab="",ylab="",ylim=range(data4plot[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]),col="blue")
title(main="",xlab="",ylab="Energy sub metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

#plot4 - bottomright
plot(data4plot$Timestamp,data4plot$Global_reactive_power,type="l",main="",xlab="datetime",ylab="Global_reactive_power",col="black")
dev.off()
