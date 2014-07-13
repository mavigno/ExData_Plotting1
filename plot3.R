# Generate plot3.png
Sys.setlocale("LC_ALL", 'en_US.UTF-8') # override locale to get date labels in english
# read household data and assuming string "?" and blank as NA
hpc <- read.csv("household_power_consumption.txt",
                sep=";",
                as.is=TRUE,
                na.strings=c("?"," "))
# create variable DateTime based on Date and Time variables (assume UTC)
hpc$DateTime <- with(hpc,
                     strptime(paste(Date,Time),
                              "%d/%m/%Y %H:%M:%S",
                              tz="GMT"))
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
# subset to required dates
hpc <- hpc[hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02",]
# set device to file
png("plot3.png",width=480,height=480)
# plot line graph
with(hpc,plot(DateTime,Sub_metering_1,
              type="n",
              ylab="Energy sub metering",
              xlab=""))
with(hpc,lines(DateTime,Sub_metering_1,col="black"))
with(hpc,lines(DateTime,Sub_metering_2,col="red"))
with(hpc,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),lwd=c(2.5,2.5),
       col=c("black","red","blue"))

dev.off()

