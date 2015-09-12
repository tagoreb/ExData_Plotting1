#import.packages("lubridate")

#setting lubridate library
library(lubridate)

#assign file name to variable dataFile
dataFile <- "household_power_consumption.txt"

#create dataFrame with required data subset
dataFrame <- subset(read.table(dataFile, header = TRUE, sep = ';', na.strings = '?'), dmy(Date) == dmy("01/02/2007") | dmy(Date) == dmy("02/02/2007"))

#draw the histogram
hist(dataFrame$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#create png file
dev.copy(png, "plot1.png")

#close the device
dev.off()
