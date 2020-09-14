## Opening the png device and creating "plot1.png"
png("plot1.png")

## Changing left margin specification to leave more space for the y-axis label
par(mar = c(5,5,4,2) + 0.1)

## Reading the data from the dataset
household_power <- read.table("household_power_consumption.txt",sep=';',stringsAsFactors = FALSE, header=TRUE)

## Subsetting only entries from 2007-02-01 and 2007-02-02.
dataset <- household_power[household_power$Date == "1/2/2007"| household_power$Date == "2/2/2007",]

## Obtaining the Global_active_power column from the subset dataset and creating a histogram
hist(as.numeric(dataset$Global_active_power),col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Closing the device 
dev.off()
