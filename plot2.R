
## Assigment to examine how household energy usage varies over a 2-day period in February, 2007
SourceFile <- "./household_power_consumption.txt"
SourceData <- read.table(SourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## only get data from the dates 2007-02-01 and 2007-02-02 from original data sets
FilteredData <- SourceData[SourceData$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower_Dataset <- as.numeric(FilteredData$Global_active_power)

#get date and time concatenated and convert them
SourceDateTime <- paste(FilteredData$Date, FilteredData$Time, sep=" ")
DatetimeData <- strptime(SourceDateTime, "%d/%m/%Y %H:%M:%S") 

### draw graphics plot in png with lines using type argument as l
png("plot2.png", width=480, height=480)
plot(DatetimeData, GlobalActivePower_Dataset, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

