# It is assumed the csv file is in the same location of this script
hpc <- read.csv("household_power_consumption.csv", sep=";", stringsAsFactors=FALSE)
summary(hpc)
hpc$Voltage<-as.numeric(hpc$Voltage)
hpc$Global_active_power<-as.numeric(hpc$Global_active_power)
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hpc$Global_reactive_power<-as.numeric(hpc$Global_reactive_power)
hpc$Global_intensity<-as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1<-as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2<-as.numeric(hpc$Sub_metering_2)
(hpc$DateTime<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S"))
hpc<-hpc[hpc$Date>=as.Date("2007-02-01") & hpc$Date<=as.Date("2007-02-02"),]

plot(hpc$DateTime, hpc$Sub_metering_1, type = "l",ylab="Energy sub metering",main="",xlab="",col="black")
lines(hpc$DateTime, hpc$Sub_metering_2,type="l",col="red")
lines(hpc$DateTime, hpc$Sub_metering_3,type="l",col="blue")
(usr <- par( "usr" ))
legend(usr[1]+143600,usr[4],c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.font=c(1,1,1),cex=0.7,lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))
dev.copy(png, file = "plot3.png", width = 480, height = 480) ## Copy my plot to a PNG file
dev.off()