#examine whot household energy usage varies over a 2-day period in feb 2007
# construct plots 1 + 2
# 1 - Global active power - historgram
# 2 - Line of active power in k/w
# 3 - multi line of sub-meter readings
# 4 - 4 plots by different values

#libraries
library(ggplot2)

#Set working directory
setwd('//Project/Coursera/DataScience_Course4/')

#Data is in dd/mm/yyyy format
# load the master data
masterdata <- read.csv('household_power_consumption.txt', header = TRUE, sep=";", na.strings = "?")
mdf <- masterdata
head(mdf)

# some data cleaning - seperate sub-set after manipulating the data
mdf$Date <- as.Date(mdf$Date, "%d/%m/%Y")
head(mdf)
head(masterdata)


df.TwoDayEval <- subset(mdf, Date == "2007-02-01" | Date == '2007-02-02') 
nrow(df.TwoDayEval) #should be 2880 - dblc check

# Need to add the days of the week to the column
df.TwoDayEval$dayofweek <- weekdays(as.Date(df.TwoDayEval$Date))

# Merge the date and time and add to a fulldatetime col
df.TwoDayEval$FullDateTime <- paste(df.TwoDayEval$Date, df.TwoDayEval$Time)

# Set to a date/time
df.TwoDayEval$FullDateTime <- as.POSIXlt(df.TwoDayEval$FullDateTime)

#final peek
head(df.TwoDayEval)

######################################
#Plot 4 - put all 4 in the same bloxk
######################################
head(df.TwoDayEval) # to look back at cols

par(mfrow = c(2,2))
#plot 1/4
with(df.TwoDayEval, plot(FullDateTime, Global_active_power, type= "l", xlab="", ylab="Global Active Power (kilowatts)"))
#plot 2/4
with(df.TwoDayEval, plot(FullDateTime, Voltage, type= "l", xlab="datetime", ylab="Voltage"))
#plot 3/4
plot(df.TwoDayEval$FullDateTime, df.TwoDayEval$Sub_metering_1, type="l", col="black", ylim=c(0,40), xlab = " ", ylab="Energy sub Metering")
box()
par(new = TRUE)
plot(df.TwoDayEval$FullDateTime, df.TwoDayEval$Sub_metering_2, type="l", col="red", ylim=c(0,40), xlab = " ", ylab="Energy sub Metering")
box()
par(new = TRUE)
plot(df.TwoDayEval$FullDateTime, df.TwoDayEval$Sub_metering_3, type="l", col="blue", ylim=c(0,40), xlab = " ", ylab="Energy sub Metering")
legend("topright",col=c("black","blue","red"),lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#plot 4/4
with(df.TwoDayEval, plot(FullDateTime, Global_active_power, type= "l", xlab="datetime", ylab="Global reactive power)"))

dev.copy(png, file="Plot4.png")
dev.off()