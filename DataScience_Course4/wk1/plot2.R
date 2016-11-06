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


#####################
# PLOT 2 - Line Chart
#####################
#table(df.TwoDayEval$Global_active_power)
#summary(df.TwoDayEval$Global_active_power)

with(df.TwoDayEval, plot(FullDateTime, Global_active_power, type= "l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="Plot2.png")
dev.off()
# not part of assignment - but to show another way, smoothing it out
qplot(FullDateTime, Global_active_power, data=df.TwoDayEval, geom=c("point","smooth")) 