### T.K. Nguyen
### Coursera - Exploratory Data Analysis
### Course Project 1
### Plot 2

# Read in the data
setwd("~/Dropbox/coursera/Exploratory Data Analysis")
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Subset dates 2007-02-01 and 2007-02-02
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
data <- power[(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]

# Add in times to date
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

# Make plot
png (file="plot2.png", width=480, height=480)
plot(data$datetime,data$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()