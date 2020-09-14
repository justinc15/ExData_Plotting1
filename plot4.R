## Opening the png device and creating "plot4.png"
png("plot4.png")

## Initializing the plotting grid to have 2 rows and 2 columns
par(mfrow = c(2,2), mar = c(5,5,4,2) + 0.1)

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

## Saving voltage, active power and reactive power readings under different variables
active_power <- as.numeric(dataset$Global_active_power)
voltage <- as.numeric(dataset$Voltage)
reactive_power <- as.numeric(dataset$Global_reactive_power)

## Creating multiple plot of datetime vs other data entries (the active power readings, 
## voltage readings, energy sub-readings and reactive power readings)
with(dataset,list(plot(as.POSIXct(date_entries), active_power, main = '', 
                       ylab = 'Global Active Power', xlab = '', type='l'),
                  plot(as.POSIXct(date_entries), voltage, main = '', 
                       ylab = 'Voltage', xlab = 'datetime', type='l'),
                  plot(as.POSIXct(date_entries), sub_metering_1,
                       main = '', ylab = 'Energy sub metering', xlab = '', type='l'),
                  lines(as.POSIXct(date_entries), sub_metering_2, type='l', col = 'red'),
                  lines(as.POSIXct(date_entries), sub_metering_3, type='l', col = 'blue'),
                  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                         lwd = c(1,1,1), col = c('black','red','blue')),
                  plot(as.POSIXct(date_entries), reactive_power, main = '', 
                       ylab = 'Global_reactive_power', xlab = 'datetime', type='l')))

## Closing the device 
dev.off()
