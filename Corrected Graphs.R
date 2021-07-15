
##SETUP##
setwd("~clara/Documents/MAESTRIA/HERRAMIENTAS COMPUTACIONALES/R/Applied-Data-Visualization-with-R-and-ggplot2-master")

library("ggplot2")
library("tibble")
library("gridExtra")
library("dplyr")
library("Lock5Data")
library("ggthemes")
library("fun")
library("zoo")
library("corrplot")
library("maps")
library("mapproj")


df <- read.csv("data/gapminder-data.csv")
df2 <- read.csv("data/xAPI-Edu-Data.csv")
df3 <- read.csv("data/LoanStats.csv")

##Graph 1 ##
graph1 <- ggplot(df, aes(x=gdp_per_capita, y=Electricity_consumption_per_capita)) + 
  geom_point(colour="red", fill="white",size=1,alpha=0.2)+ xlab("GDP") + ylab("Electricity consumption")+ggtitle("Electricity consumption per country", subtitle="Variables measured in per capita") + scale_fill_manual(values = "blue") 

graph1 + facet_wrap(~Country,scale="free_y")


##Graph 2##

library("ggthemes")
install.packages("purrr")
library("purrr")

dfn <- subset(HollywoodMovies, Genre %in% c("Action","Adventure","Comedy","Drama","Romance")
              & LeadStudio %in% c("Fox","Sony","Columbia","Paramount","Disney"))

dfn<- subset(HollywoodMovies, LeadStudio %in% c("Fox","Sony","Columbia","Paramount","Disney")& Genre %in% c("Action","Adventure","Comedy","Drama","Romance"))

p1 <- ggplot(dfn,aes(LeadStudio, WorldGross)) 
p1
p2 <- p1+geom_bar(stat="Identity",aes(fill=Genre),position="dodge")
p2
##Creamos nuestro propio theme 
mytheme <- theme(
  text = element_text(size=7,colour="Black"),
  axis.text = element_text(size=10,color="darkblue"),
  axis.title = element_text(size = rel(2)),
  legend.background=element_rect(fill="white"),
  legend.text=element_text(size=7),
  legend.key.size=unit(0.5, 'cm'),
  legend.position="top",
  plot.title=element_text(size=15),
  plot.title.position="plot", 
  plot.background=element_rect(fill="aliceblue"),
  panel.background=element_rect(fill="white"))
  
p7b <- p2+mytheme+ggtitle("Movie Genre per Studio")+ xlab("Studio") + ylab("Number of Movies") +  scale_fill_brewer(palette="Set3")
p7b

#Graph 3

pd1 <- ggplot(df,aes(x=BMI_male,y=BMI_female))
pd2 <- pd1+geom_point()
pd2
pd3 <- pd1+geom_line(aes(color=Country),size=1)+
  scale_colour_brewer(palette="Set2")
pd3
pd4 <- pd3+theme(axis.title=element_text(size=10,color="black",
                                         face="bold"),
                 plot.title=element_text(color="black",size=15,
                                         face="bold"),
                 panel.background = element_rect(fill="azure2",color="black"),
                 legend.position="none"
                 )+
  xlab("BMI Male")+
  ylab("BMI female")+
  ggtitle("BMI per sex")+facet_wrap(~Country, scale="free_y")
pd4




