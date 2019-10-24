files <- file("household_power_consumption.txt")
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files), value = TRUE), sep=";", 
                   col.names = c("Date","Time", "Global_active_power", "Global_reactive_power",
                                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                   na.strings="?")

##convert date and time 
data$Date <- as.Date(data$Date, format="%d/%m/%y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
##open the png device
png(filename="./pictures/plot2.png", width=480, height=480, units = 'px')

## draw the picture
Sys.setlocale(category = "LC_TIME", locale = "english")
plot(data$DateTime, data$Global_active_power, xlab="", ylab ="Global Active Power(kilowatt)", type = "l" )
## close the device
dev.off()
                     