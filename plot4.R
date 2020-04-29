setwd("H:/Joe/Data Science")
##
rawFile <- "household_power_consumption.txt"
##
##
plotData <- read.table(rawFile, header=T, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
##

## Generate Plot 4 as a 480x480 PNG
## user can comment out the png command and dev.off() to have the plot output to screen
png("plot4.png", width=480, height=480)
## set labels for the plot
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
## we want a 2 x 2 grid plot view
par(mfrow=c(2,2))
## now plot each plot in turn
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(finalData$SetTime, finalData$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalData$SetTime, finalData$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off() 