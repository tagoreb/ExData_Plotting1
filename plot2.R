#import.packages("lubridate")

#setting lubridate library
library(lubridate)

#assign file name to variable dataFile
dataFile <- "household_power_consumption.txt"

#create dataFrame with required data subset
dataFrame <- subset(read.table(dataFile, header = TRUE, sep = ';', na.strings = '?'), dmy(Date) == dmy("01/02/2007") | dmy(Date) == dmy("02/02/2007"))

#create datetime
datetime <- strptime(paste(dataFrame$Date, dataFrame$Time), format = "%d/%m/%Y %H:%M:%S")

#draw the line chart
with(dataFrame, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") )

#create png file
dev.copy(png, "plot2.png")

#close the device
dev.off()