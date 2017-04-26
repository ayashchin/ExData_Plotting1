#Exploratory Data Analysis Week1 Quiz - Setup
dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
library(dplyr)
library(lubridate)

#Download and Unzip Files
if(!file.exists("./data")){dir.create("./data")}
filedownload <- download.file(dataURL,destfile="./data/EPC.zip")
EPCzip <- unzip("./data/EPC.zip")

#Read EPC File & Subset on Dates
EPC <- read.table(EPCzip,header=TRUE,sep=";")
EPC$Date <- dmy(EPC$Date)
EPC <- subset(EPC, Date > "2007-01-31" & Date < "2007-02-03")

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

#Plot 1 - Histogram of Global Active Power by Frequency
png("plot1.png")
hist(as.numeric(as.character(EPC$Global_active_power)), 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)"
     )
dev.off()