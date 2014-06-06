Sys.setlocale("LC_ALL", 'en_US.UTF-8') # override locale to get date labels in english
# read household data and assuming string "?" and blank as NA
hpc <- read.csv("household_power_consumption.txt",
                sep=";",
                as.is=TRUE,
                na.strings=c("?"," "))
# create variable DateTime based on Date and Time variables (assume UTC)
hpc$DateTime <- with(hpc,strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S",tz="GMT"))
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
# subset to required dates
hpc <- hpc[hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02",]
png("plot2.png")
# plot line graph
with(hpc,plot(DateTime,Global_active_power,
              type="n",
              ylab="Global Active Power (kilowatts)",
              xlab=""))
with(hpc,lines(DateTime,Global_active_power))
dev.off()

