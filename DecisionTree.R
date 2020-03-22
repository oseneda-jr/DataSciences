#Author DataFlair
#Building decision trees

#Importação das biblitoecas essenciais
library(rpart)
library(readr)
library(caTools)
library(dplyr)
library(party)
library(partykit)
library(rpart.plot)

#leitura de dados e instanciação de variáveis
titanic_data <- "https://goo.gl/At238b" %>%  #DataFlair
  read.csv %>% # read in the data
  select(survived, embarked, sex, 
         sibsp, parch, fare) %>%
  mutate(embarked = factor(embarked),
         sex = factor(sex))

#Divisão dos dados em treinamento e teste
set.seed(123)
sample_data = sample.split(titanic_data, SplitRatio = 0.75)
train_data <- subset(titanic_data, sample_data == TRUE)
test_data <- subset(titanic_data, sample_data == FALSE)

#plotagem da árvore
rtree <- rpart(survived ~ ., train_data)
rpart.plot(rtree)

ctree_ <- ctree(survived ~ ., train_data)
plot(ctree_)
