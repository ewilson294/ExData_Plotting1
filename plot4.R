# plot4.R
# Author: Eric Wilson
# Date Created: 6 June 2021

# Download data and read into table
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temporary <- tempfile()
download.file(url, temporary)
householdPowerConsumption <- read.table(unzip(temporary), header = TRUE, sep = ";")
unlink(temporary)
# Convert characters in table to numeric values
householdPowerConsumption[,3:9] <- sapply(householdPowerConsumption[,3:9], as.numeric)
# Convert date characters to date objects
householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, format = "%d/%m/%Y")
# Subset dataframe by date of interest
householdPowerConsumption <- householdPowerConsumption[c(which(householdPowerConsumption$Date == "2007-02-01"), which(householdPowerConsumption$Date == "2007-02-02")),]
# Convert time to date objects
for (tau in 1:length(householdPowerConsumption$Time)) {
    time <- paste(strftime(householdPowerConsumption$Date[tau]), householdPowerConsumption$Time[tau], sep = " ")
    householdPowerConsumption$Time[tau] <- time
}
householdPowerConsumption$Time <- strptime(householdPowerConsumption$Time, format = "%Y-%m-%d %R:%S")

# Construct Plot
par(mfcol = c(2,2))
png(filename = "plot4.png", height = 480, width = 480)
with(householdPowerConsumption, {
    plot(Time, Global_active_power, pch = NA_integer_, ylab = "Global Active Power")
    lines(Time, Global_active_power)
    plot(Time, Sub_metering_1, pch = NA_integer_, ylab = "Energy sub metering", type = "n")
    lines(Time, Sub_metering_1, col = "black")
    lines(Time, Sub_metering_2, col = "red")
    lines(Time, Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
    plot(Time, Voltage, pch = NA_integer_, xlab = "datetime", ylab = "Voltage")
    lines(Time, Voltage)
    plot(Time, Global_reactive_power, pch = NA_integer_, xlab = "datetime")
    lines(Time, Global_reactive_power)
})
dev.off()