setwd("/home/thodoris/Courses/DataScience/Exploratory_Data_Analysis/week-1/ExData_Plotting1/")
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)

dataByDate <- split(data, data$"Date")
fd <- dataByDate$"1/2/2007"
sd <- dataByDate$"2/2/2007"

par(mar=c(4,5,4,2))
par(bg=NA, cex=0.8)
X <- c(as.numeric(as.character(fd[,3])), as.numeric(as.character(sd[,3])))
hist(X, col="red", main="Global Active Power", xlab="Global Active Power (killowatts)")
dev.copy(png, file="plot1.png", width=480, height=480, units = "px")
dev.off()
