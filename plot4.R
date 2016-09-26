
## Assigment to examine how household energy usage varies over a 2-day period in February, 2007
SourceFile <- "./household_power_consumption.txt"
SourceData <- read.table(SourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## only get data from the dates 2007-02-01 and 2007-02-02 from original data sets
FilteredData <- SourceData[SourceData$Date %in% c("1/2/2007","2/2/2007") ,]

## convert required data for graphics in numeric
GlobalActivePower_Dataset <- as.numeric(FilteredData$Global_active_power)
Sub_metering_1 <- as.numeric(FilteredData$Sub_metering_1)
Sub_metering_2 <- as.numeric(FilteredData$Sub_metering_2)
Sub_metering_3 <- as.numeric(FilteredData$Sub_metering_3)
GlobalReactivePower_Dataset <- as.numeric(FilteredData$Global_reactive_power)
Voltage_Dataset <- as.numeric(FilteredData$Voltage)

#get date and time concatenated and convert them
SourceDateTime <- paste(FilteredData$Date, FilteredData$Time, sep=" ")
DatetimeData <- strptime(SourceDateTime, "%d/%m/%Y %H:%M:%S") 

## draw graphics in png format
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#plot graph datetime vs Global Active Power
plot(DatetimeData, GlobalActivePower_Dataset, type="l", xlab="", ylab="Global Active Power")

#plot graph datetime vs voltage
plot(DatetimeData, Voltage_Dataset, type="l", xlab="datetime", ylab="Voltage")

#plot graph datetime vs sub metering
plot(DatetimeData, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(DatetimeData, Sub_metering_1, type="l", col="red")
lines(DatetimeData, Sub_metering_1, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), bty="o")

#plot graph datetime vs Global Reactive Power
plot(DatetimeData, GlobalReactivePower_Dataset, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
