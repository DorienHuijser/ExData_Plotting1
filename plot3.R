# Exploratory data analysis course
# Course project 1: Electric power consumption graphs - create plot 3
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
dataframe3 <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")

# Convert Date and Time into official date/time format
dataframe3$DateTimeChar <- paste(dataframe3$Date,dataframe2$Time) # Combine date and time into 1 character variable
dataframe3$DateTime <- strptime(dataframe3$DateTimeChar,format="%d/%m/%Y %H:%M:%S") # Make into a Date/time variable

# Open a .png connection in which the plot will be saved
png("plot3.png", width = 480, height = 480)

# Make the plot
plot(dataframe3$DateTime, dataframe3$Sub_metering_1,type="n",xlab = "", ylab="Energy sub metering")
lines(dataframe3$DateTime,dataframe3$Sub_metering_1, col = "black")
lines(dataframe3$DateTime,dataframe3$Sub_metering_2, col = "red")
lines(dataframe3$DateTime,dataframe3$Sub_metering_3, col = "blue")
legend("topright",lwd = 1, col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the connection
dev.off()
