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

# For Creating plot1 PNG File
png("plot1.png",width=480,height=480)

#To Create Histogram Graph for Global Ative Power
hist(hhData1$Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",col="red")

dev.off()
