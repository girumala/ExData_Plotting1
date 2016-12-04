df <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?",stringsAsFactors=FALSE )
df2 <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

df2$DateTime <- strptime(paste(df2$Date, df2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("Plot3.png", width=480, height=480)
plot(df2$DateTime, as.numeric(df2$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(df2$DateTime, as.numeric(df2$Sub_metering_2), type="l", col="red")
lines(df2$DateTime, as.numeric(df2$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()