data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)

#set plot parameters
par(mar=c(4,5,4,2))
par(mfrow=c(2,2))
par(bg=NA, cex=0.8)

dataByDate <- split(data, data$"Date")
fd <- dataByDate$"1/2/2007"
sd <- dataByDate$"2/2/2007"
ticks <- c(0, nrow(fd), nrow(fd)+nrow(sd))

# PLOT 1
X1 <- c(as.numeric(as.character(fd[,3])), as.numeric(as.character(sd[,3])))
plot(X1, ylab="Global Active Power", type="l", axes=FALSE, xlab="", cex=0.25)
axis(side=2)
axis(side=1, at=ticks, labels=c("Thu", "Fri", "Sat"))
box("plot")
# PLOT 2
X2 <- c(as.numeric(as.character(fd[,5])), as.numeric(as.character(sd[,5])))
plot(X2, ylab="Voltage", type="l", axes=FALSE, xlab="datetime")
axis(side=2)
axis(side=1, at=ticks, labels=c("Thu", "Fri", "Sat"))
box("plot")
# PLOT 3
X31 <- c(as.numeric(as.character(fd[,7])), as.numeric(as.character(sd[,7])))
X32 <- c(as.numeric(as.character(fd[,8])), as.numeric(as.character(sd[,8])))
X33 <- c(as.numeric(as.character(fd[,9])), as.numeric(as.character(sd[,9])))
plot(X31 ,ylab="Energy sub metering", col="black", type="l", axes=FALSE, xlab="")
points(X32, col="red", type="l")
points(X33, col="blue", type="l")
axis(side=2)
axis(side=1, at=ticks, labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=c(1,1,1), col=c("black", "blue", "red"), legend=names(fd)[7:9], cex=0.5, bty = "n")
box("plot")
# PLOT 4
X4 <- c(as.numeric(as.character(fd[,4])), as.numeric(as.character(sd[,4])))
plot(X4, ylab="Global_reactive_power", type="l", axes=FALSE, xlab="datetime")
axis(side=2)
axis(side=1, at=ticks, labels=c("Thu", "Fri", "Sat"))
box("plot")
# CREATE PNG
dev.copy(png, file="plot4.png", width=480, height=480, units = "px")
dev.off()



