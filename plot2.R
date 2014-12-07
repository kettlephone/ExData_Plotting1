## read in file from working directory and place it into a data frame
power_data <- read.table("household_power_consumption.txt", sep =";", na.strings = "?", header = TRUE)

## subset data to relevant dates
power_data <- subset(power_data, power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007")

## append date to time and convert into a POSIX data type
power_data$Time <- paste(power_data$Date,power_data$Time)
power_data$Time <- strptime(power_data$Time,"%d/%m/%Y %H:%M:%S")

## plot to a file
png(file = "plot2.png", width = 480, height = 480)

## set the viewing screen to a 1x1  pane
par(mfrow = c(1,1))

## plot the requested graphic
plot(power_data$Time, power_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()