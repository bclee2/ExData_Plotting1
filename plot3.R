url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="./power.zip", method = "curl")
unzip("power.zip")
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
power2=mutate(power,datetime=paste(Date,Time))
power2[,10]=as.POSIXct(strptime(power2$datetime, "%d/%m/%Y %H:%M:%S"))
power2[,1]=as.Date(power2[,1],format = "%d/%m/%Y")
library(dplyr)
power3=filter(power2,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

png(filename = "plot3.png")

plot(power3$datetime,power3$Sub_metering_1, type = "l",xlab="",ylab="Energy sub metering")
lines(power3$datetime,power3$Sub_metering_2, type = "l",col="red")
lines(power3$datetime,power3$Sub_metering_3, type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.off()