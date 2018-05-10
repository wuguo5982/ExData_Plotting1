## Generate plot image (Figure 4)

par(mfrow=c(2,2), mar=c(4,4,1,1), oma = c(0,0,2,0))
plot(finaldate$Global_active_power ~ finaldate$newdatetime, type="l", xlab="", ylab="Global Active Power")
plot(finaldate$Voltage ~ finaldate$newdatetime, type="l", xlab="datetime", ylab="Voltage")

plot(finaldate$Sub_metering_1 ~ finaldate$newdatetime, xlab="", ylab = "Energy sub metering", type = "l", col="black")
lines(finaldate$Sub_metering_2 ~ finaldate$newdatetime, col="red", type="l")
lines(finaldate$Sub_metering_3 ~ finaldate$newdatetime, col="blue", type="l")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, bty = "n")

plot(finaldate$Global_reactive_power ~ finaldate$newdatetime, type="l", xlab="datetime", ylab="Global_reactive_power")

## Save images and files as .png and .R
## dev.off()
dev.off()