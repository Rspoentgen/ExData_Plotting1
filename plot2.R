
#plot 2

library(data.table)
library(plyr)
library(dplyr)

setwd("C:/Users/Spoere01/Desktop/RCoursera/Exploratory")

# read in data

electric.consumption <- as.data.frame(fread(input="household_power_consumption.txt"))                                                               "integer","integer","integer")),sep=";"))

#eliminate missing values
electric.consumption.clean <- electric.consumption[complete.cases(electric.consumption),]

#convert date and time columns from character class (keep but create new variables)
complete.DateTime <-strptime(paste(electric.consumption.clean$Date,electric.consumption.clean$Time), format="%d/%m/%Y %H:%M:%S") 
date.formatted <- as.Date(electric.consumption.clean$Date,"%d/%m/%Y")

# merge new variables and subset on only datat from 02/01/2007 and 02/02/2007
ecc2 <- cbind(electric.consumption.clean,complete.DateTime,date.formatted)
ecc3 <- ecc2[ecc2$date.formatted== "2007-02-01"|ecc2$date.formatted== "2007-02-02", ] 

#convert all metric variables to numeric

ecc4 <- mutate(ecc4, Global_active_power=as.numeric(Global_active_power), Global_reactive_power=as.numeric(Global_reactive_power),
               Voltage = as.numeric(Voltage), Global_intensity = as.numeric(Global_intensity), Sub_metering_1 = as.numeric(Sub_metering_1),
               Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3))


# Create Plot 2

# plot 2

plot(ecc4$complete.DateTime,ecc4$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts")

# Save to PNG device

png(file="plot2.png")

plot(ecc4$complete.DateTime,ecc4$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
