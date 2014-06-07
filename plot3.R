##this code draw a grap of Global_active_power( household global minute-averaged active power (in kilowatt)) for three different kinds of house's facilities   
## the data to be used is from the dates 2007-02-01 and 2007-02-02.
# setting the working directory
setwd("D:/Exploratory Data Analysis/exdata-data-household_power_consumption")
#reading in the data
PowerData<- read.table("D:/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",
                       colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
PowerData1<- subset(PowerData, PowerData$Date == "1/2/2007" | PowerData$Date == "2/2/2007",select=Date:Sub_metering_3)
Sys.setlocale("LC_TIME", "C")
PowerData1$date.time <- strptime(paste(PowerData1$Date, PowerData1$Time), format='%d/%m/%Y %H:%M:%S')


png(filename="plot3.png", width=480, height=480)

with(PowerData1,plot(date.time,Sub_metering_1,col="black",
                      type="l",xlab="",
                      ylab="Energy Sub metering"))
lines(PowerData1$date.time,PowerData1$Sub_metering_2,type="l",col="red",lwd=2)
lines(PowerData1$date.time,PowerData1$Sub_metering_3,type="l",col="blue",lwd=2)
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,lwd=2)
dev.off()



