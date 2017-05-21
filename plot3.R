library(data.table)
powerconsumption <- fread("household_power_consumption.txt", na.strings="?")
feb1_2 <- subset(powerconsumption, Date == "1/2/2007" | Date == "2/2/2007")
feb1_2$datetime <- paste(feb1_2$Date, feb1_2$Time)


datetimecol <- strptime(feb1_2$datetime, "%d/%m/%Y %H:%M:%S")
datetimecol <- as.POSIXct(datetimecol)
dat <- cbind(feb1_2, datetimecol)
dat <- subset(dat, select = c(datetimecol, Sub_metering_1, Sub_metering_2, Sub_metering_3))

png(file = "plot3.png")

plot(dat$datetimecol, dat$Sub_metering_1,  
     type = "l", xlab = "", ylab = "Energy sub metering")
points(dat$datetimecol, dat$Sub_metering_2,  type = "l", col = "red")
points(dat$datetimecol, dat$Sub_metering_3,  type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "blue", "red")) 
dev.off()