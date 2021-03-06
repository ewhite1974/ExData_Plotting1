## Read the data from the wd into a data frame called g. 
## Add a column that creates a date field.
## Take a subset of rows based upon the date. 


g <- read.table("household_power_consumption.txt", sep=";", header=T)
g$NewDate <- as.Date(g$Date, format = "%d/%m/%Y")
df <- subset(g, g$NewDate>="2007-02-01" & g$NewDate<="2007-02-02")

## Converts various columns to a numeric. Mergest the date and time fields.
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))

df$datetime <- as.POSIXct(paste(df$NewDate, df$Time), format="%Y-%m-%d %H:%M:%S")

## Creates a 2x2 window and populates it with 4 grapsh.
par(mfrow = c(2, 2))
with(df, {
  plot(df$datetime, df$Global_active_power, type = "o", pch = ".", main = "", xlab = "", ylab = "Global Active Power")
  plot(df$datetime, df$Voltage, type = "o", pch = ".", main = "", xlab = "", ylab = "Voltage")
  plot(df$datetime, df$Sub_metering_1, type = "o", pch = ".", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(df$datetime, df$Sub_metering_2, type = "o", pch = ".", col = "red")
  lines(df$datetime, df$Sub_metering_3, type = "o", pch = ".", col = "blue")
  legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(df$datetime, df$Global_reactive_power, type = "o", pch = ".", main = "", xlab = "", ylab = "Global Reactive Power")
})