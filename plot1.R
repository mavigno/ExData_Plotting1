# Generate plot1.png
Sys.setlocale("LC_ALL", 'en_US.UTF-8') # override locale to get date labels in english
# read household data and assuming string "?" and blank as NA
hpc <- read.csv("household_power_consumption.txt",
                sep=";",
                as.is=TRUE,
                na.strings=c("?"," "))
# create variable DateTime based on Date and Time variables (assume UTC)
hpc$DateTime <- with(hpc,strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S",tz="GMT"))
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
# convert variables to numeric
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
# subset to required dates
hpc <- hpc[hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02",]
# set device to file
png("plot1.png",width=480,height=480)
# plot histogram
hist(hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

