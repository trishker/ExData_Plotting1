library(data.table)
powerconsumption <- fread("household_power_consumption.txt", na.strings="?")
feb1_2 <- subset(powerconsumption, Date == "1/2/2007" | Date == "2/2/2007")
png(file = "plot1.png")
hist(feb1_2$Global_active_power, 
     col = "red", xlab = "Global Active Power (kilowats)", main = "Global Active Power")
dev.off()