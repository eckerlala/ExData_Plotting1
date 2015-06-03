library(lubridate)

## parameter-setting for file input
filename <- "C:/MATH-UP/R_Studies/Coursera/Explanatory Data Analysis/household_power_consumption.txt"

## parameter-setting for PNG-file output
imagefile <- "C:/MATH-UP/R_Studies/Coursera/Explanatory Data Analysis/plot1.png"

## data will be imported here and subset will be created
data<-read.csv(filename,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".",na.strings="?")
data$Date<-as.Date(dmy(data$Date))
data4plot<-subset(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))


### plotting and output to file plot1.png
png(filename=imagefile,width=480,height=480)
hist(data4plot$Global_active_power,main="Global Acitve Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()