datafile <- "household_power_consumption.txt"
tab5rows <- read.table(datafile,header = TRUE, sep = ";", nrow =5 )
##
tabclasses<-sapply(tab5rows,class)
data<-read.table(datafile,header=TRUE,sep=";",colClasses=tabclasses,na.strings="?")
##
alldata<-read.table(datafile,header=TRUE,sep=";",colClasses=tabclasses,na.strings="?")
##
smalldata<-alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]
##copy to png device with proper size
png("plot1.png",width=480,height=480)
##
plotdata<-smalldata[,3]
hist(plotdata,col="red")
hist(plotdata,col="red", main="Global Active Power",xlab="GLobal Active Power(Kilowatts)")
hist(plotdata,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="frequency")
##
## dev.copy(png,"plot1.png")
dev.off()
