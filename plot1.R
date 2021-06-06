# plot1.R
# Author: Eric Wilson
# Date Created: 5 June 2021

householdPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Convert characters in table to numeric values
householdPowerConsumption[,3:9] <- sapply(householdPowerConsumption[,3:9], as.numeric)
# Convert date characters to date objects
householdPowerConsumption$Date <- as.Date(householdPowerConsumption$Date, format = "%d/%m/%Y")
# Subset dataframe by date of interest
householdPowerConsumption <- householdPowerConsumption[c(which(householdPowerConsumption$Date == "2007-02-01"), which(householdPowerConsumption$Date == "2007-02-02")),]
# Construct histogram
hist(householdPowerConsumption$Global_active_power) # 