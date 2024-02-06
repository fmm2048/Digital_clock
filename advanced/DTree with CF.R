# Classification using decision tree
# Evaluate result by confusion matrix
# Case - Breast Cancer

loc <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
ds  <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data"
url <- paste(loc, ds, sep="")

# Read Data
breast <- read.table(url, sep=",", header=FALSE, na.strings="?")
names(breast) <- c("ID", "clumpThickness", "sizeUniformity",
                   "shapeUniformity", "maginalAdhesion", 
                   "singleEpithelialCellSize", "bareNuclei", 
                   "blandChromatin", "normalNucleoli", "mitosis", "class")


# Data manuplilation
df <- breast[-1]  # -1 to take out the first column - ID
# Label the column - class
df$class <- factor(df$class, levels=c(2,4), labels=c("benign", "malignant"))


#  Visualize and summarize data
library(ggplot2)
ggplot(data=df,mapping=aes(x=class,y=clumpThickness))+geom_boxplot()
ggplot(data=df,mapping=aes(x=class,y=clumpThickness))+geom_boxplot()+
  geom_violin(alpha=0.2,colour="green")
summary(df)

# Partition Data to Training (70%) and Testing datasets (30%)
set.seed(1234)  # Random seed
train <- sample(nrow(df), 0.7*nrow(df))
df.train <- df[train,]      # Sampled 70%
df.validate <- df[-train,]  # Remaining 30%
prop.table(table(df.train$class))
prop.table(table(df.validate$class))

# Build the Decision Tree Model
library(rpart)
dtree <- rpart(class ~ ., data=df.train, method="class",      
               parms=list(split="information"))
dtree$cptable
dtree.pruned <- prune(dtree, cp=.0125) # cp = complexity parameter

# Plot tree with rpart - prp function
library(rpart.plot)
prp(dtree.pruned, type = 2, extra = 104,
    fallen.leaves = TRUE, main="Decision Tree")

# plot a trimmed tree using rpart - prp
prp(dtree.pruned)

# Test the model
# predict(dtree.pruned,df.validate,type="class")

cf = table(predict(dtree.pruned,df.validate,type="class"),df.validate$class)

# table(predict(dtree.pruned,df.validate,type="class"))

# Install packages required for the function confusionMatrix
# install.packages('caret', dependencies = TRUE)
# install.packages("Rcpp")
# install.packages("ggplot2")
# install.packages("recipes")

library(caret)
confusionMatrix(cf, positive="benign")



