files <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files), value = TRUE), sep=";", 
                   col.names = c("Date","Time", "Global_active_power", "Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                  na.strings="?")

## open the png device
if(!file.exists("pictures"))
  dir.create("pictures")
png(filename="./pictures/plot1.png", width = 480, height=480, units = "px")

## draw plot1.png
with(data, hist(Global_active_power,xlab = "Global Active Power(kilowatt)", main = 'Global Active Power', col = "red"))
## close the device
dev.off()