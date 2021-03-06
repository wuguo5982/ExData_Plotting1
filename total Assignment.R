
## Download raw data sets from links.

if(!file.exists("~/data")){dir.create("~/data")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./data/household_power_consumption.zip", mode="wb")
power_consumption <- unzip(zipfile = "./data/household_power_consumption.zip")
power_consumption <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
date_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- paste(date_consumption$Date, date_consumption$Time)
newdatetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S") 
finaldate <- cbind(newdatetime, date_consumption)

#Figure 1
hist(date_consumption$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Figure 2
 
plot(finaldate$Global_active_power ~ finaldate$newdatetime, col="black", type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

#Figure 3
plot(finaldate$Sub_metering_1 ~ finaldate$newdatetime, xlab="", ylab = "Energy sub metering", type = "l", col="black")
lines(finaldate$Sub_metering_2 ~ finaldate$newdatetime, col="red")
lines(finaldate$Sub_metering_3 ~ finaldate$newdatetime, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, lwd=c(1,1,1))

#Figure 4
par(mfrow=c(2,2), mar=c(4,4,1,1), oma = c(0,0,2,0))
plot(finaldate$Global_active_power ~ finaldate$newdatetime, type="l", xlab="", ylab="Global Active Power")
plot(finaldate$Voltage ~ finaldate$newdatetime, type="l", xlab="datetime", ylab="Voltage")

plot(finaldate$Sub_metering_1 ~ finaldate$newdatetime, xlab="", ylab = "Energy sub metering", type = "l", col="black")
lines(finaldate$Sub_metering_2 ~ finaldate$newdatetime, col="red", type="l")
lines(finaldate$Sub_metering_3 ~ finaldate$newdatetime, col="blue", type="l")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, bty = "n")

plot(finaldate$Global_reactive_power ~ finaldate$newdatetime, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

