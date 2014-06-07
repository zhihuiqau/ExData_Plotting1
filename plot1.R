##this code draw a histgram of Global_active_power( household global minute-averaged active power (in kilowatt))
## the data to be used is from the dates 2007-02-01 and 2007-02-02.
# setting the working directory
setwd("D:/Exploratory Data Analysis/exdata-data-household_power_consumption")
#reading in the data
PowerData<-read.csv("D:/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
PowerData$Global_active_power[PowerData$Global_active_power=="?"] <- NA
PowerData1<- subset(PowerData, PowerData$Date == "1/2/2007" | PowerData$Date == "2/2/2007",select=Date:Sub_metering_3)

png(filename="plot1.png", width=480, height=480)

hist(as.numeric(PowerData1$Global_active_power),col="red",
     main ="Global active power",
     ylim = c(0, 1200),
     xlab="Global active power(kilowatts)")
dev.off()