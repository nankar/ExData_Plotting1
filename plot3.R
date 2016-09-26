
## Assigment to examine how household energy usage varies over a 2-day period in February, 2007
SourceFile <- "./household_power_consumption.txt"
SourceData <- read.table(SourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## only get data from the dates 2007-02-01 and 2007-02-02 from original data sets
FilteredData <- SourceData[SourceData$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower_Dataset <- as.numeric(FilteredData$Global_active_power)

#get date and time concatenated and convert them
SourceDateTime <- paste(FilteredData$Date, FilteredData$Time, sep=" ")
DatetimeData <- strptime(SourceDateTime, "%d/%m/%Y %H:%M:%S") 

## read data from sub metering 1,2,3 fields and convert them in numeric in order to draw graphics
Sub_metering_1 <- as.numeric(FilteredData$Sub_metering_1)
Sub_metering_2 <- as.numeric(FilteredData$Sub_metering_2)
Sub_metering_3 <- as.numeric(FilteredData$Sub_metering_3)

## draw graphics with x axis as converted datetime and y as metering 1,2,3 data with arguments type l for line and col for color to differentiate data
png("plot3.png", width=480, height=480)
plot(DatetimeData, Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
lines(DatetimeData, Sub_metering_2, type="l", col="red")
lines(DatetimeData, Sub_metering_3, type="l", col="blue")

## put legend details on top right
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()


