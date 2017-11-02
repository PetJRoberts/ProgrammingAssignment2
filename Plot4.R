# Load the data
powerdat<-read.table("./household_power_consumption.txt", header=TRUE,stringsAsFactors=FALSE, sep=";")

# Use only required data
powerdat <- powerdat[powerdat$Date %in% c("1/2/2007","2/2/2007") ,]

#Create datetime variable
powerdat$datetime <- strptime(paste(powerdat$Date, powerdat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Convert power and voltages to numeric
powerdat$Global_active_power<-as.numeric(powerdat$Global_active_power)
powerdat$Global_reactive_power<-as.numeric(powerdat$Global_reactive_power)
powerdat$Voltage<-as.numeric(powerdat$Voltage)

#Convert subs to numeric
powerdat$Sub_metering_1<-as.numeric(powerdat$Sub_metering_1)
powerdat$Sub_metering_2<-as.numeric(powerdat$Sub_metering_2)
powerdat$Sub_metering_3<-as.numeric(powerdat$Sub_metering_3)

# Create png file
png("plot4.png", width=480, height=480)

# Set up 2x2 box
par(mfrow=c(2,2))

# Create plot 1
with(powerdat, plot(datetime, Global_active_power, col="black", type="l",xlab="", ylab="Global Active Power"))

# Create plot 2
with(powerdat, plot(datetime, Voltage, col="black", type="l",xlab="datetime", ylab="Voltage"))

# Create plot 3
with(powerdat, plot(datetime, Sub_metering_1, col="black", type="l",xlab="", ylab="Energy sub metering"))
with(powerdat, lines(datetime, Sub_metering_2, col="red", type="l"))
with(powerdat, lines(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, bty="n", col=c("black", "red", "blue"))

# Create plot 4
with(powerdat, plot(datetime, Global_reactive_power, col="black", type="l",xlab="datetime", ylab="Global_reactive_power"))

# Close png file
dev.off()