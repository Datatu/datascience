#q1
setwd('/home/cadu/Desktop/Coursera/datasciencecoursera/Get_And_Cleaning_Data/quiz4')
data <- read.csv("getdata-data-ss06hid.csv")
names(data)[123]
strsplit(names(data)[123], 'wgtp')

#q2
dataGDP <- read.csv("getdata-data-GDP.csv")
cleanedData <- gsub(",", "", dataGDP[5:194, 5])
numData <- as.numeric(cleanedData)
mean(numData)

#q3
countryNames <- dataGDP[5:194,4]
class(countryNames)
grep("^United",countryNames)
grep("*United",countryNames)

#q4
newGdpData <- dataGDP[6:194, c(1, 2, 4, 5)]
colnames(newGdpData) <- c("CountryCode", "Ranking", "Economy", "GDP")
rownames(newGdpData) <- NULL # renumbering
educationData <- read.csv("getdata-data-EDSTATS_Country.csv")
names(educationData)
mergedData <- merge(newGdpData, educationData, by.x="CountryCode", by.y="CountryCode", all=TRUE)
head(mergedData)
names(mergedData) <- tolower(names(mergedData))
a <- as.character(mergedData[,13])
length(grep("Fiscal year end: June", a))

#q5
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)

install.packages('lubridate')
library('lubridate')
sampleTimes <- index(amzn)
length(sampleTimes)
bool1 <- year(sampleTimes) == 2012
length(sampleTimes[bool1]) # 250
bool2 <- weekdays(sampleTimes)=="Monday"
length(sampleTimes[bool1 & bool2]) # 47