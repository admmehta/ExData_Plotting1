power<-read.table("C:/Users/admin/Documents/Expl Week 1/power.txt",sep=";",stringsAsFactors = FALSE)
colnames(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
View(power)
power<-power[-c(1),]
power1<-power[power$Date %in% c("1/2/2007","2/2/2007") ,]


subMetering1 <- as.numeric(power1$Sub_metering_1)
subMetering2 <- as.numeric(power1$Sub_metering_2)
subMetering3 <- as.numeric(power1$Sub_metering_3)

datetime <- strptime(paste(power1$Date, power1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

