
file <- "household_power_consumption.txt"
file_data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#We will only be using data from the dates 2007-02-01 and 2007-02-02
file_data2 <- file_data[file_data$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power <- as.numeric(file_data2$Global_active_power)

png("plot1.png", width=480, height=480)
        hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()