## Opening the png device and creating "plot3.png"
png("plot3.png")

## Changing left margin specification to leave more space for the y-axis label
par(mar = c(5,5,4,2) + 0.1)

## Reading the data from the dataset
household_power <- read.table("household_power_consumption.txt",sep=';',stringsAsFactors = FALSE, header=TRUE)

## Subsetting only entries from 2007-02-01 and 2007-02-02.
dataset <- household_power[household_power$Date == "1/2/2007"| household_power$Date == "2/2/2007",]

## Converting the character dates to Date, and appending those with the corresponding time entries
date_entries <- paste(as.Date(strptime(dataset$Date,format = '%d/%m/%Y')),dataset$Time)

## Saving the three sub metering readings under variables subvar1, subvar2 and subvar3
sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
sub_metering_3 <- as.numeric(dataset$Sub_metering_3)

## Creating a plot of the three data entries (the sub meterings readings)
plot(as.POSIXct(date_entries), sub_metering_1,
     main = '', ylab = 'Energy sub metering', xlab = '', type='l')
lines(as.POSIXct(date_entries), sub_metering_2, type='l', col = 'red')
lines(as.POSIXct(date_entries), sub_metering_3, type='l', col = 'blue')

## Creating a legend of the three sub metering readings on the topright corner of the plot 
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd = c(1,1,1), col = c('black','red','blue'))

## Closing the device 
dev.off()
