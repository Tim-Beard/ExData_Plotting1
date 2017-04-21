#####################################################
## plot4.R
## Create a plot of 4 graphs from
## the "household_power_consumption.txt" dataset.
## It assumes the dataset is in the working directory.

library(lubridate)

## Load the data and manipulate columns to the right format
## Note that no other data tidying is done
df <- read.csv("household_power_consumption.txt", sep=";", 
               stringsAsFactors = FALSE, na.strings="?")
df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
df$Time <- dmy_hms(paste(df$Date, df$Time, sep = " "))
df$Date <- dmy(df$Date)


## set up for 2x2 plots 
par(mfrow = c(2,2))

## Create the global plot
plot(df$Time, df$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

## Create the voltage plot
plot(df$Time, df$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

## Create the sub metering plots
with( df, {
    plot(Time, Sub_metering_1, type="l", col="black", 
         xlab="", ylab="Energy sub metering")
    points(Time, Sub_metering_2, type="l", col="red")
    points(Time, Sub_metering_3, type="l", col="blue")
})

legend("topright", col = c("black", "red", "blue"), 
       legend=names(df[7:9]), lty=1, lwd=2, bty="n")

## Create the global plot
plot(df$Time, df$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global Reactive Power")

## save it as a png file
dev.copy(png, file="plot4.png", width = 480, height = 480, units = "px")
dev.off()