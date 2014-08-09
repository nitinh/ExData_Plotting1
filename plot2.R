library(sqldf)

unzip("exdata-data-household_power_consumption.zip")

dataf <- read.csv.sql("household_power_consumption.txt",sep=";",header=T,sql = "select * from file where (Date == '1/2/2007') |(Date =='2/2/2007')", eol = "\n")

par(mar=c(5,5,4,2))

par(cex=0.8)

with(dataf,plot(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Global_active_power)),ylab="Global Active Power (kilowatts)",xlab="",type="n"))
lines(strptime(paste(dataf$Date,dataf$Time) , format="%d/%m/%Y %H:%M:%S"), as.numeric(as.character(dataf$Global_active_power)))

dev.copy(png,file="plot2.png")

dev.off()

file.remove("household_power_consumption.txt")