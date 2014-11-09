##
datafile <- "household_power_consumption.txt"
tab5rows <- read.table(datafile,header = TRUE, sep = ";", nrow =5 )
##
tabclasses<-sapply(tab5rows,class)
data<-read.table(datafile,header=TRUE,sep=";",colClasses=tabclasses,na.strings="?")
##
alldata<-read.table(datafile,header=TRUE,sep=";",colClasses=tabclasses,na.strings="?")
##
smalldata<-alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]
x <- paste(smalldata[,1],smalldata[,2])
datetimecol <- strptime(x, "%d/%m/%Y %H:%M:%S")
##
##copy to png device with proper size
png("plot3.png",width=480,height=480)
##
plot(datetimecol, smalldata[,7], type = "l", ylab = "Global Active Power",xlab="")
points(datetimecol, smalldata[,9], type = "l",col="blue")
points(datetimecol, smalldata[,8], type = "l",col="red")
legendvector <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = legendvector, lty =1, col = c("black","red","blue"))
##
##dev.copy(png,"plot3.png")
dev.off()
