# Data Preparation

v1<-1:100
v2<-scale(v1) # standardize/normalize data
mean(v1)
sd(v1)

# Read the social media data from "snsdata" and check its information
setwd("D:/r")
df<-read.csv("snsdata.csv",header=T) # snsdata - some social media data
ncol(df)
nrow(df)
table(df$age<10)
sum(df$age<10 & !is.na(df$age))
nrow(df[df$age<10,])
length(df$age[df$age<10])

# Select part of data interested and prepare new columns
df$age<-ifelse(df$age>=13 & df$age<=20, df$age, NA) # set ppl with inappropriate age to N/A
age_gradyear<-tapply(df$age, df$gradyear, mean, na.rm=T) # na.rm means remove N/A when computing mean
str(age_gradyear) #structure of age_gradyear
