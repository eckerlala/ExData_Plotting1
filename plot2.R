library(lubridate)

## parameter-setting for file input
filename <- "C:/MATH-UP/R_Studies/Coursera/Explanatory Data Analysis/household_power_consumption.txt"

## parameter-setting for PNG-file output
imagefile <- "C:/MATH-UP/R_Studies/Coursera/Explanatory Data Analysis/plot2.png"

## data will be imported here and subset will be created
data<-read.csv(filename,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".",na.strings="?")
data$Date<-as.Date(dmy(data$Date))
data4plot<-subset(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
data4plot$Timestamp <-as.POSIXct(paste(data4plot$Date, data4plot$Time), format="%Y-%m-%d %H:%M:%S")

### plotting and output to file plot2.png
png(filename=imagefile,width=480,height=480)
plot(data4plot$Timestamp,data4plot$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()