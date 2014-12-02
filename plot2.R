
##############################
### Plot2.R
##############################
### For course project 1
### Exploratory Data Analysis --- Coursera
##############################

### Read in the relevant dates - Feb 1,2 2007
raw_data <- read.table("household_power_consumption.txt", header=TRUE,sep =";")
data <- [raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007",]

### open file
png(file = "plot2.png")

### create plot
# First get relevant data in relevant form
GAP <- as.numeric(as.character(data$Global_active_power))

raw_dt <- paste(data$Date,data$Time)
posix_dt <- strptime(raw_dt, "%d/%m/%Y %H:%M:%S")

#now make the plot
plot(posix_dt, GAP, type = "l", xaxt = "n", xlab="", ylab="Global active power (kilowatts)")
r <- as.POSIXct(round(range(posix_dt), "hours"))
axis.POSIXct(1,at=seq(r[1],r[2], by="day"), format = "%a")
#hist(GAP, col="red", xlab="Global Active Power (kilowatts)", breaks=seq(0,8,by=.5), main="Global active power")

### close file
dev.off()
