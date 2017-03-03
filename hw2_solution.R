#required libraries
library(graphics)
library(haven)
library(ks)
library(scales)
library(FinTS)
library(ccgarch)
library(fGarch)
library(rugarch)

#Selecting the top 5 based on results of LM test ----
p_values <- rep(0,30)

#test for ARCH effects
p_values[1] <- ArchTest(AAPL$Returns, lags=1)$p.value
p_values[2] <- ArchTest(AXP$Returns, lags=1)$p.value
p_values[3] <- ArchTest(BA$Returns, lags=1)$p.value
p_values[4] <- ArchTest(CAT$Returns, lags=1)$p.value
p_values[5] <- ArchTest(CSCO$Returns, lags=1)$p.value
p_values[6] <- ArchTest(CVX$Returns, lags=1)$p.value
p_values[7] <- ArchTest(DD$Returns, lags=1)$p.value
p_values[8] <- ArchTest(DIS$Returns, lags=1)$p.value
p_values[9] <- ArchTest(GE$Returns, lags=1)$p.value
p_values[10] <- ArchTest(GS$Returns, lags=1)$p.value
p_values[11] <- ArchTest(HD$Returns, lags=1)$p.value
p_values[12] <- ArchTest(IBM$Returns, lags=1)$p.value
p_values[13] <- ArchTest(INTC$Returns, lags=1)$p.value
p_values[14] <- ArchTest(JNJ$Returns, lags=1)$p.value
p_values[15] <- ArchTest(JPM$Returns, lags=1)$p.value
p_values[16] <- ArchTest(KO$Returns, lags=1)$p.value
p_values[17] <- ArchTest(MCD$Returns, lags=1)$p.value
p_values[18] <- ArchTest(MMM$Returns, lags=1)$p.value
p_values[19] <- ArchTest(MRK$Returns, lags=1)$p.value
p_values[20] <- ArchTest(MSFT$Returns, lags=1)$p.value
p_values[21] <- ArchTest(NKE$Returns, lags=1)$p.value
p_values[22] <- ArchTest(PFE$Returns, lags=1)$p.value
p_values[23] <- ArchTest(PG$Returns, lags=1)$p.value
p_values[24] <- ArchTest(TRV$Returns, lags=1)$p.value
p_values[25] <- ArchTest(UNH$Returns, lags=1)$p.value
p_values[26] <- ArchTest(UTX$Returns, lags=1)$p.value
p_values[27] <- ArchTest(V$Returns, lags=1)$p.value
p_values[28] <- ArchTest(VZ$Returns, lags=1)$p.value
p_values[29] <- ArchTest(WMT$Returns, lags=1)$p.value
p_values[30] <- ArchTest(XOM$Returns, lags=1)$p.value

#order tickers alphabetically
tickers <- index[order(index)]

#merging name of ticker with p value, then rankings
archtest_results <- data.frame(stock = tickers, p = p_values)

#order data frame by pvalues (ascending order)
archtest_results <- archtest_results[order(archtest_results$p),]

#selecting the top 5
stocks_to_use <- archtest_results[1:5,1]

#Modeling ----


#Forecasting ----

#Ranking ----


