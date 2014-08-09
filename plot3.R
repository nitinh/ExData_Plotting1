library(sqldf)

unzip("exdata-data-household_power_consumption.zip")

dataf <- read.csv.sql("household_power_consumption.txt",sep=";",header=T,sql = "select * from file where (Date == '1/2/2007') |(Date =='2/2/2007')", eol = "\n")

par(mar=c(5,5,4,2))

par(cex=0.8)

with(dataf,plot(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Sub_metering_1)),ylab="Energy sub metering",xlab="",type="n"))
lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Sub_metering_1)))

lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Sub_metering_2)), col="red")

lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Sub_metering_3)), col="blue")

legend("topright",legend=c("Sub_metering_1        ","Sub_metering_2  ","Sub_metering_3        "),col=c("black","red","blue"),lwd=1, lty=c(1,1,1))

dev.copy(png,file="plot3.png")

dev.off()

file.remove("household_power_consumption.txt")