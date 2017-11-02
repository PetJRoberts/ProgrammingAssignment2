# Load the data
powerdat<-read.table("./household_power_consumption.txt", stringsAsFactors=FALSE,header=TRUE, sep=";")

# Use only required data
powerdat <- powerdat[powerdat$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert power to number histogram
powerdat$Global_active_power<-as.numeric(powerdat$Global_active_power)

# Create png file
png("plot1.png", width=480, height=480)

# Plot histogram
hist(powerdat$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

# Close png file
dev.off()


