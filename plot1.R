### T.K. Nguyen
### Coursera - Exploratory Data Analysis
### Course Project 1
### Plot 1

# Read in the data
setwd("~/Dropbox/coursera/Exploratory Data Analysis")
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Subset dates 2007-02-01 and 2007-02-02
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
data <- power[(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]

# Make plot
png (file="plot1.png", width=480, height=480)
hist(data$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()