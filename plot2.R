# Dataget
data <- read.csv("household_power_consumption.txt",sep = ";", header = TRUE,stringsAsFactors = FALSE)
data_selected <-subset(data,as.Date(strptime(data$Date,"%d/%m/%Y"))>="2007-02-01" & as.Date(strptime(data$Date,"%d/%m/%Y"))<="2007-02-02")
data_plot <- data_selected
data_plot$Global_active_power <- as.numeric(data_plot$Global_active_power)
data_plot$Global_reactive_power <-as.numeric(data_plot$Global_reactive_power)
data_plot$Voltage <-as.numeric(data_plot$Voltage)
data_plot$Sub_metering_1 <- as.numeric(data_plot$Sub_metering_1)
data_plot$Sub_metering_2 <- as.numeric(data_plot$Sub_metering_2)
data_plot$Sub_metering_3 <- as.numeric(data_plot$Sub_metering_3)
data_plot <- cbind(data_plot, datetime = strptime(paste(data_plot$Date,data_plot$Time),"%d/%m/%Y %H:%M:%S"))


#Plot 2
with(data_plot,plot(datetime,Global_active_power,type = "l",ylab = "Energy sub metering",xlab = ""))
dev.copy(png,file="plot2.png")
dev.off()
