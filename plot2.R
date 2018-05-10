
## Download raw data sets from links, upzip compressed data.

if(!file.exists("~/data")){dir.create("~/data")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./data/household_power_consumption.zip", mode="wb")
power_consumption <- unzip(zipfile = "./data/household_power_consumption.zip")

## Read data into R and extract data based on date /time.
## Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 
## The task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

power_consumption <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
date_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- paste(date_consumption$Date, date_consumption$Time)
newdatetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S") 
finaldate <- cbind(newdatetime, date_consumption)

## Generate plot image (Figure 2)

plot(finaldate$Global_active_power ~ finaldate$newdatetime, col="black", type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
