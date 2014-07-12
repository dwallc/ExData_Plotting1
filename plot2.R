### Exploratory Data Analysis


## Peer Assessment I - Plot 2

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

# Create Line Plot
plot(subdata$DateTime, subdata[,3], type = "l", xlab = " ", 
     ylab = "Global Active Power (Kilowatts)")

# Copy Histogram to PNG File
dev.copy(png, file = "plot2.png")
dev.off()