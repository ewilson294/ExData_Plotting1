# plot1.R
# Author: Eric Wilson
# Date Created: 5 June 2021

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
# Open file device
png(filename = "plot1.png", height = 480, width = 480)
# Construct histogram
hist(householdPowerConsumption$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()