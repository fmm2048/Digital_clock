# Parition tables and extracting data from a large table

install.packages("ggplot2")
library("ggplot2")
data <- read.csv(file="insurance.csv", header=TRUE, sep=",")

# Check basic table information
colnames(data)
nrow(data)
ncol(data)

# Show column data in table form
table(data$sex)

# prop = proportion, tabulate data in fractional format
prop.table(table(data$sex))

table(data$region)
table(data$region,data$sex)

# To show the number of smokers per gender
table(data$sex,data$smoker)

# To show the proportion of smokers per gender
prop.table(table(data$sex,data$smoker),margin=1)
prop.table(table(data$sex,data$smoker),margin=2)

ggplot(data, aes(x=sex, y = charges)) + geom_boxplot()
ggplot(data, aes(x=smoker, y = charges)) + geom_boxplot()

#Filtering/Subsetting [row, column]
df1<-data[data$charges<40000,]
df2<-data[data$charges<40000 & data$sex == "male"]
df3<-data[ (data$sex=="female" & data$charges<30000) | 
             (data$sex=="male" & data$charges<40000), ]


df<- read.csv(file="insurance.csv", header=TRUE, sep=",")
colnames(data)
cor(df$charges,df$age) # Cor - calculate correlation between variables

ggplot(data=df,mapping=aes(x=age,y=charges))+geom_point() + geom_smooth(method="lm")

# Extract columns from a data set
cor_df<-cor(df[c{"age","bmi","children","charges")])

# raw_data<-read.csv("wisc_bc_data.csv",header=T,stringsAsFactors = F)
