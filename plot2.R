temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
huge_data <- read.csv(unz(temp,"household_power_consumption.txt"), sep =";", na.strings = "?")
two_days <- subset(huge_data, Date =="1/2/2007" | Date == "2/2/2007")
two_days$Global_active_power<- as.numeric(two_days$Global_active_power)

##Get one column with date and time
date_and_time = strptime(paste(two_days$Date, two_days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(date_and_time,two_days$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()