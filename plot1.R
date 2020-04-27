## load the data

data<-read.csv(file="/home/mustafa/Téléchargements/household_power_consumption.txt",header=TRUE,sep=";",quote="\"")

# convert the date variable to Date class

data$Date<-as.Date(data$Date,"%d/%m/%Y")

# Filter Dates for 2007-02-01 and 2007-02-02

data1<-data[(data$Date>= "2007-02-01") & (data$Date <= "2007-02-02"),]
don<-as.numeric(data1$Global_active_power)/1000
png("plot1.png",width=480, height=480)

# Plot 1

hist(don,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
