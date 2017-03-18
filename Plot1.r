## Read the data from the wd into a data frame called g. 
## Add a column that creates a date field.
## Take a subset of rows based upon the date. 

g <- read.table("household_power_consumption.txt", sep=";", header=T)
g$NewDate <- as.Date(g$Date, format = "%d/%m/%Y")
df <- subset(g, g$NewDate>="2007-02-01" & g$NewDate<="2007-02-02")

## Converts the column Global Active Power to a numeric.
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))


## Opens the libary datasets. Opens a png file. Creates a chart and closes the connection.
library(datasets)
png(filename="Plot1.png")
with(df, hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
##dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()
