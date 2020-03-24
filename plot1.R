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

# Reading in the relevant data
install.packages("sqldf")
library(sqldf)
dataframe <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=";")

# Does not work datatest <- read.table("household_power_consumption.txt",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),sep=";", na.strings = "?")

# Convert Date into date format
dataframe2 <- dataframe # copy
dataframe2$Date <- as.Date(dataframe2$Date, format = "%d/%m/%Y")
# times "%H:%M:%S" NOG DOEN
