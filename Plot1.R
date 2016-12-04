df <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?",stringsAsFactors=FALSE )
df2 <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

df2$DateTime <- strptime(paste(df2$Date, df2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


hist(as.numeric(df2$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.copy(png, "Plot1.png", width=480,height=480)
dev.off()