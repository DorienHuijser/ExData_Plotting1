# Exploratory data analysis course
# Course project 1: Electric power consumption graphs - create plot 2
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
dataframe2 <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")

# Convert Date and Time into official date/time format
dataframe2$DateTimeChar <- paste(dataframe2$Date,dataframe2$Time) # Combine date and time into 1 character variable
dataframe2$DateTime <- strptime(dataframe2$DateTimeChar,format="%d/%m/%Y %H:%M:%S") # Make into a Date/time variable

# Open a .png connection in which the plot will be saved
png("plot2.png", width = 480, height = 480)

# Make the plot
plot(dataframe2$DateTime, dataframe2$Global_active_power,type="n",xlab = "", ylab="Global Active Power (kilowatts)")
lines(dataframe2$DateTime,dataframe2$Global_active_power)

# Close the connection
dev.off()
