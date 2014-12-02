
##############################
### Plot4.R
##############################
### For course project 1
### Exploratory Data Analysis --- Coursera
##############################

### Read in the relevant dates - Feb 1,2 2007
raw_data <- read.table("household_power_consumption.txt", header=TRUE,sep =";")
data <- [raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007",]

### open file
png(file = "plot4.png")

### create plot
# First get relevant data in relevant form
#first plot
GAP <- as.numeric(as.character(data$Global_active_power))

#second plot
Sub1 <- as.numeric(as.character(data$Sub_metering_1))
Sub2 <- as.numeric(as.character(data$Sub_metering_2))
Sub3 <- as.numeric(as.character(data$Sub_metering_3))

#third plot
volts <-  as.numeric(as.character(data$Voltage))

#fourth plot
GRP <- as.numeric(as.character(data$Global_reactive_power))

#all plots
raw_dt <- paste(data$Date,data$Time)
posix_dt <- strptime(raw_dt, "%d/%m/%Y %H:%M:%S")


### setup the 2x2 grid
par(mfcol=c(2,2))

###first plot
#now make the plot
plot(posix_dt, GAP, type = "l", xaxt = "n", xlab="", ylab="Global active power (kilowatts)")
r <- as.POSIXct(round(range(posix_dt), "hours"))
axis.POSIXct(1,at=seq(r[1],r[2], by="day"), format = "%a")

### second plot
plot(posix_dt, Sub1, type = "n", xaxt = "n", xlab="", ylab="Energy sub metering")
# get the x-axis right
r <- as.POSIXct(round(range(posix_dt), "hours"))
axis.POSIXct(1,at=seq(r[1],r[2], by="day"), format = "%a")
# add the three different data sets
points(posix_dt,Sub1,type="l",col="black")
points(posix_dt,Sub2,type="l",col="orange")
points(posix_dt,Sub3,type="l",col="blue")
#add the legend
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","orange","blue"))

### THIRD PLOT
plot(posix_dt, volts, type = "l", xaxt = "n", xlab="datetime", ylab="Voltage")
r <- as.POSIXct(round(range(posix_dt), "hours"))
axis.POSIXct(1,at=seq(r[1],r[2], by="day"), format = "%a")

### FOURTH PLOT
plot(posix_dt, GRP, type = "l", xaxt = "n", xlab="datetime", ylab="Global_reactive_power")
r <- as.POSIXct(round(range(posix_dt), "hours"))
axis.POSIXct(1,at=seq(r[1],r[2], by="day"), format = "%a")

### close file
dev.off()
