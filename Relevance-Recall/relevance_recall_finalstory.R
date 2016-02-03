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

library(bit64)
library(data.table)
negrel_posrec= fread("~/Downloads/negrelevance_posrecall")
posrel_negrec = fread("~/Downloads/posrelevance_negrecall")

colnames(negrel_posrec) = c("adSpaceId","premiumLevel","surveyid","originalAdId","surveyAdId",
                            "format","market","uid","answersetid","questionid","questiontext",
                            "optionid","optiontext","deliveries","viewableimps")


colnames(posrel_negrec) = c("adSpaceId","premiumLevel","surveyid","originalAdId","surveyAdId",
                            "format","market","uid","answersetid","questionid","questiontext",
                            "optionid","optiontext","deliveries","viewableimps")



posrec= fread("~/Downloads/posrecall")
negrec = fread("~/Downloads/negrecall")

colnames(posrec) = c("adSpaceId","premiumLevel","surveyid","originalAdId","surveyAdId",
                            "format","market","uid","answersetid","questionid","questiontext",
                            "optionid","optiontext","deliveries","viewableimps")


colnames(negrec) = c("adSpaceId","premiumLevel","surveyid","originalAdId","surveyAdId",
                            "format","market","uid","answersetid","questionid","questiontext",
                            "optionid","optiontext","deliveries","viewableimps")


temp = subset(posrec, questionid == 2 | questionid == 17 | questionid == 28 | questionid == 35 | questionid == 46 | questionid == 56 | questionid == 69 | questionid == 84)
correct_pos = subset(posrec, answersetid %in% temp$answersetid)
temp2 = subset(negrec, questionid == 2 | questionid == 17 | questionid == 28 | questionid == 35 | questionid == 46 | questionid == 56 | questionid == 69 | questionid == 84)
correct_neg = subset(negrec, answersetid %in% temp2$answersetid)

correct_pos_45 = subset(correct_pos, optiontext == '4' | optiontext == '5')
correct_pos_3 = subset(correct_pos, optiontext == '3')
correct_pos_12 = subset(correct_pos, optiontext == '1' | optiontext == '2')

correct_neg_45 = subset(correct_neg, optiontext == '4' | optiontext == '5')
correct_neg_3 = subset(correct_neg, optiontext == '3')
correct_neg_12 = subset(correct_neg, optiontext == '1' | optiontext == '2')

except_liars = subset(correct_pos, viewableimps > 0)

correct_pos_45_exceptliars = subset(except_liars, optiontext == '4' | optiontext == '5')
correct_pos_3_exceptliars = subset(except_liars, optiontext == '3')
correct_pos_12_exceptliars = subset(except_liars, optiontext == '1' | optiontext == '2')

#Until now i have highly positive evidence that relevance is driving recall since positive recall answer do not give any guarantee for
#a positive relevance but other way around is highly probable; people who feel relevant to the ad tend to remember the ad more.

#Now we are going to check whether people who did see the ad (probably) tend to NOT remember the ads that they do not feel relevant to.

test = subset(correct_neg, viewableimps > 0)
test_45 = subset(test, optiontext == '4' | optiontext == '5')
test_3 = subset(test, optiontext == '3')
test_12 = subset(test, optiontext == '1' | optiontext == '2')

#recall vs p.intent
df_temp2 <- data.frame("1"=c(7940,3026,3985,3067), "2"=c(3050,1879,3580,4101))
colnames(df_temp2)[1] = 0
colnames(df_temp2)[2] = 1
rownames(df_temp2)[1] = 0
rownames(df_temp2)[2] = 1
rownames(df_temp2)[3] = 2
rownames(df_temp2)[4] = 3


library(vcdExtra)
GKgamma(df_temp2)

library(MESS)
gkgamma(df_temp2, conf.level = 0.95)

#recall vs BA (a bit creepy)

df_temp3 <- data.frame("1"=c(7099,14334), "2"=c(2830,11802))
colnames(df_temp3)[1] = 0
colnames(df_temp3)[2] = 1
rownames(df_temp3)[1] = 0
rownames(df_temp3)[2] = 1


library(vcdExtra)
GKgamma(df_temp3)

library(MESS)
gkgamma(df_temp3, conf.level = 0.95)


#recall vs B_ATT

df_temp4 <- data.frame("1"=c(2256,2883,1750), "2"=c(811,1614,2016))
colnames(df_temp4)[1] = 0
colnames(df_temp4)[2] = 1
rownames(df_temp4)[1] = 0
rownames(df_temp4)[2] = 1
rownames(df_temp4)[3] = 2

library(vcdExtra)
GKgamma(df_temp4)

library(MESS)
gkgamma(df_temp4, conf.level = 0.95)

#recall vs Brand Image

df_temp5 <- data.frame("1"=c(2892,2677,1946), "2"=c(1082,1538,1833))
colnames(df_temp5)[1] = 0
colnames(df_temp5)[2] = 1
rownames(df_temp5)[1] = 0
rownames(df_temp5)[2] = 1
rownames(df_temp5)[3] = 2

library(vcdExtra)
GKgamma(df_temp5)

library(MESS)
gkgamma(df_temp5, conf.level = 0.95)



#recall vs p.intent (another approach)

df_temp6 <- data.frame("1"=c(1743,891,550,202), "2"=c(551,548,637,288))
colnames(df_temp6)[1] = 0
colnames(df_temp6)[2] = 1
rownames(df_temp6)[1] = 0
rownames(df_temp6)[2] = 1
rownames(df_temp6)[3] = 2
rownames(df_temp6)[4] = 3

library(vcdExtra)
GKgamma(df_temp6)

library(MESS)
gkgamma(df_temp6, conf.level = 0.95)

df_temp7 <- data.frame("1"=c(6197,2135,3435,1508,1357), "2"=c(2499,1331,2943,1868,1945))
colnames(df_temp7)[1] = 0
colnames(df_temp7)[2] = 1
rownames(df_temp7)[1] = 0
rownames(df_temp7)[2] = 1
rownames(df_temp7)[3] = 2
rownames(df_temp7)[4] = 3
rownames(df_temp7)[5] = 4

library(vcdExtra)
GKgamma(df_temp7)

library(MESS)
gkgamma(df_temp7, conf.level = 0.95)


df_temp8 <- data.frame("1"=c(1079,
                             379,
                             367,
                             798,
                             1157,
                             761,
                             305,
                             240,
                             220), "2"=c(218,
                                         123,
                                         142,
                                         369,
                                         591,
                                         566,
                                         370,
                                         326,
                                         405))

library(vcdExtra)
GKgamma(df_temp8)

library(MESS)
gkgamma(df_temp8, conf.level = 0.95)