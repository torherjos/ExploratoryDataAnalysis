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

plot(hpc$DateTime, hpc$Global_active_power, type = "l",ylab="Global Active Power (kilowatts)",main="",xlab="")
dev.copy(png, file = "plot2.png", width = 480, height = 480) ## Copy my plot to a PNG file
dev.off()


