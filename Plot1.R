# set working directory
setwd("C:/Training/R Data Exploratory/Data")

# Read & subset data from 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", header=T, sep=";", 
                   stringsAsFactors = F)
subdata <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Check subset data
dim(subdata)
min(subdata$Date)
max(subdata$Date)

# Plot 1
png("plot1.png", width = 480, height = 480)
hist(as.numeric(subdata$Global_active_power),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()