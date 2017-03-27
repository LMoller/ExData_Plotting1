##Download file from link and unzip the file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
powerfile <- unzip(temp)
unlink(temp)

##Read the file
powerconsumption <- read.table(powerfile, header=T, sep=";")
subsetpowerconsump <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot 1
globalactivepower <- as.numeric(as.character(subsetpowerconsump$Global_active_power))
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
