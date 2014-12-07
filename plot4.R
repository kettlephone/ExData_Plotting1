## read in file from working directory and place it into a data frame
power_data <- read.table("household_power_consumption.txt", sep =";", na.strings = "?", header = TRUE)

## subset data to relevant dates
power_data <- subset(power_data, power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007")

## append date to time and convert into a POSIX data type
power_data$Time <- paste(power_data$Date,power_data$Time)
power_data$Time <- strptime(power_data$Time,"%d/%m/%Y %H:%M:%S")


## plot to a file
png(file = "plot4.png", width = 480, height = 480)

## set the viewing screen to a 2x2 set of panes
par(mfrow = c(2,2))


## plot first column, first row
plot(power_data$Time, power_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

## plot second column, first row
plot(power_data$Time, power_data$Voltage, ylab = "Voltage", xlab = "datetime" , type ="l")

## plot first column, second row
plot(power_data$Time, power_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(power_data$Time, power_data$Sub_metering_2, col = "red")
lines(power_data$Time, power_data$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot second column, second row
plot(power_data$Time, power_data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

## close the graphics device
dev.off()

## reset the graphics window to 1 x 1
par(mfrow = c(1,1))