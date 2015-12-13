data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
dataByDate <- split(data, data$"Date")

fd <- dataByDate$"1/2/2007"
sd <- dataByDate$"2/2/2007"

par(mar=c(4,5,4,2))
par(bg=NA, cex=0.8)
X <- c(as.numeric(as.character(fd[,3])), as.numeric(as.character(sd[,3])))
plot(X, ylab="Global Active Power (kilowatts)", type="l", axes=FALSE, xlab="")
axis(side=2)
axis(side=1, at=c(0, nrow(fd), nrow(fd)+nrow(sd)), labels=c("Thu", "Fri", "Sat"))
box("plot")
dev.copy(png, file="plot2.png", width=480, height=480, units = "px")
dev.off()
