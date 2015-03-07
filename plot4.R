### T.K. Nguyen
### Coursera - Exploratory Data Analysis
### Course Project 1
### Plot 4

# Read in the data
setwd("~/Dropbox/coursera/Exploratory Data Analysis")
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Subset dates 2007-02-01 and 2007-02-02
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
data <- power[(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]

# Add in times to date
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

# Make plot
png (file="plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,3,1), oma=c(1,0,0,0))

#1
plot(data$datetime,data$Global_active_power, type="l",ylab="Global Active Power", xlab="")

#2
plot(data$datetime,data$Voltage, type="l",ylab="Voltage", xlab="datetime")

#3
plot (data$Sub_metering_1~ data$datetime, col="black",type="l", ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~ data$datetime,col="red")
lines(data$Sub_metering_3~ data$datetime,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")

#4
plot(data$datetime,data$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")

dev.off()