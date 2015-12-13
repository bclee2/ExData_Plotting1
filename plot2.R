url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="./power.zip", method = "curl")
unzip("power.zip")
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
power2=mutate(power,datetime=paste(Date,Time))
power2[,10]=as.POSIXct(strptime(power2$datetime, "%d/%m/%Y %H:%M:%S"))
power2[,1]=as.Date(power2[,1],format = "%d/%m/%Y")
library(dplyr)
power3=filter(power2,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

png(filename = "plot2.png")

plot(power3$datetime,power3$Global_active_power, type = "l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()