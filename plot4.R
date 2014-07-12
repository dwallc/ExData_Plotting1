### Exploratory Data Analysis


## Peer Assessment I - Plot 4

# Clear Workspace
rm(list=ls())

# Load Original Data File
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", colClasses = "character")

# Cleaning and Subsetting Data
data[,1] <- as.Date(data$Date, "%d/%m/%Y")
data[,3] <- as.numeric(data[,3])
data[,4] <- as.numeric(data[,4])
data[,5] <- as.numeric(data[,5])
data[,6] <- as.numeric(data[,6])
data[,7] <- as.numeric(data[,7])
data[,8] <- as.numeric(data[,8])
data[,9] <- as.numeric(data[,9])
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%Y-%m-%d %H:%M:%S")
subdata <- subset(data, data$Date %in% 
                          as.Date(c("2007-02-01", "2007-02-02")))

## Create 4 Plots in a 2x2 Grid

# Set 2x2 Grid, Filling Across Rows
par(mfrow = c(2,2), mar = c(5.1, 4.1, 1.1, 2.1))

# 1st Plot - Global Active Power
plot(subdata$DateTime, subdata[,3], type = "l", xlab = " ", 
     ylab = "Global Active Power")

# 2nd Plot - Voltage
plot(subdata$DateTime, subdata[,5], type = "l", xlab = "datetime", 
     ylab = "Voltage")

# 3rd Plot - Energy sub metering
plot(subdata$DateTime, subdata[,7], type = "l", xlab = " ", 
     ylab = "Energy sub metering")
lines(subdata[,10], subdata[,8], col = "red")
lines(subdata[,10], subdata[,9], col = "blue")
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1, pt.cex = 0.6, cex = 0.6, bty = "n")

# 4th Plot - Global_reactive_power
plot(subdata$DateTime, subdata[,4], type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

# Copy Histogram to PNG File
dev.copy(png, file = "plot4.png")
dev.off()