## PLOT 2 - WeekDay x Global_active_power
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

## Plotting WeekDay x Global_active_power
png("plot2.png", width = 480, height = 480)                                                                         
plot(df2$Time, df2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

## Closing device
dev.off()                                                                                                      

