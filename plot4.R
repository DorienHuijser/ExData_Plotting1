# Exploratory data analysis course
# Course project 1: Electric power consumption graphs - create plot 4
# Author: Dorien Huijser
# Date: 2020-03-24

# Set working directory (change this to the folder where your original data are located)
setwd("C:/Users/dorie/Documenten/201912_Coursera_Data_Science_Specialization/4. Exploratory data analysis/Week_1_Course_Project")

# Download the data
zipfileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
install.packages("downloader")
library(downloader)
download(zipfileURL,destfile="PowerConsumptionData.zip", mode="wb")
unzip("PowerConsumptionData.zip", exdir = ".")

# Read in the relevant data from the dates 1/2/2007 and 2/2/2007
install.packages("sqldf")
library(sqldf)
dataframe4 <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")

# Convert Date and Time into official date/time format
dataframe4$DateTimeChar <- paste(dataframe4$Date,dataframe2$Time) # Combine date and time into 1 character variable
dataframe4$DateTime <- strptime(dataframe4$DateTimeChar,format="%d/%m/%Y %H:%M:%S") # Make into a Date/time variable

# Open a .png connection in which the plot will be saved
png("plot4.png", width = 480, height = 480)

# Make the plot
par(mfrow=c(2,2)) # fills the 2x2 plot space row by row

# plot a (same as plot 2, left upper)
plot(dataframe4$DateTime, dataframe4$Global_active_power,type="n",xlab = "", ylab="Global Active Power (kilowatts)")
lines(dataframe4$DateTime,dataframe4$Global_active_power)

# plot b (right upper)
plot(dataframe4$DateTime, dataframe4$Voltage,type="n",xlab = "datetime", ylab="Voltage")
lines(dataframe4$DateTime,dataframe4$Voltage)

# plot c (same as plot 3, left lower)
plot(dataframe4$DateTime, dataframe4$Sub_metering_1,type="n",xlab = "", ylab="Energy sub metering")
lines(dataframe4$DateTime,dataframe4$Sub_metering_1, col = "black")
lines(dataframe4$DateTime,dataframe4$Sub_metering_2, col = "red")
lines(dataframe4$DateTime,dataframe4$Sub_metering_3, col = "blue")
legend("topright",lwd = 1, col=c("black","red", "blue"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot d (right lower)
plot(dataframe4$DateTime, dataframe4$Global_reactive_power,type="n",xlab = "datetime", ylab="Global_reactive_power")
lines(dataframe4$DateTime,dataframe4$Global_reactive_power)

# Close the connection
dev.off()