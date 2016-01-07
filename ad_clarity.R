#ad clarity(ignore)

library(data.table)
positiveCL = fread("~/Documents/Survey/ad clarity/positiveanswers.csv")
negativeCL = fread("~/Documents/Survey/ad clarity/negativeanswers.csv")
neitherCL = fread("~/Documents/Survey/ad clarity/donotknow.csv")

tempCL = merge(positiveCL, negativeCL, by= c("questionId","optionId"))
AdClarity = merge(tempCL, neitherCL, by= c("questionId","optionId"))

#ad clarity vs recall

library(data.table)
RECALL_CL_positive = fread("~/Documents/Survey/ad clarity/recall_positive")
RECALL_CL_negative = fread("~/Documents/Survey/ad clarity/recall_negative")
RECALL_CL_dnk= fread("~/Documents/Survey/ad clarity/recall_dnk")

temp_RECALL_CL = merge(RECALL_CL_positive, RECALL_CL_negative, by= "Clarity")
RECALL_CL = merge(temp_RECALL_CL, RECALL_CL_dnk, by= "Clarity")

RECALL_CL[,positive_ratio := Recall_positive/(Recall_positive+Recall_negative+Recall_dnk)]
RECALL_CL[,negative_ratio := Recall_negative/(Recall_positive+Recall_negative+Recall_dnk)]
RECALL_CL[,dnk_ratio := Recall_dnk/(Recall_positive+Recall_negative+Recall_dnk)]

subsetRECALL_CL <- t(data.frame(RECALL_CL$positive_ratio, RECALL_CL$negative_ratio,RECALL_CL$dnk_ratio))
barplot(subsetRECALL_CL, legend = c("positive", "negative", "do not know"), names.arg=RECALL_CL$Clarity , xlab = "Clarity", ylab = "Ratio of answers", ylim = c(0,2))
abline(h = 0.5, v = NULL, col = "red")

#ad clarity vs relevance

library(data.table)
REL_CL_positive = fread("~/Documents/Survey/ad clarity/relevance_positive")
REL_CL_negative = fread("~/Documents/Survey/ad clarity/relevance_negative")
REL_CL_d3= fread("~/Documents/Survey/ad clarity/relevance_degree3")

temp_REL_CL = merge(REL_CL_positive, REL_CL_negative, by= "Clarity")
REL_CL = merge(temp_REL_CL, REL_CL_d3, by= "Clarity")

REL_CL[,positive_ratio := Relevance_positive/(Relevance_positive+Relevance_negative+Relevance_degree3)]
REL_CL[,negative_ratio := Relevance_negative/(Relevance_positive+Relevance_negative+Relevance_degree3)]
REL_CL[,degree3_ratio := Relevance_degree3/(Relevance_positive+Relevance_negative+Relevance_degree3)]

subsetREL_CL <- t(data.frame(REL_CL$positive_ratio, REL_CL$negative_ratio, REL_CL$degree3_ratio))
barplot(subsetREL_CL, legend = c("positive", "negative", "degree 3"), names.arg=REL_CL$Clarity , xlab = "Clarity", ylab = "Ratio of answers", ylim = c(0,2))

#ad clarity vs intent_Q7

library(data.table)
Q7_CL_positive = fread("~/Documents/Survey/ad clarity/Intent_Q7_positive")
Q7_CL_negative = fread("~/Documents/Survey/ad clarity/Intent_Q7_negative")
Q7_CL_dnk= fread("~/Documents/Survey/ad clarity/Intent_Q7_dnk")

temp_Q7_CL = merge(Q7_CL_positive, Q7_CL_negative, by= "Clarity")
Q7_CL = merge(temp_Q7_CL, Q7_CL_dnk, by= "Clarity")

Q7_CL[,positive_ratio := Intent_Q7_positive/(Intent_Q7_positive+Intent_Q7_negative+Intent_Q7_dnk)]
Q7_CL[,negative_ratio := Intent_Q7_negative/(Intent_Q7_positive+Intent_Q7_negative+Intent_Q7_dnk)]
Q7_CL[,dnk_ratio := Intent_Q7_dnk/(Intent_Q7_positive+Intent_Q7_negative+Intent_Q7_dnk)]

subsetQ7_CL <- t(data.frame(Q7_CL$positive_ratio, Q7_CL$negative_ratio,Q7_CL$dnk_ratio))
barplot(subsetQ7_CL, legend = c("positive", "negative", "do not know"), names.arg=RECALL_CL$Clarity , xlab = "Clarity", ylab = "Ratio of answers", ylim = c(0,2))
abline(h = 0.18, v = NULL, col = "red")

#ad clarity vs intent_Q78

library(data.table)
Q78_CL_positive = fread("~/Documents/Survey/ad clarity/Intent_Q78_ourbrand")
Q78_CL_negative = fread("~/Documents/Survey/ad clarity/Intent_Q78_anotherbrand")
Q78_CL_none= fread("~/Documents/Survey/ad clarity/Intent_Q78_none")

temp_Q78_CL = merge(Q78_CL_positive, Q78_CL_negative, by= "Clarity")
Q78_CL = merge(temp_Q78_CL, Q78_CL_none, by= "Clarity")

Q78_CL[,ourbrand_ratio := Intent_Q78_ourbrand/(Intent_Q78_ourbrand+Intent_Q78_anotherbrand+Intent_Q78_none)]
Q78_CL[,anotherbrand_ratio := Intent_Q78_anotherbrand/(Intent_Q78_ourbrand+Intent_Q78_anotherbrand+Intent_Q78_none)]
Q78_CL[,none_ratio := Intent_Q78_none/(Intent_Q78_ourbrand+Intent_Q78_anotherbrand+Intent_Q78_none)]

subsetQ78_CL <- t(data.frame(Q78_CL$ourbrand_ratio, Q78_CL$anotherbrand_ratio,Q78_CL$none_ratio))
barplot(subsetQ78_CL, legend = c("ourbrand", "anotherbrand", "none"), names.arg=Q78_CL$Clarity , xlab = "Clarity", ylab = "Ratio of answers", ylim = c(0,2))
abline(h = 0.18, v = NULL, col = "red")

#ad clarity - analysis
library(data.table)
clairty_surveyid = fread("~/Documents/Survey/ad clarity/surveyId_adclarity.csv")
positive_adid = fread("~/Documents/Survey/ad clarity/positive_adid.csv")
negative_adid = fread("~/Documents/Survey/ad clarity/negative_adid.csv")

clarity_surveyId_ref = subset(clairty_surveyid, Clarity != 'Do not know')
clarity_surveyId_ref = subset(clarity_surveyId_ref, surveyId != 10)
colnames(clarity_surveyId_ref)[3] = "Total"
agg_clarity <-aggregate(clarity_surveyId_ref$Total, by=list(clarity_surveyId_ref$surveyId), FUN=sum)
colnames(agg_clarity)[1] = "surveyId"

clarity_surveyId_ref = merge(x = clarity_surveyId_ref, y = agg_clarity, by = "surveyId", all.x = TRUE)
colnames(clarity_surveyId_ref)[4] = "G_total"
  
clarity_surveyId_ref[, ratio := Total/G_total]

clarity_surveyId_ref_highneg = clarity_surveyId_ref[which (Clarity == "Not Clear" & ratio > 0.5 & Total != 1),] 
clarity_surveyId_ref_highpos = clarity_surveyId_ref[which (Clarity == "Clear" & ratio > 0.5 & Total > 7),] 

clarity_surveyId_ref_highneg = merge(x = clarity_surveyId_ref_highneg, y = negative_adid, by = "surveyId", all.x = TRUE)
clarity_surveyId_ref_highpos = merge(x = clarity_surveyId_ref_highpos, y = positive_adid, by = "surveyId", all.x = TRUE)

#Correlations:
library(data.table)
rel_corr = fread("~/Documents/Survey/ad clarity/relevance_corr.csv")
rel_corr$answerSetId = NULL
freq_rel = aggregate(rel_corr,by = list(rel_corr$Clarity, rel_corr$Relevance), FUN=NROW)

rm(df_rel)

df_rel <- data.frame(c(3282,2462), c(846,1983), c(257,1863))
colnames(df_rel)[1] = 0
colnames(df_rel)[2] = 1
colnames(df_rel)[3] = 2
rownames(df_rel)[1] = 0
rownames(df_rel)[2] = 1

library(MESS)
gkgamma(df_rel, conf.level = 0.95)

recall_corr = fread("~/Documents/Survey/ad clarity/recall_corr.csv")
freq_recall = aggregate(recall_corr,by = list(recall_corr$Clarity, recall_corr$Recall), FUN=NROW)

df_recall <- data.frame(c(3612,2916), c(720,3177))
colnames(df_recall)[1] = 0
colnames(df_recall)[2] = 1
rownames(df_recall)[1] = 0
rownames(df_recall)[2] = 1

library(MESS)
gkgamma(df_recall, conf.level = 0.95)

recall_intent5 = fread("~/Documents/Survey/ad clarity/intent57_cor.csv")
freq_intent5 = aggregate(recall_intent5,by = list(recall_intent5$Clarity, recall_intent5$Intent), FUN=NROW)

df_intent5 <- data.frame(c(1378,1815),c(30,429))
colnames(df_intent5)[1] = 0
colnames(df_intent5)[2] = 1
rownames(df_intent5)[1] = 0
rownames(df_intent5)[2] = 1

library(MESS)
gkgamma(df_intent5, conf.level = 0.95)

recall_intent85 = fread("~/Documents/Survey/ad clarity/intent7885_cor.csv")
freq_intent85 = aggregate(recall_intent85,by = list(recall_intent85$Clarity, recall_intent85$Intent), FUN=NROW)

df_intent85 <- data.frame(c(1285,815),c(2199,4245),c(503,1253))
colnames(df_intent85)[1] = 0
colnames(df_intent85)[2] = 1
colnames(df_intent85)[3] = 2
rownames(df_intent85)[1] = 0
rownames(df_intent85)[2] = 1

library(MESS)
gkgamma(df_intent85, conf.level = 0.95)