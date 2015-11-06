housepower <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", nrows = 2880, skip = 66637)
colnames(housepower) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

library(lubridate)
hpdatetime <- dmy_hms(paste(housepower$Date, housepower$Time))
housepower$Time <- hpdatetime

png(filename = "./ExData_Plotting1/plot3.png")
plot(housepower$Time,housepower$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(housepower$Time, housepower$Sub_metering_2, col="red")
lines(housepower$Time, housepower$Sub_metering_3, col="blue")
legend("topright", pch = 95, col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()