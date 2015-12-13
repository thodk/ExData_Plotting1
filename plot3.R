data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)

dataByDate <- split(data, data$"Date")
fd <- dataByDate$"1/2/2007"
sd <- dataByDate$"2/2/2007"

par(mar=c(4,5,4,2))
par(bg=NA, cex=0.8)
X1 <- c(as.numeric(as.character(fd[,7])), as.numeric(as.character(sd[,7])))
X2 <- c(as.numeric(as.character(fd[,8])), as.numeric(as.character(sd[,8])))
X3 <- c(as.numeric(as.character(fd[,9])), as.numeric(as.character(sd[,9])))
plot(X1 ,ylab="Energy sub metering", col="black", type="l", axes=FALSE, xlab="")
lines(X2, col="red")
lines(X3, col="blue")
axis(side=2)
axis(side=1, at=c(0, nrow(fd), nrow(fd)+nrow(sd)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=c(1,1,1), col=c("black", "blue", "red"), legend=names(fd)[7:9])
box("plot")
dev.copy(png, file="plot3.png", width=480, height=480, units = "px")
dev.off()
