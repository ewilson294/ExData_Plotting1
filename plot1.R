# plot1.R
# Author: Eric Wilson
# Date Created: 5 June 2021

householdPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
householdPowerConsumption[,3:9] <- sapply(householdPowerConsumption[,3:9], as.numeric)
hist(householdPowerConsumption$Global_active_power)