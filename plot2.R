data <- read.table("household_power_consumption.txt", sep=";", skip = 1)
names(data) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
subdata <- subset(data,data$date=="1/2/2007" | data$date =="2/2/2007")

subdata$global_active_power <- as.numeric(subdata$global_active_power)
date_time <- strptime(paste(subdata$date, subdata$time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(date_time, subdata$global_active_power, ylab="Global Active Power (kilowatts)", type = "n", xlab = "")
lines(date_time, subdata$global_active_power)

dev.off()

