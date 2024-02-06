# To grab stock data from yahoo.com

install.packages("quantmod")
library(quantmod)
getSymbols("1398.HK",src="yahoo",from="2016-01-01",auto.assign=T)
colnames(`1398.HK`)
`1398.HK`
