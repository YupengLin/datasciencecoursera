plot1 <- function(){
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
power[3:9] <- lapply (power[3:9], as.numeric)
power[1:2] <- lapply (power[1:2], as.character)
power$Date <- as.Date(power$Date,"%d/%m/%Y")
powerstat <- power[which(power$Date>=firstDay & power$Date<=secondDay), ]
datetime <- as.POSIXct(paste(powerstat$Date,powerstat$Time), format="%Y-%m-%d %H:%M:%S")
powerstat <- cbind(powerstat,datetime)

png("plot1.png", width=480,height=480)
hist(powerstat$Global_active_power,col="red",main="Global Active power",xlab="Global Active Power (kilowatts)")

dev.off()



}