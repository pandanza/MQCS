setwd("C:/R/MQCS/Atividade1")
getwd()
dir()

a <- read.csv("Atividade1.csv", header = TRUE, sep = ',', dec = ',' , stringsAsFactors = FALSE, encoding = "latin1")
View(a)

library(tidyverse)

unique(a$UF)

#########################################################
############################ COM SP #####################
#########################################################

summary(a$Pop_Estimada) #  Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
sd(a$Pop_Estimada) # standard deviation

boxplot(a$Pop_Estimada)
hist(a$Pop_Estimada)
qqnorm(a$Pop_Estimada)
qqline(a$Pop_Estimada, col = "red")

#########################################################
############################ SEM SP #####################
#########################################################

#############################################
######## Select function ####################
####################### Does not work #######

c <- a %>%
  select(a$UF != "SP")

c <- a %>%
  select(UF != "SP")

## Select (and optionally rename) variables in a data frame,
## using a concise mini-language that makes it easy to refer to variables based on their name
## (e.g. a:f selects all columns from a on the left to f on the right).

#############################################
######## Filter function ####################
#############################################

b <- a %>%
  filter(UF != "SP")
## The filter() function is used to subset a data frame, 
## retaining all rows that satisfy your conditions

nrow(b[b$UF == "SP",])  # verificar se há 'SP'

summary(b$Pop_Estimada)
sd(b$Pop_Estimada)

boxplot(b$Pop_Estimada)
hist(b$Pop_Estimada)
qqnorm(b$Pop_Estimada)
qqline(b$Pop_Estimada, col = "dark red")

#############################################
################ Tirar 'Cod. UF" ############
############################################# 

c <- a %>%
  select(-c(Cod_UF)) ## 'Select' works here ## 
View(c)
