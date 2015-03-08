plot3 <- function(){
  power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
  power[3:9] <- lapply (power[3:9], as.numeric)
  power[1:2] <- lapply (power[1:2], as.character)
  power$Date <- as.Date(power$Date,"%d/%m/%Y")
  powerstat <- power[which(power$Date>=firstDay & power$Date<=secondDay), ]
  datetime <- as.POSIXct(paste(powerstat$Date,powerstat$Time), format="%Y-%m-%d %H:%M:%S")
  powerstat <- cbind(powerstat,datetime)
  
  png("plot3.png",width=480,height=480)
  plot(powerstat$datetime,powerstat$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
  lines(powerstat$datetime,powerstat$Sub_metering_2,type="l",col="red")
  lines(powerstat$datetime,powerstat$Sub_metering_3,type="l",col="blue")
  legend("topright",c("sub metering 1","sub metering 2", "sub metering 3"),lty=c(1,1,1), col=c("black","red","blue"))
  
  dev.off()
}