#import.packages("lubridate")

#setting lubridate library
library(lubridate)

#assign file name to variable dataFile
dataFile <- "household_power_consumption.txt"

#create dataFrame with required data subset
dataFrame <- subset(read.table(dataFile, header = TRUE, sep = ';', na.strings = '?'), dmy(Date) == dmy("01/02/2007") | dmy(Date) == dmy("02/02/2007"))

#create datetime
datetime <- strptime(paste(dataFrame$Date, dataFrame$Time), format = "%d/%m/%Y %H:%M:%S")

#graph area setting
par(mfrow = c(1, 1), mar = c(2, 4, 2, 1))

#draw graph with out data
plot(datetime, dataFrame$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")

#add line graph for sub metering 1
points(datetime, dataFrame$Sub_metering_1, type = "l")

#add line graph for sub metering 2
points(datetime, dataFrame$Sub_metering_2, type = "l", col = "red")

#add line graph for sub metering 3
points(datetime, dataFrame$Sub_metering_3, type = "l", col = "blue")

#add legend to the graph
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1,  x.intersp = 7, y.intersp = 1.5, adj = 0.5)

#create png file
dev.copy(png, "plot3.png")

#close the device
dev.off()

