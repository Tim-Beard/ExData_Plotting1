#####################################################
## plot2.R
## Create a plot of Global Active Power vs time from
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

## One plot per screen
par(mfrow=c(1,1))

## Create the plot
plot(df$Time, df$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

## save it as a png file
dev.copy(png, file="plot2.png", width = 480, height = 480, units = "px")
dev.off()