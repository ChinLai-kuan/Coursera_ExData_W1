# set working directory
setwd("C:/Training/R Data Exploratory/Data")

# Read & subset data from 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   stringsAsFactors = F)
subdata <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")


# Transforming Date and Time into datetime format
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), 
                             "%d/%m/%Y %H:%M:%S") 

# Plot 2
png("plot2.png", width = 480, height = 480)
with(subdata, plot(datetime, as.numeric(Global_active_power), type="l", 
                   xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()