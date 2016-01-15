df <- data.frame(Relevance=c(0,0,1,1,2,2), Recall=c(0, 1,0,1,0,1), freq=c(712,507,449,704,236,710))
library(data.table)
dt <- data.table(df)
dt.expanded <- dt[ ,list(freq=rep(1,freq)),by=c("Relevance","Recall")]
dt.expanded[ ,freq := NULL]
dt.expanded

library(polycor)
polychor(dt.expanded$Relevance,dt.expanded$Recall)


library(vcdExtra)
GKgamma(df)

df_temp <- data.frame("1"=c(712,449,236), "2"=c(507,704,710))
colnames(df_temp)[1] = 0
colnames(df_temp)[2] = 1
rownames(df_temp)[1] = 0
rownames(df_temp)[2] = 1
rownames(df_temp)[3] = 2

df_temp

library(vcdExtra)
GKgamma(df_temp)

library(MESS)
gkgamma(df_temp, conf.level = 0.95)

#recall-relevance inscreen plus surveys for further studies


