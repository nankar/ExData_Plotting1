
## Assigment to examine how household energy usage varies over a 2-day period in February, 2007
SourceFile <- "./household_power_consumption.txt"
SourceData <- read.table(SourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE)

## only get data from the dates 2007-02-01 and 2007-02-02 from original data sets
FilteredData <- SourceData[SourceData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
GlobalActivePower_Dataset <- as.numeric(FilteredData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower_Dataset, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


