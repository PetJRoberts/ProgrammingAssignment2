# Load the data
powerdat<-read.table("./household_power_consumption.txt", stringsAsFactors=FALSE,header=TRUE, sep=";")

# Use only required data
powerdat <- powerdat[powerdat$Date %in% c("1/2/2007","2/2/2007") ,]

#Create datetime variable
powerdat$datetime <- strptime(paste(powerdat$Date, powerdat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Convert power to numeric
powerdat$Global_active_power<-as.numeric(powerdat$Global_active_power) 

#Convert subs to numeric
powerdat$Sub_metering_1<-as.numeric(powerdat$Sub_metering_1)
powerdat$Sub_metering_2<-as.numeric(powerdat$Sub_metering_2)
powerdat$Sub_metering_3<-as.numeric(powerdat$Sub_metering_3)

# Create png file
png("plot3.png", width=480, height=480)

#Create plot
with(powerdat, plot(datetime, Sub_metering_1, col="black", type="l",xlab="", ylab="Energy sub metering"))
with(powerdat, lines(datetime, Sub_metering_2, col="red", type="l"))
with(powerdat, lines(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))

# Close png file
dev.off()