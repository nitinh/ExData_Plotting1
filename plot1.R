library(sqldf)

unzip("exdata-data-household_power_consumption.zip")

dataf <- read.csv.sql("household_power_consumption.txt",sep=";",header=T,sql = "select * from file where (Date == '1/2/2007') |(Date =='2/2/2007')", eol = "\n")

par(mar=c(5,5,4,2))

par(cex=0.8)

hist(as.numeric(as.character(dataf$Global_active_power)),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

dev.copy(png,file="plot1.png")

dev.off()

file.remove("household_power_consumption.txt")