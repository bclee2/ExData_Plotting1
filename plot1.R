url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="./power.zip", method = "curl")
unzip("power.zip")
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
power[,1]=as.Date(power[,1],format = "%d/%m/%Y")
library(dplyr)
power2=filter(power,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

png("plot1.png")

hist(power2[,3],xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")

dev.off()