library(sqldf)

unzip("exdata-data-household_power_consumption.zip")

dataf <- read.csv.sql("household_power_consumption.txt",sep=";",header=T,sql = "select * from file where (Date == '1/2/2007') |(Date =='2/2/2007')", eol = "\n")

par(mar=c(5,5,4,2))

par(mfcol=c(2,2))

par(cex=0.6)

with(dataf,plot(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Global_active_power)),ylab="Global Active Power",xlab="",type="n"))

lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Global_active_power)))

with(dataf,plot(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Sub_metering_1)),ylab="Energy sub metering",xlab="",type="n"))

lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Sub_metering_1)))

lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Sub_metering_2)), col="red")

lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Sub_metering_3)), col="blue")

legend("topright",legend=c("Sub_metering_1        ","Sub_metering_2  ","Sub_metering_3        "),col=c("black","red","blue"),lwd=1, lty=c(1,1,1),bty='n')

with(dataf,plot(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Voltage)),ylab="Voltage",xlab="datetime",type="n"))

lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Voltage)))

with(dataf,plot(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Global_reactive_power)),ylab="Global_reactive_power",xlab="datetime",type="n"))

lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Global_reactive_power)))
dev.copy(png,file="plot4.png")

dev.off()

file.remove("household_power_consumption.txt")