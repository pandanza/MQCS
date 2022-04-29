setwd("C:/R/MQCS/Atividade1.2")
getwd()
dir()

a <- read.csv("alunos.mqcs.csv", header = TRUE, sep = ';', dec = ',' , stringsAsFactors = TRUE, encoding = "latin1")
View(a)
str(a)

library(tidyverse)
library(dplyr)

a <- rename(a, altura_cm = Altura..cm.
            , peso_kg = Peso..kg.
            , ensino_medio = Ensino.médio
            , cor_raca = Cor.ou.raça
            , turno = Turno
            , renda_familiar = Faixa.de.renda.familiar.total
            , classe_social = Classe.social.declarada) 
View(a)

class(a$renda_familiar) ## factor
unique(a$renda_familiar) ## Levels

##############################################################################
################### Variáveis Categóricas ####################################
##############################################################################

b <- a %>%
  select(c(ano, turno, classe_social, cor_raca, ensino_medio))
View(b)

class(b$ano) ## integer
class(b$turno) ## factor
class(b$classe_social) ## factor
class(b$cor_raca) ## factor
class(b$ensino_medio) ## factor

unique(b$classe_social) ## levels 'A', 'B', 'C', 'D', 'E'
unique(b$cor_raca) ## Levels 'Amarela', 'Branca', 'Parda', 'Preta'

########################################################
############ Tabela de Contingência ####################
########################################################

table(b$classe_social)
table(b$cor_raca)
table(b$ano, b$cor_raca)
table(b$turno, b$cor_raca)
table(b$ensino_medio, b$cor_raca)

########################################################
############ Variáveis #################################
################# Classe social e Cor raça #############
############################# Qui-Quadrado #############
########################################################

table(b$classe_social, b$cor_raca)

##### chisq.test {stats}
#### Pearson's Chi-squared Test for Count Data
#### Description: chisq.test performs chi-squared contingency table tests and goodness-of-fit tests.

social_class <- b$classe_social
colored <- b$cor_raca

chisq.test(social_class, colored, correct = TRUE)

########################################################
######################### X² ###########################
########################################################

# df = (c-1) * (l-1)
# x² = ((o - e)²)/e
