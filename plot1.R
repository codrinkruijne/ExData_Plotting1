library(lubridate)
## download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "hpc.zip")
## unzip("hpc.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
feb_data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Changing column types
feb_data$date_time = dmy_hms(paste(feb_data$Date, feb_data$Time))
feb_data$Global_active_power <- as.numeric(feb_data$Global_active_power)
feb_data$Global_reactive_power <- as.numeric(feb_data$Global_reactive_power)
feb_data$Voltage <- as.numeric(feb_data$Voltage)
feb_data$Global_intensity <- as.numeric(feb_data$Global_intensity)
feb_data$Sub_metering_1 <- as.numeric(feb_data$Sub_metering_1)
feb_data$Sub_metering_2 <- as.numeric(feb_data$Sub_metering_2)
feb_data$Sub_metering_3 <- as.numeric(feb_data$Sub_metering_3)

# Creating .png and plotting to it
png("plot1.png")
hist(as.numeric(feb_data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()