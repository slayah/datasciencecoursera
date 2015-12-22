data<-read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#class(data$Date)
#dates<-data$Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

gap<-data[['Global_active_power']]
gap<-as.numeric(as.character(gap))
dateTime <- paste(data$Date, data$Time)
dateTime <- as.POSIXct(dateTime)
png(file="plot2.png")
plot(data$Global_active_power~dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

