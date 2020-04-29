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

## Generate Plot 2 as a 480x480 PNG
## user can comment out the png command and dev.off() to have the plot output to screen
png("plot2.png", width=480, height=480)
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()  

