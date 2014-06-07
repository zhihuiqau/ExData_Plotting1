##this code draw four pictures of  household's power consumption in one page
## the data to be used is from the dates 2007-02-01 and 2007-02-02.
# setting the working directory
setwd("D:/Exploratory Data Analysis/exdata-data-household_power_consumption")
#reading in the data and subsetting the data
PowerData<- read.table("D:/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",
                       colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
PowerData1<- subset(PowerData, PowerData$Date == "1/2/2007" | PowerData$Date == "2/2/2007",select=Date:Sub_metering_3)
Sys.setlocale("LC_TIME", "C")
PowerData1$date.time <- strptime(paste(PowerData1$Date, PowerData1$Time), format='%d/%m/%Y %H:%M:%S')


png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2), cex=0.65)
##to draw the first graph
with(PowerData1,
     {
       plot(date.time,Global_active_power,col="black",
                     type="l",xlab="",
                     ylab="Global active power")
       })

##to draw the second graph
with(PowerData1,
     {
       plot(date.time,Voltage,col="black",
                     type="l",xlab="datatime",
                     ylab="Voltage")
       })
##to draw the third graph

with(PowerData1,
     {plot(date.time,Sub_metering_1,col="black",
                      type="l",xlab="",
                      ylab="Energy Sub metering")
      })
lines(PowerData1$date.time,PowerData1$Sub_metering_2,type="l",col="red",lwd=2)
lines(PowerData1$date.time,PowerData1$Sub_metering_3,type="l",col="blue",lwd=2)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,lwd=2,
ncol=1,bty="n",cex=0.8,
inset=0.02)
##to draw the fourth graph

with(PowerData1,
     {plot(date.time,Global_reactive_power,col="black",
                     type="l",xlab="datatime",
                     ylab="Global_reactive_power")
      })

dev.off()



