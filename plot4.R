#import.packages("lubridate")

#setting lubridate library
library(lubridate)

#assign file name to variable dataFile
dataFile <- "household_power_consumption.txt"

#create dataFrame with required data subset
dataFrame <- subset(read.table(dataFile, header = TRUE, sep = ';', na.strings = '?'), dmy(Date) == dmy("01/02/2007") | dmy(Date) == dmy("02/02/2007"))

#create datetime
datetime <- strptime(paste(dataFrame$Date, dataFrame$Time), format = "%d/%m/%Y %H:%M:%S")

#graph area setting for 2 rows 2 columns
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

#draw line graph 1
plot(datetime, dataFrame$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#draw line graph 2
plot(datetime, dataFrame$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#draw line graph 3
plot(datetime, dataFrame$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(datetime, dataFrame$Sub_metering_1, type = "l")
points(datetime, dataFrame$Sub_metering_2, type = "l", col = "red")
points(datetime, dataFrame$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n",  x.intersp = 4, y.intersp = 1.25, adj = 0.35)

#draw line graph 4
with(dataFrame, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime"))

#create png file
dev.copy(png, "plot4.png")

#close the device
dev.off()

