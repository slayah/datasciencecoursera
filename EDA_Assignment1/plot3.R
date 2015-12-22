data<-read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?"
               , check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#class(data$Date)
#dates<-data$Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
dateTime <- paste(data$Date, data$Time)
dateTime <- as.POSIXct(dateTime)
png(file="plot3.png")
plot(data$Sub_metering_1~dateTime, type="l",
     ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~dateTime,col="red")
lines(data$Sub_metering_3~dateTime,col="blue")
legend("topright", pch = 1, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
