data<-read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?"
               , check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#class(data$Date)
#dates<-data$Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
dateTime <- paste(data$Date, data$Time)
dateTime <- as.POSIXct(dateTime)
png(file="plot4.png")
par(mfrow=c(2,2))
with(data,{
  plot(data$Global_active_power~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(data$Voltage~dateTime, type="l",
       ylab="Voltage", xlab="datetime")
  plot(data$Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(data$Sub_metering_2~dateTime,col="red")
  lines(data$Sub_metering_3~dateTime,col="blue")
  plot(data$Global_reactive_power~dateTime, type="l",
       ylab="Global Reactive Power (kilowatts)", xlab="datetime")
})
dev.off()