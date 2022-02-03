source("Reading.R")
data<- readingData()

png(file="plot2.png",width=480,height=480)
data%>%
        ggplot(aes(x=as.POSIXct(Date),y=Global_active_power)) +
        geom_line() +
        theme_bw() +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
        ylab("Global Active Power (Kilowatt)") + 
        scale_x_datetime(date_breaks = 'day',date_labels = '%a')+
        xlab("")

dev.off()

