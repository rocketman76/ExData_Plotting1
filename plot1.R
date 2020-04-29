setwd("H:/Joe/Data Science")
##
## Note, it is assumed the user firstly downloads and extracts the relevant file for 
## this project

##step 1, create variables to hold the data

rawFile <- "household_power_consumption.txt"
##
##
plotData <- read.table(rawFile, header=T, sep=";", na.strings="?")

## we are only interested in two days
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

##
## Generate Plot 1 as a 480x480 PNG
## user can comment out the png command and dev.off() to have the plot output to screen
png("plot1.png", width=480, height=480)
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()  
