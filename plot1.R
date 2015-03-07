## PLOT 1 - Global active Power
## Loading the data
df1 <- read.csv("household_power_consumption.txt",header = TRUE, na.strings="?", sep = ";", fill = TRUE)

## Selecting dates between "2007-02-01" and "2007-02-02"
df2 <- subset(df1, as.Date(df1$Date,format="%d/%m/%Y") >= "2007-02-01" & as.Date(df1$Date,format="%d/%m/%Y") <= "2007-02-02")

## PLOT 1 - Plotting the first Histogram
png("plot1.png", width = 480, height = 480)                                                                         
hist(df2$Global_active_power, breaks = 11, col = "red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Closing device
dev.off()                                                                                                      
