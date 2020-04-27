# load the data
data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",quote="\"")

# convert the date variable to Date class

data$Date<-as.Date(data$Date,"%d/%m/%Y")
data<-data[(data$Date>= "2007-02-01") & (data$Date <= "2007-02-02"),]
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png("plot2.png",width=480, height=480)
plot(data$Time,as.numeric(as.character(data$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)")
dev.off()
