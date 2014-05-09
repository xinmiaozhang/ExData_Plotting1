# load data into R
temp<-tempfile()
file <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file,temp)
data <-read.table(unz(temp,"household_power_consumption.txt"),skip=66637,nrows=2880,sep=';',na.string='?')
unlink(temp)

# convert the Date and Time variables to Date/Time class in R
data$V1<-as.Date(data$V1,format='%d/%m/%Y')
data$V2<-strftime(strptime(data$V2,format="%H:%M:%S"),format='%H:%M:%S')

#plot
png(filename='Plot1.png',width=480,height=480,units='px')
hist(hell$V3,xlab="Global Active Power (kilowatts)",main='Global Active Power',col='red')
dev.off()