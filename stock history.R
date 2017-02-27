#Financial Analytics HW2
#Rose Nyameke
#This file downloads csvs directly from Yahoo Finance to use for this homework assignment

#set your working directory to match where you want the files to go
setwd("C:/Users/Rose Nyameke/OneDrive - North Carolina State University/Classes/Spring/Spring 1/Financial Analytics/hw2/Stocks")

#the tickers for the 30 stocks in the Dow Jones
index <- c("AAPL", "AXP", "BA", "CAT", "CSCO", "CVX",
           "KO", "DD", "XOM", "GE", "GS", "HD",
           "IBM", "INTC", "JNJ", "JPM", "MCD", "MMM", 
           "MRK", "MSFT", "NKE", "PFE", "PG", "TRV", 
           "UNH", "UTX", "V", "VZ", "WMT", "DIS")

#create urls for CSVs
base <- "http://chart.finance.yahoo.com/table.csv?s="
remainder <- "&a=2&b=1&c=2014&d=1&e=24&f=2017&g=d&ignore=.csv"
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
#calculates return as Close - Open. Will be positive if net gain, negative if loss.
#Rounds to 2 decimal places to avoid issues with floating point precision
return_calc <- function(dataset){
    dataset$Returns <- round(dataset$Close - dataset$Open, digits = 2)
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
