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