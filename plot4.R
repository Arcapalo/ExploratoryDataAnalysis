## PLOT 4 - Plotting MultiGraphics
## Ensuring weekdays in English
Sys.setlocale("LC_TIME", "English")

## Loading the data
df1 <- read.csv("household_power_consumption.txt",header = TRUE, na.strings="?", sep = ";", fill = TRUE)

## Selecting dates between "2007-02-01" and "2007-02-02"
df2 <- subset(df1, as.Date(df1$Date,format="%d/%m/%Y") >= "2007-02-01" & as.Date(df1$Date,format="%d/%m/%Y") <= "2007-02-02")

## Preparing weekday extraction
df2$Date <- as.Date(df2$Date , "%d/%m/%Y")
df2$Time <- paste(df2$Date, df2$Time, sep=" ")
df2$Time <- strptime(df2$Time, "%Y-%m-%d %H:%M:%S")

## Ploting
png("plot4.png", width = 480, height = 480)

## Defining 2 x 2 Graphics window 
par(mfrow = c(2, 2))
with(df2, {
## First Graphic
plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## Second Graphic
plot(Time, Voltage, xlab = "datetime", type = "l", ylab = "Voltage")
## Establishing Y-axis interval
ylimits = range(c(df2$Sub_metering_1, df2$Sub_metering_2, df2$Sub_metering_3))

## Third Graphic
plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
par(new = TRUE)
plot(Time, Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
par(new = TRUE)
plot(Time, Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")

## Legends Configuration
legend("topright",
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
bg = "transparent",
bty = "n",
lty = c(1,1,1),
col = c("black", "red", "blue")
)

## Forth Graphic
plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

## Closing device
dev.off()                                                                                                      


