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
EPC <- mutate(EPC, Weekday = wday(Date,label=TRUE))
EPC <- mutate(EPC, Date_Time = ymd_hms(paste(Date,Time,sep=" ")))

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

#Plot 2 - Plot of Global Active Power by Weekday
png("plot2.png")
plot(EPC$Date_Time, 
     as.numeric(as.character(EPC$Global_active_power)), 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab=""
     )
dev.off()