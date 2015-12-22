data<-read.csv(file="data/household_power_consumption.txt",sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#class(data$Date)
#dates<-data$Date
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
gap<-data[['Global_active_power']]
gap<-as.numeric(as.character(gap))
png(file="plot1.png")
hist(gap,xlab = "Global Active Power(kilowatts)",col="red",main="Global Active Power")
dev.off()

