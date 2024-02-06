# Visualizing data with R, using the mtcars dataset

install.packages("tidyverse")
library(tidyverse)

#To show the scatterplot for the attributes displ and hwy in dataset mpg
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))

#To add the smoothing line which indicates the regression line 
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+
  geom_smooth(mapping=aes(x=displ,y=hwy),method="lm")

#To show the regression line without the confident interval
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+
  geom_smooth(mapping=aes(x=displ,y=hwy),method="lm",se=F)

#To show the scatterplots for different classes in the dataset mpg
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+
  geom_smooth(mapping=aes(x=displ,y=hwy),method="lm")+facet_wrap(~class,nrow=2)

#To show the scatterplots for different drv types and number of cylinders
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_grid(drv~cyl)

#To show the scatterplots with colours showing different classes 
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,color=class))

#To show only the regression line for the class subcompact 
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+geom_point(mapping=aes(color=class))+
  geom_smooth(data=filter(mpg,class=="subcompact"))

#To show the scatterplot when the attribute in the x-axis is category variable
ggplot(data=mpg,mapping=aes(x=drv,y=hwy))+geom_point()

#In this case it would be better to use geom_jitter() in order to better separate the dots
ggplot(data=mpg,mapping=aes(x=drv,y=hwy))+geom_jitter(mapping=aes(color=drv))

#To draw the histogram with number of bins=20
ggplot(data=mpg,mapping=aes(x=hwy))+geom_histogram(color="darkgreen",fill="white",bins=20)
ggplot(data=mpg)+geom_histogram(mapping=aes(x=hwy),bins=20)

#To draw the bar chart with x-axis=cut
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=cut))

#To draw the bar chart with x-axis=cut and for each bar it is filled with the field clarity
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=clarity))
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=clarity),position="fill")
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=clarity),position="dodge")

#To show the boxplot which shows the distibution of the values in hwy based on different values of drv
ggplot(data=mpg,mapping=aes(x=drv,y=hwy))+geom_boxplot()

#Another interesting way to show the distribution of the values in hwy based on different values in drv
ggplot(data=mpg)+stat_summary(mapping=aes(x=drv,y=hwy),fun.ymin=min,fun.ymax=max,fun.y=median)

#To show the violion plot which shows the probabity density function of the attribute value hwy based on different drv values
ggplot(data=mpg,mapping=aes(x=drv,y=hwy))+geom_violin()

#To show a simple line chart for economic data
ggplot(data=economics,mapping=aes(x=date,y=uempmed))+geom_line()

# To show the same line chart with color overlays
presidential<-subset(presidential,start>economics$date[1])
ggplot(economics)+
  geom_rect(aes(xmin=start,xmax=end,fill=party),ymin=-Inf,ymax=Inf,alpha=0.2,
            data=presidential)+
  geom_line(aes(date,unemploy))+
  geom_vline(aes(xintercept=as.numeric(start)),data=presidential,
             colour="grey50",alpha=0.5)+
  geom_text(aes(x=start,y=2500,label=name),
            data=presidential,size=3,vjust=0,hjust=0,nudge_x=50) 

#To show the line chart with dots grouped by one particular category attribute
install.packages("nlme")
library(nlme)
library(ggplot2)
ggplot(Oxboys,aes(age,height,group=Subject))+geom_line()+geom_point()
