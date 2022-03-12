setwd("C:/R/MQCS/Atividade1.2")
getwd()
dir()

a <- read.csv("alunos.mqcs.csv", header = TRUE, sep = ';', dec = ',' , stringsAsFactors = FALSE, encoding = "latin1")
View(a)

head(a)
tail(a)

library(tidyverse)
library(dplyr)

a <- rename(a, altura_cm = Altura..cm.) ## rename (my_data, new name = old name)
a <- rename(a, peso_kg = Peso..kg.
            , ensino_medio = Ensino.médio
            , cor_raca = Cor.ou.raça
            , turno = Turno
            , renda_familiar = Faixa.de.renda.familiar.total
            , classe_social = Classe.social.declarada) 
View(a)

unique(a$ano) ## valores Ãºnicos da coluna 'ano'
class(a$ano) ## classe da coluna 'ano' = "integer"

diurno <- a %>%
  filter(turno != "Noturno")

noturno <- a %>%
  filter(turno != "Diurno")

View(diurno)
View(noturno)

mean(noturno$CR)
mean(diurno$CR)

sd(noturno$CR)
sd(diurno$CR)

## Boxplots de CR por turno

boxplot(a$CR)
boxplot(noturno$CR)
boxplot(diurno$CR)

boxplot(diurno$CR, noturno$CR,
        horizontal = TRUE,
        names = c("Diurno", "Noturno"),
        col = c("light blue", "purple"),
        xlab = "CR",
        ylab = "Turno",
        main = "CR em comparação de turno")

##################################################################
################# Tabela de Contingência #########################
####################################### Qui-Quadrado #############

table(a$cor_raca) ## os dois turnos
table(diurno$cor_raca)
table(noturno$cor_raca)  

## tabela de contingência com duas variáveis 
## cor_raça por ano
table(a$cor_raca, a$ano)
