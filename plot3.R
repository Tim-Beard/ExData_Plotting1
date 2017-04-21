#####################################################
## plot3.R
## Create a plot of the three sub metering power variables from
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

## Create the plots
with( df, {
    plot(Time, Sub_metering_1, type="l", col="black", 
         xlab="", ylab="Energy sub metering")
    points(Time, Sub_metering_2, type="l", col="red")
    points(Time, Sub_metering_3, type="l", col="blue")
})

legend("topright", col = c("black", "red", "blue"), legend=names(df[7:9]), lty=1, lwd=2)

## save it as a png file
dev.copy(png, file="plot3.png", width = 480, height = 480, units = "px")
dev.off()