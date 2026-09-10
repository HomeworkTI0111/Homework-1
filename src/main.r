data_orig <- read.csv("HW1_bike_sharing.csv")
matriculas <- c(582204, 590055, 582887, 582929)
M <- max(matriculas)
r <- 1 + (M %% 100)

data_group <- data_orig[r:(r + 299), ]
data_group$dteday[1]
data_group$dteday[300]

data_group$total_user <- data_group$casual + data_group$registered
colSums(is.na(data_group))

data_groupinho <- data_group[1:10, ]

#media (sem na.rm pois ja nao tem dados ausentes, idem pros proximos)
colMeans(data_groupinho[, 6:9])
colMeans(data_group[, 6:9])

#mediana (existe uma biblioteca com um colMedians())

median(data_groupinho$temp)
median(data_groupinho$casual)
median(data_groupinho$registered)
median(data_groupinho$total_user)

median(data_group$temp)
median(data_group$casual)
median(data_group$registered)
median(data_group$total_user)

#criando e usando moda
moda <- function(d){
  freq <- table(d)
  valor_moda <- names(freq)[freq == max(freq)]
  freq_moda <- max(freq)
  
  cat("Moda:", valor_moda, "\n")
  cat("Frequencia:", freq_moda, "\n")
}

moda(data_groupinho$season)
moda(data_groupinho$weathersit)

moda(data_group$season)
moda(data_group$weathersit)

#quartil Q1, Q2 e Q3
quantile(data_groupinho$temp, probs = c(0.25, 0.5, 0.75))
quantile(data_groupinho$casual, probs = c(0.25, 0.5, 0.75))
quantile(data_groupinho$registered, probs = c(0.25, 0.5, 0.75))
quantile(data_groupinho$total_user, probs = c(0.25, 0.5, 0.75))

quantile(data_group$temp, probs = c(0.25, 0.5, 0.75))
quantile(data_group$casual, probs = c(0.25, 0.5, 0.75))
quantile(data_group$registered, probs = c(0.25, 0.5, 0.75))
quantile(data_group$total_user, probs = c(0.25, 0.5, 0.75))

# 2.5
Q1_amostra<-quantile(data_groupinho$total_user, 0.25) # cálculo do primeiro quartil (Q1) de total_user
data_groupinho$low_usage<-ifelse(data_groupinho$total_user < Q1_amostra, 1, 0) #Valores que estão abaixo de Q1 recebem 1, se não, recebem 0
baixa_util<-sum(data_groupinho$low_usage) #contagem/soma dos valores que estão abaixo de Q1
prop<-mean(data_groupinho$low_usage)

Q1_amostra
baixa_util
prop

Q1<-quantile(data_group$total_user, 0.25) # cálculo do primeiro quartil (Q1) de total_user
data_group$low_usage<-ifelse(data_group$total_user < Q1, 1, 0) #Valores que estão abaixo de Q1 recebem 1, se não, recebem 0
baixa_utilizacao<-sum(data_group$low_usage) #contagem/soma dos valores que estão abaixo de Q1
proporcao<-mean(data_group$low_usage) #proporção em relação ao todo (média)

Q1
baixa_utilizacao
proporcao

#3.1 

aggregate(total_user~season,data=data_group,FUN=mean) #calculo da media
aggregate(total_user~season,data=data_group,FUN=median) #calculo da mediana
aggregate(total_user~season,data=data_group,FUN=sd) #calculo do desvio padrao
aggregate(low_usage~season,data=data_group,FUN=sum) #calculo do valor absoluto de low usage
aggregate(low_usage~season,data=data_group,FUN=mean) #calculo do valor relativo de low usage
boxplot(total_user~season,data=data_group) #construção do box plot

#3.2
aggregate(total_user~weathersit,data=data_group,FUN=mean)  #calculo da media
aggregate(total_user~weathersit,data=data_group,FUN=sd)  #calculo do desvio padrao
aggregate(low_usage~weathersit,data=data_group,FUN=sum) # valor absoluto de low usage
aggregate(low_usage~weathersit,data=data_group,FUN=mean) # valor relativo de low usage
#Valores observados a partir das funcoes acima e que sao necessarios para construir o grafico 
Media1 <- 4172.522
Media2 <- 3449.971
Media3 <- 1757.571
#Construcao do grafico de barras
barplot(c(Media1,Media2,Media3),names.arg=c("1","2","3"),xlab="Condicoes metereologicas",ylab="Media de total user",main="Media de total user por condicao metereologica")

#3.3
plot(data_group$total_user,data_group$temp) # construcao do grafico de dispersao
cor(data_group$total_user,data_group$temp,method ="pearson") # calculo do coeficiente de correlacao por meio do metodo de pearson
cor(data_group$total_user,data_group$temp,method ="kendall") # calculo do coeficiente de correlacao por meio do metodo de kendall
cor(data_group$total_user,data_group$temp,method ="spearman") # calculo do coeficiente de correlacao por meio do metodo de spearman
