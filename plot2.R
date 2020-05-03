#Checking Working directory
getwd()

# setting working directory
setwd("C:/Users/Shakti Jaiswal/Desktop/RajBhaiya/ExData_Plotting1") 

#checking working directory
getwd()

#Reads the data from text file
hhData<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",nrows = 2075259,
                 check.names=F, stringsAsFactors=F,comment.char = "",quote = '\"')

hhData1<-subset(hhData,Date %in% c("1/2/2007","2/2/2007"))

hhData1$Date<-as.Date(hhData1$Date,format="%d/%m/%Y")
datetime<-paste(as.Date(hhData1$Date),hhData1$Time)
hhData1$Datetime <- as.POSIXct(datetime)

# For Creating plot2 PNG File
png("plot2.png",width=480,height=480)

with(hhData1,{plot(Global_active_power~Datetime,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")})

dev.off()

