##Download file from link and unzip the file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
powerfile <- unzip(temp)
unlink(temp)

##Read the file
powerconsumption <- read.table(powerfile, header=T, sep=";")
subsetpowerconsump <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot 4
datetime <- strptime(paste(subsetpowerconsump$Date, subsetpowerconsump$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(as.character(subsetpowerconsump$Global_active_power))
globalreactivepower <- as.numeric(as.character(subsetpowerconsump$Global_reactive_power))
voltage <- as.numeric(as.character(subsetpowerconsump$Voltage))
submetering1 <- as.numeric(as.character(subsetpowerconsump$Sub_metering_1))
submetering2 <- as.numeric(as.character(subsetpowerconsump$Sub_metering_2))
submetering3 <- as.numeric(as.character(subsetpowerconsump$Sub_metering_3))

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()