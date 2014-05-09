# load data into R
temp<-tempfile()
file <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file,temp)
data <-read.table(unz(temp,"household_power_consumption.txt"),skip=66637,nrows=2880,sep=';',na.string='?')
unlink(temp)

# convert the Date and Time variables to Date/Time class in R
data$V1<-as.Date(data$V1,format='%d/%m/%Y')
data$V2<-strftime(strptime(data$V2,format="%H:%M:%S"),format='%H:%M:%S')

#combine Date and Time into a single variable
x<-as.POSIXct(paste(hell$V1,hell$V2),format="%Y-%m-%d %H:%M:%S")

#plot
png(filename='Plot4.png',width=480,height=480,units='px')
par(mfrow=c(2,2))
plot(x,hell$V3,xlab='',ylab="Global Active Power (kilowatts)",type='l')
plot(x,hell$V5,xlab='datetime',ylab="Voltage",type='l')
plot(x,hell$V7,xlab='',ylab="Energy Sub Metting",type='l')
lines(x,hell$V8,col='red')
lines(x,hell$V9,col='blue')
legend("topright",c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"),lty=c(1,1,1),col=c('black','red','blue'),box.lwd = 0,bty = "n")
plot(x,hell$V4,xlab='datetime',ylab="Global_reactive_power",type='l')
dev.off()