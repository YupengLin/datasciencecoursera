plot4 <- function(){
  power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
  power[3:9] <- lapply (power[3:9], as.numeric)
  power[1:2] <- lapply (power[1:2], as.character)
  power$Date <- as.Date(power$Date,"%d/%m/%Y")
  powerstat <- power[which(power$Date>=firstDay & power$Date<=secondDay), ]
  datetime <- as.POSIXct(paste(powerstat$Date,powerstat$Time), format="%Y-%m-%d %H:%M:%S")
  powerstat <- cbind(powerstat,datetime)
  
  
  
  png("plot4.png",width=480,height=480)
  par(mfrow=c(2,2))
  plot(powerstat$datetime,powerstat$Global_active_power,lty=1,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  plot(powerstat$datetime,powerstat$Voltage,lty=1,type="l",ylab="Voltage",xlab="datetime")
  plot(powerstat$datetime,powerstat$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
  lines(powerstat$datetime,powerstat$Sub_metering_2,type="l",col="red")
  lines(powerstat$datetime,powerstat$Sub_metering_3,type="l",col="blue")
  legend("topright",c("sub metering 1","sub metering 2", "sub metering 3"),lty=c(1,1,1), col=c("black","red","blue"),border="white")
  plot(powerstat$datetime,powerstat$Global_reactive_power,lty=1,type="l",ylab="Global_reactive_power",xlab="datetime")
  dev.off()
}