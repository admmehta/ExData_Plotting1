power<-read.table("C:/Users/admin/Documents/Expl Week 1/power.txt",sep=";",stringsAsFactors = FALSE)
colnames(power)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
View(power)
power<-power[-c(1),]
power1<-power[power$Date %in% c("1/2/2007","2/2/2007") ,]

data<-as.numeric(power1$Global_active_power)
datetime <- strptime(paste(power1$Date, power1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, data, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()