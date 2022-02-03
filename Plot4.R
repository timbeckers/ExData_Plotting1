source("Reading.R")
data<- readingData()

library(ggplot2)
library(reshape2)
library(gridExtra )

png(file="plot4.png",width=480,height=480)

p1 <- data%>%
        ggplot(aes(x=as.POSIXct(Date),y=Global_active_power)) +
        geom_line() +
        theme_bw() +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
        ylab("Global Active Power") + 
        scale_x_datetime(date_breaks = 'day',date_labels = '%a')+
        xlab("")

p2 <- data%>%
        ggplot(aes(x=as.POSIXct(Date),y=Voltage)) +
        geom_line() +
        theme_bw() +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
        ylab("Voltage") + 
        scale_x_datetime(date_breaks = 'day',date_labels = '%a')+
        xlab("")

data$Date <- as.POSIXct(data$Date)
data.long <- melt(data,id="Date",measure = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
p3 <- data.long%>%
        ggplot(aes(x=Date,y=value,colour = variable)) +
        geom_line() +
        theme_bw() +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
        ylab("Energy sub metering") + 
        scale_x_datetime(date_breaks = 'day',date_labels = '%a')+
        xlab("") +
        scale_color_manual(values=c("black","red","blue")) +
        theme(legend.position = c(0.75,0.50),legend.title = element_blank(),legend.background = elemnt_blank())


p4 <- data%>%
        ggplot(aes(x=as.POSIXct(Date),y=Global_reactive_power)) +
        geom_line() +
        theme_bw() +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
        ylab("Global Reactive Power") + 
        scale_x_datetime(date_breaks = 'day',date_labels = '%a')+
        xlab("")

grid.arrange(p1, p2, p3, p4, nrow = 2)

dev.off()