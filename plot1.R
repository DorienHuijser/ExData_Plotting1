# Exploratory data analysis course
# Course project 1: Electric power consumption graphs - create plot 1
# Author: Dorien Huijser
# Date: 2020-03-23

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
dataframe1 <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")


# Open a .png connection in which the plot will be saved
png("plot1.png", width = 480, height = 480)

# Make the plot
hist(dataframe1$Global_active_power,main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency")

# Close the connection
dev.off()