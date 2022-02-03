source("Reading.R")
data<- readingData()

library(ggplot2)
library(reshape2)

data$Date <- as.POSIXct(data$Date)
data.long <- melt(data,id="Date",measure = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png(file="plot3.png",width=480,height=480)

data.long%>%
        ggplot(aes(x=Date,y=value,colour = variable)) +
        geom_line() +
        theme_bw() +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
        ylab("Energy sub metering") + 
        scale_x_datetime(date_breaks = 'day',date_labels = '%a')+
        xlab("") +
        scale_color_manual(values=c("black","red","blue")) +
        theme(legend.position = c(0.85,0.9),legend.title = element_blank())
dev.off()
