
file <- "household_power_consumption.txt"
file_data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#We will only be using data from the dates 2007-02-01 and 2007-02-02
file_data2 <- file_data[file_data$Date %in% c("1/2/2007","2/2/2007") ,]

#You may find it useful to convert the Date and Time variables to Date/Time 
#classes in R using the strptime()  and as.Date() functions.
Time <- strptime(paste(file_data2$Date, file_data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

Global_active_power <- as.numeric(file_data2$Global_active_power)

Sub_metering_1 <- as.numeric(file_data2$Sub_metering_1)
Sub_metering_2 <- as.numeric(file_data2$Sub_metering_2)
Sub_metering_3 <- as.numeric(file_data2$Sub_metering_3)

png("plot3.png", width=480, height=480)
        plot(Time, Sub_metering_1_2, type="l", ylab="Energy Submetering", xlab="")
        lines(Time, Sub_metering_2_2, type="l", col="red")
        lines(Time, Sub_metering_3_2, type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()