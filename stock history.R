#Financial Analytics HW2
#Rose Nyameke
#This file downloads csvs directly from Yahoo Finance to use for this homework assignment

#Date range is March 1 2014 to Feb 24 2017. However, March 1 was a Saturday, so data starts on March 3

#set your working directory to match where you want the files to go
setwd("C:/Users/Rose Nyameke/OneDrive - North Carolina State University/Classes/Spring/Spring 1/Financial Analytics/hw2/Stocks")

#the tickers for the 30 stocks in the Dow Jones
index <- c("AAPL", "AXP", "BA", "CAT", "CSCO", "CVX",
           "KO", "DD", "XOM", "GE", "GS", "HD",
           "IBM", "INTC", "JNJ", "JPM", "MCD", "MMM", 
           "MRK", "MSFT", "NKE", "PFE", "PG", "TRV", 
           "UNH", "UTX", "V", "VZ", "WMT", "DIS")

#create urls for CSVs. Getting for one day ahead of time, so that we can have a lag for the first day of interest
base <- "http://chart.finance.yahoo.com/table.csv?s="
remainder <- "&a=1&b=28&c=2014&d=1&e=24&f=2017&g=d&ignore=.csv"
full_urls <- paste(base,index,remainder, sep = "")

#loop over urls and download the csvs
for (i in 1:30){
    download.file(full_urls[i], destfile = paste(index[i], "csv", sep = "."))
}

#getting all the csv files from working directory to read them in as data frames
files <- list.files(pattern = "*.csv", full.names = F)

for (i in seq_along(files)){
    assign(index[i], read.csv(files[i]))
}


#creating function to simplify return calculation
#calculates return as log of (adjusted close price/ lag of adjusted close price), based on Dr. L's macro
return_calc <- function(dataset){
    
    #ensure that data set is sorted by date
    dataset <- dataset[order(dataset$Date),]
    
    #calculate lags. puts a zero in the first spot
    lags <- c(0, dataset$Adj.Close)
    
    #remove the last value of adj.close in the lags column
    lags<- lags[-length(lags)]
    
    #merge with the data set
    dataset$Lags <- lags
    
    #calculate returns
    dataset$Returns <- log(dataset$Adj.Close/dataset$Lags)
    return(dataset)
}

AAPL <- return_calc(AAPL)
AXP<- return_calc(AXP)
BA<- return_calc(BA)
CAT<- return_calc(CAT)
CSCO<- return_calc(CSCO)
CVX<- return_calc(CVX)
KO<- return_calc(KO)
DD<- return_calc(DD)
XOM<- return_calc(XOM)
GE<- return_calc(GE)
GS<- return_calc(GS)
HD<- return_calc(HD)
IBM<- return_calc(IBM)
INTC<- return_calc(INTC)
JNJ<- return_calc(JNJ)
JPM<- return_calc(JPM)
MCD<- return_calc(MCD)
MMM<- return_calc(MMM)
MRK<- return_calc(MRK)
MSFT<- return_calc(MSFT)
NKE<- return_calc(NKE)
PFE<- return_calc(PFE)
PG<- return_calc(PG)
TRV<- return_calc(TRV)
UNH<- return_calc(UNH)
UTX<- return_calc(UTX)
V<- return_calc(V)
VZ<- return_calc(VZ)
WMT <- return_calc(WMT)
DIS <- return_calc(DIS)
