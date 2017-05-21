library(data.table)
powerconsumption <- fread("household_power_consumption.txt", na.strings="?")
feb1_2 <- subset(powerconsumption, Date == "1/2/2007" | Date == "2/2/2007")
feb1_2$datetime <- paste(feb1_2$Date, feb1_2$Time)


datetimecol <- strptime(feb1_2$datetime, "%d/%m/%Y %H:%M:%S")
datetimecol <- as.POSIXct(datetimecol)
dat <- cbind(feb1_2, datetimecol)

png(file = "plot4.png")

par(mfcol = c(2,2))

plot(dat$datetimecol, dat$Global_active_power,  type = "l", 
     xlab = "", ylab = "Global Active Power")

plot(dat$datetimecol, dat$Sub_metering_1,  
     type = "l", xlab = "", ylab = "Energy sub metering")
points(dat$datetimecol, dat$Sub_metering_2,  type = "l", col = "red")
points(dat$datetimecol, dat$Sub_metering_3,  type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "blue", "red"),
       bty = "n") 

plot(dat$datetimecol, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dat$datetimecol, dat$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()