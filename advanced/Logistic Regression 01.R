# General Logistic Regression

# The Logistic Regression is a regression model in which the response variable
# (dependent variable) has categorical values such as True/False or 0/1. 
# It actually measures the probability of a binary response as the value 
# of response variable based on the mathematical equation relating it 
# with the predictor variables.

# The general mathematical equation for logistic regression is ???
# y = 1/(1+e^-(a+b1x1+b2x2+b3x3+...))


# Select some columns form mtcars.
input <- mtcars[,c("am","cyl","hp","wt")]

print(head(input))

input <- mtcars[,c("am","cyl","hp","wt")]

model = glm(formula = am ~ cyl + hp + wt, data = input, family = binomial)


# Show the model.
print(summary(model))
print(model)

# Get the Intercept and coefficients as vector elements.
cat("# # # # The Coefficient Values # # # ","\n")

a0 <- coef(model)[1]
a1 <- coef(model)[2]  
a2 <- coef(model)[3]
a3 <- coef(model)[4]

# Print coefficient for checking
for (i in 1:4)
  print(coef(model)[i])

# For a car with cly = 6, hp = 110 and wt = 2.620 
# the predicted am can be calculated by:
# y = 1/(1+e^-(a+b1x1+b2x2+b3x3+...))
x1 = 6
x2 = 110
x3 = 2.620

Y = 1/(1+exp( -(a0+a1*x1+a2*x2+a3*x3)) )
Y

