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
