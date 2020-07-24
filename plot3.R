data <- read.table("household_power_consumption.txt", sep=";", skip = 1)
names(data) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
subdata <- subset(data,data$date=="1/2/2007" | data$date =="2/2/2007")

date_time <- strptime(paste(subdata$date, subdata$time, sep=" "), "%d/%m/%Y %H:%M:%S")
subdata$sub_metering_1 <- as.numeric(subdata$sub_metering_1)
subdata$sub_metering_2 <- as.numeric(subdata$sub_metering_2)
subdata$sub_metering_3 <- as.numeric(subdata$sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480)

plot(date_time,subdata$sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(date_time,subdata$sub_metering_1)
lines(date_time,subdata$sub_metering_2,col="red")
lines(date_time,subdata$sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
