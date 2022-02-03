
readingData <- function(){

#Getting the data
if(!file.exists("./data")){dir.create("./data")}

if(!file.exists("./data/datas.zip")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl,"./data/datas.zip")
        unzip("./data/datas.zip",exdir="./data")  
}


#-------------------------------------------------------------------------------
#'Reading the datas

rawdata = read.table("./data/household_power_consumption.txt",header=T, sep=";",na.strings=("?"))

library(dplyr)
#Date & time in date classes and in one column
x<-paste(rawdata$Date,rawdata$Time)
rawdata<-rawdata%>%
        mutate(Date=strptime(x,"%d/%m/%Y %H:%M:%OS"))%>%
        select(-Time)

#-------------------------------------------------------------------------------
#'Subset only measure between 2007-02-01 and 2007-02-02

startdate <- strptime("2007-02-01","%Y-%m-%d")
enddate <- strptime("2007-02-02 23:59","%Y-%m-%d %H:%M")

datafiltered <- rawdata%>% filter(Date >= startdate & Date <= enddate)

}