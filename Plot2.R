# Load the data
powerdat<-read.table("./household_power_consumption.txt", stringsAsFactors=FALSE,header=TRUE, sep=";")

# Use only required data
powerdat <- powerdat[powerdat$Date %in% c("1/2/2007","2/2/2007") ,]

powerdat$datetime <- strptime(paste(powerdat$Date, powerdat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Convert power to numeric
powerdat$Global_active_power<-as.numeric(powerdat$Global_active_power) 

# Create png file
png("plot2.png", width=480, height=480)

# Plot chart
with(powerdat,plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Close png file
dev.off()

