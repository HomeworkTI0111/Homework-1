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
boxplot(total_user~season,data=data_group,col="skyblue") #construção do box plot
data_groupinho_season1 <- data_groupinho # Como groupinho tem 10 casos da estacao 1 ent serve para ser analisado
data_groupinho_season2 <- head(data_group[data_group$season == 2, ], 10)
data_groupinho_season3 <- head(data_group[data_group$season == 3, ], 10)
data_groupinho_season4 <- head(data_group[data_group$season == 4, ], 10)# criacao das 10 primeiras amostras de cada estacao
aggregate(total_user~season,data=data_groupinho_season1,FUN=mean) #calculo da media da amostra de season 1
aggregate(total_user~season,data=data_groupinho_season1,FUN=median) #calculo da mediana da amostra de season1 
aggregate(total_user~season,data=data_groupinho_season1,FUN=sd) #calculo do desvio padrao da amostra de season 1 
aggregate(total_user~season,data=data_groupinho_season2,FUN=mean) #calculo da media da amostra de season 2
aggregate(total_user~season,data=data_groupinho_season2,FUN=median) #calculo da mediana da amostra de season 2
aggregate(total_user~season,data=data_groupinho_season2,FUN=sd) #calculo do desvio padrao da amostra de season 2 
aggregate(total_user~season,data=data_groupinho_season3,FUN=mean) #calculo da media da amostra de season 3
aggregate(total_user~season,data=data_groupinho_season3,FUN=median) #calculo da mediana da amostra de season 3
aggregate(total_user~season,data=data_groupinho_season3,FUN=sd) #calculo do desvio padrao da amostra de season 3
aggregate(total_user~season,data=data_groupinho_season4,FUN=mean) #calculo da media da amostra de season 4
aggregate(total_user~season,data=data_groupinho_season4,FUN=median) #calculo da mediana da amostra de season 4
aggregate(total_user~season,data=data_groupinho_season4,FUN=sd) #calculo do desvio padrao da amostra de season 4
Q1_amostra_season1<-quantile(data_groupinho_season1$total_user, 0.25) # cálculo do primeiro quartil (Q1) de total_user na amostra de season 1 
data_groupinho_season1$low_usage<-ifelse(data_groupinho_season1$total_user < Q1_amostra_season1, 1, 0) #Valores que estão abaixo de Q1 recebem 1, se não, recebem 0
Q1_amostra_season2<-quantile(data_groupinho_season2$total_user, 0.25) # cálculo do primeiro quartil (Q1) de total_user na amostra de season 2
data_groupinho_season2$low_usage<-ifelse(data_groupinho_season2$total_user < Q1_amostra_season2, 1, 0) #Valores que estão abaixo de Q1 recebem 1, se não, recebem 0
Q1_amostra_season3<-quantile(data_groupinho_season3$total_user, 0.25) # cálculo do primeiro quartil (Q1) de total_user na amostra de season 3
data_groupinho_season3$low_usage<-ifelse(data_groupinho_season3$total_user < Q1_amostra_season2, 1, 0) #Valores que estão abaixo de Q1 recebem 1, se não, recebem 0
Q1_amostra_season4<-quantile(data_groupinho_season4$total_user, 0.25) # cálculo do primeiro quartil (Q1) de total_user na amostra de season 4
data_groupinho_season4$low_usage<-ifelse(data_groupinho_season4$total_user < Q1_amostra_season4, 1, 0) #Valores que estão abaixo de Q1 recebem 1, se não, recebem 0
#essas etapas foram feitas para redefinir low_usage de forma adequada em cada uma das amostras
aggregate(low_usage~season,data=data_groupinho_season1,FUN=sum) #calculo do valor absoluto de low usage na amostra de season 1
aggregate(low_usage~season,data=data_groupinho_season1,FUN=mean) #calculo do valor relativo de low usage na amostra de season 1
aggregate(low_usage~season,data=data_groupinho_season2,FUN=sum) #calculo do valor absoluto de low usage na amostra de season 2
aggregate(low_usage~season,data=data_groupinho_season2,FUN=mean) #calculo do valor relativo de low usage na amostra de season 2
aggregate(low_usage~season,data=data_groupinho_season3,FUN=sum) #calculo do valor absoluto de low usage na amostra de season 3
aggregate(low_usage~season,data=data_groupinho_season3,FUN=mean) #calculo do valor relativo de low usage na amostra de season 3
aggregate(low_usage~season,data=data_groupinho_season4,FUN=sum) #calculo do valor absoluto de low usage na amostra de season 4
aggregate(low_usage~season,data=data_groupinho_season4,FUN=mean) #calculo do valor relativo de low usage na amostra de season 4
boxplot(data_groupinho_season1$total_user,data_groupinho_season2$total_user,data_groupinho_season3$total_user,data_groupinho_season4$total_user,names=c("1","2","3","4"),col="skyblue",xlab="season",ylab="total user") #construção do box plot das amostraas

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
barplot(c(Media1,Media2,Media3),names.arg=c("1","2","3"),col=c("skyblue","orange","grey"),xlab="Condicoes meteorologicas",ylab="Media de total user",main="Media de total user por condicao meteorologica")
#Criacao dos grupos de amostra para cada condicao meteorologica
data_groupinho_weathersit1 <- head(data_group[data_group$weathersit == 1, ], 10)
data_groupinho_weathersit2 <- head(data_group[data_group$weathersit == 2, ], 10)
data_groupinho_weathersit3 <- head(data_group[data_group$weathersit == 3, ], 10)
aggregate(total_user~weathersit,data=data_groupinho_weathersit1,FUN=mean)  #calculo da media da amostra de weathersit 1
aggregate(total_user~weathersit,data=data_groupinho_weathersit1,FUN=sd)  #calculo do desvio padrao da amostra de weathersit 1
aggregate(total_user~weathersit,data=data_groupinho_weathersit2,FUN=mean)  #calculo da media da amostra de weathersit 2
aggregate(total_user~weathersit,data=data_groupinho_weathersit2,FUN=sd)  #calculo do desvio padrao da amostra de weathersit 2
aggregate(total_user~weathersit,data=data_groupinho_weathersit3,FUN=mean)  #calculo da media da amostra de weathersit 3
aggregate(total_user~weathersit,data=data_groupinho_weathersit3,FUN=sd)  #calculo do desvio padrao da amostra de weathersit 3
#Modificacao de low usage em cada um deles
Q1_amostra_weathersit1<-quantile(data_groupinho_weathersit1$total_user, 0.25) # cálculo do primeiro quartil (Q1) de total_user na amostra de weathersit 1 
data_groupinho_weathersit1$low_usage<-ifelse(data_groupinho_weathersit1$total_user < Q1_amostra_weathersit1, 1, 0) #Valores que estão abaixo de Q1 recebem 1, se não, recebem 0
Q1_amostra_weathersit2<-quantile(data_groupinho_weathersit2$total_user, 0.25) # cálculo do primeiro quartil (Q1) de total_user na amostra de weathersit 2
data_groupinho_weathersit2$low_usage<-ifelse(data_groupinho_weathersit2$total_user < Q1_amostra_weathersit2, 1, 0) #Valores que estão abaixo de Q1 recebem 1, se não, recebem 0
Q1_amostra_weathersit3<-quantile(data_groupinho_weathersit3$total_user, 0.25) # cálculo do primeiro quartil (Q1) de total_user na amostra de weathersit 3
data_groupinho_weathersit3$low_usage<-ifelse(data_groupinho_weathersit3$total_user < Q1_amostra_weathersit3, 1, 0) #Valores que estão abaixo de Q1 recebem 1, se não, recebem 0
# Calculos com low usage
aggregate(low_usage~weathersit,data=data_groupinho_weathersit1,FUN=sum) # valor absoluto de low usage na amostra de weathersit 1
aggregate(low_usage~weathersit,data=data_groupinho_weathersit1,FUN=mean) # valor relativo de low usage na amostra de weathersit 1
aggregate(low_usage~weathersit,data=data_groupinho_weathersit2,FUN=sum) # valor absoluto de low usage na amostra de weathersit 2
aggregate(low_usage~weathersit,data=data_groupinho_weathersit2,FUN=mean) # valor relativo de low usage na amostra de weathersit 2
aggregate(low_usage~weathersit,data=data_groupinho_weathersit3,FUN=sum) # valor absoluto de low usage na amostra de weathersit 3
aggregate(low_usage~weathersit,data=data_groupinho_weathersit3,FUN=mean) # valor relativo de low usage na amostra de weathersit 3
#Valores necessarios para construir o grafico 
Media_groupinho1 <- mean(data_groupinho_weathersit1$total_user)
Media_groupinho2 <- mean(data_groupinho_weathersit2$total_user)
Media_groupinho3 <- mean(data_groupinho_weathersit3$total_user)
#Grafico
barplot(c(Media_groupinho1,Media_groupinho2,Media_groupinho3),names.arg=c("1","2","3"),col=c("skyblue","orange","grey"),xlab="Condicoes meteorologicas",ylab="Media de total user",main="Media de total user por condicao meteorologica")
#3.3
plot(data_group$total_user,data_group$temp,xlab="total user",ylab="temperatura") # construcao do grafico de dispersao
cor(data_group$total_user,data_group$temp,method ="pearson") # calculo do coeficiente de correlacao por meio do metodo de pearson
cor(data_group$total_user,data_group$temp,method ="kendall") # calculo do coeficiente de correlacao por meio do metodo de kendall
cor(data_group$total_user,data_group$temp,method ="spearman") # calculo do coeficiente de correlacao por meio do metodo de spearman
plot(data_groupinho$total_user,data_groupinho$temp,xlab="total user",ylab="temperatura") # construcao do grafico de dispersao da amostra da tempemperatura que é apenas o groupinho
cor(data_groupinho$total_user,data_groupinho$temp,method ="pearson") # calculo do coeficiente de correlacao da amostra por meio do metodo de pearson
cor(data_groupinho$total_user,data_groupinho$temp,method ="kendall") # calculo do coeficiente de correlacao da amostra por meio do metodo de kendall
cor(data_groupinho$total_user,data_groupinho$temp,method ="spearman") # calculo do coeficiente de correlacao da amostra por meio do metodo de spearman




# 4.1
datas <- as.Date(data_group$dteday)
dia_inicio <- as.numeric(format(datas[1], "%j"))
total_user_ts <- ts(data_group$total_user, start = c(2011, dia_inicio), freq = 365)

plot(total_user_ts,
	xaxt = "n",
	lwd = 2,
	main = "Serie Temporal - Total de Usuarios",
	xlab = "Ano", 
	ylab = "Total de Usuarios")
marcadores_datas <- seq(from = datas[1], to = max(datas), by = "1 month")
rotulos <- format(marcadores_datas, "%b/%Y")
posicoes_rotulos <- as.numeric(format(marcadores_datas, "%Y")) + (as.numeric(format(marcadores_datas, "%j")) - 1) / 365
axis(side = 1, at = posicoes_rotulos, labels = rotulos)


# 4.3
quartil_1_group <- quantile(data_group$total_user, probs = 0.25)
plot(data_group$total_user, data_group$temp, 
	xlab = "Usuarios totais", 
	ylab = "Temperatura (C)")
abline(v = quartil_1_group, col = "red", lty = 2)
abline(h = mean(data_group$temp), col = "blue", lty = 2)

