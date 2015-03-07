## PLOT 3 - WeekDay x SubMeterings
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
png("plot3.png", width = 480, height = 480)                                                                         

## Establishing Y-axis interval
ylimits = range(c(df2$Sub_metering_1, df2$Sub_metering_2, df2$Sub_metering_3))

## First Metering plotting 
plot(df2$Time, df2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")

## Seccond Metering plotting 
par(new = TRUE)
plot(df2$Time, df2$Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")

## Third Metering plotting 
par(new = TRUE)
plot(df2$Time, df2$Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")

## Legend Configuration
legend("topright",
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty = c(1,1,1),
col = c("black", "red", "blue")
)

## Closing device
dev.off()                                                                                                      


