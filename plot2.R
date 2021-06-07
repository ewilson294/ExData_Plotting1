# plot2.R
# Author: Eric Wilson
# Date Created: 6 June 2021

householdPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
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
png(filename = "plot1.png", height = 480, width = 480)
with(householdPowerConsumption, plot(Time, Global_active_power, ylab = "Global Active Power (kilowatts)", pch = NA_integer_))
lines(householdPowerConsumption$Time, householdPowerConsumption$Global_active_power)
dev.off()