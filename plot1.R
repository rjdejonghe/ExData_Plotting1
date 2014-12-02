
##############################
### Plot1.R
##############################
### For course project 1
### Exploratory Data Analysis --- Coursera
##############################

### Read in the relevant dates - Feb 1,2 2007
raw_data <- read.table("household_power_consumption.txt", header=TRUE,sep =";")
data <- [raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007",]

### open file
png(file = "plot1.png")

### create histogram
GAP <- as.numeric(as.character(data$Global_active_power)) 
hist(GAP, col="red", xlab="Global Active Power (kilowatts)", breaks=seq(0,8,by=.5), main="Global active power")

### close file
dev.off()
