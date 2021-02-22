temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
huge_data <- read.csv(unz(temp,"household_power_consumption.txt"), sep =";",na.strings = "?")
two_days <- subset(huge_data, Date =="1/2/2007" | Date == "2/2/2007")
two_days$Global_active_power<- as.numeric(two_days$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(two_days$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red",ylim=c(0, 1200))
dev.off()