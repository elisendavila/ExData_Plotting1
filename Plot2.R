############################################
############################################
###
###   Exploratory data analysis
###   Course Project 1
###
############################################
############################################


url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url, destfile = "Data.zip", method = "curl")
unzip("Data.zip")

#######################
### Read data
#######################



power_consumption<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";")


####### we just keep the data of the desired days

power_consumption$Date<- as.POSIXct(power_consumption$Date,format="%d/%m/%Y")

power_consumption<- power_consumption[which(  power_consumption$Date %in% as.POSIXct(c('2007-02-01','2007-02-02'))),]

power_consumption$datetime<-paste(power_consumption$Date,power_consumption$Time)

power_consumption$datetime<-as.POSIXct(power_consumption$datetime)

power_consumption$active_power<- as.numeric(as.character(power_consumption$Global_active_power))

#######################
### Plot2
#######################
Sys.setlocale("LC_TIME", 'en_GB.UTF-8')
png(filename = "Plot2.png",
    width = 480, height = 480, units = "px")
plot(x=power_consumption$datetime, y=power_consumption$active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
