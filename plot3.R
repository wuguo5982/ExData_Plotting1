## Generate plot image (Figure 3)

plot(finaldate$Sub_metering_1 ~ finaldate$newdatetime, xlab="", ylab = "Energy sub metering", type = "l", col="black")
lines(finaldate$Sub_metering_2 ~ finaldate$newdatetime, col="red")
lines(finaldate$Sub_metering_3 ~ finaldate$newdatetime, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, lwd=c(1,1,1))
