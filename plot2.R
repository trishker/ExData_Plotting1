library(data.table)
powerconsumption <- fread("household_power_consumption.txt", na.strings="?")
feb1_2 <- subset(powerconsumption, Date == "1/2/2007" | Date == "2/2/2007")
feb1_2$datetime <- paste(feb1_2$Date, feb1_2$Time)


datetimecol <- strptime(feb1_2$datetime, "%d/%m/%Y %H:%M:%S")
datetimecol <- as.POSIXct(datetimecol)
dat <- cbind(feb1_2, datetimecol)

png(file = "plot2.png")
plot(dat$datetimecol, dat$Global_active_power,  type = "l", 
     xlab = "", ylab = "Global Active Power (kilowats)")
dev.off()