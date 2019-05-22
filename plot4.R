# set working directory
setwd("C:/Training/R Data Exploratory/Data")

# Read & subset data from 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   stringsAsFactors = F)
subdata <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")


# Transforming Date and Time into datetime format
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), 
                             "%d/%m/%Y %H:%M:%S") 

# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(subdata, plot(datetime, as.numeric(Global_active_power), type="l", xlab="", ylab="Global Active Power"))
with(subdata, plot(datetime, as.numeric(Voltage), type = "l", xlab="datetime", ylab="Voltage"))
with(subdata, plot(datetime, as.numeric(Sub_metering_1), type="l", xlab="", ylab="Energy sub metering"))
lines(subdata$datetime, as.numeric(subdata$Sub_metering_2),type="l", col= "red")
lines(subdata$datetime, as.numeric(subdata$Sub_metering_3),type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(subdata, plot(datetime, as.numeric(Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()