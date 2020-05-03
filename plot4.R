#Reads the data from text file
hhData<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",nrows = 2075259,
                 check.names=F, stringsAsFactors=F,comment.char = "",quote = '\"')

hhData1<-subset(hhData,Date %in% c("1/2/2007","2/2/2007"))

hhData1$Date<-as.Date(hhData1$Date,format="%d/%m/%Y")
datetime<-paste(as.Date(hhData1$Date),hhData1$Time)
hhData1$Datetime <- as.POSIXct(datetime)

# For Creating plot4 PNG File
png("plot4.png",width=480,height=480)

par(mfrow=c(2,2),mar=c(4,4,2,1))
with(hhData1,{
  plot(Global_active_power~Datetime,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")
  plot(Voltage~Datetime,type = "l",xlab="datetime",ylab = "Voltage")
  plot(Sub_metering_1~Datetime,type = "l",xlab="",ylab = "Energy sub metering")
  lines(Sub_metering_2~Datetime,col="red")
  lines(Sub_metering_3~Datetime,col="blue")
  legend("topright",col=c("black","red","blue"),lty=1,lwd = 2,
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~Datetime,type = "l",xlab="datetime",ylab = "Global_reactive_power")
})

dev.off()

