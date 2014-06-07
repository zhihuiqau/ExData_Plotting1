##this code draw a graph of Global_active_power( household global minute-averaged active power (in kilowatt)) for differient dates
## the data to be used is from the dates 2007-02-01 and 2007-02-02.
# setting the working directory
setwd("D:/Exploratory Data Analysis/exdata-data-household_power_consumption")
#reading in the data
PowerData<- read.table("D:/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",
                       colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
PowerData1<- subset(PowerData, PowerData$Date == "1/2/2007" | PowerData$Date == "2/2/2007",select=Date:Sub_metering_3)
Sys.setlocale("LC_TIME", "C")
PowerData1$date.time <- strptime(paste(PowerData1$Date, PowerData1$Time), format='%d/%m/%Y %H:%M:%S')


png(filename="plot2.png", width=480, height=480)

with(PowerData1,plot(date.time,Global_active_power,col="black",
                      type="l",xlab="",
                      ylab="Global active power(kilowatts)"))
dev.off()


