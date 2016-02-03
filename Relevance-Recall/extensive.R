#Continuation of relevance-recall study with purchase intent added

library(data.table)
rel_rel_int = fread("~/Downloads/rel_rec_int.tsv")
rel_rel_int_Q7 = fread("~/Downloads/question7.tsv")

rel45_recyes = subset(rel_rel_int, Relevance == '2' & Recall == '1')
rel45_recno = subset(rel_rel_int, Relevance == '2' & Recall == '0')

rel45_recyes_Q7 = subset(rel_rel_int_Q7, Relevance == '2' & Recall == '1')
rel45_recno_Q7 = subset(rel_rel_int_Q7, Relevance == '2' & Recall == '0')

rel12_recyes = subset(rel_rel_int, Relevance == '0' & Recall == '1')
rel12_recno = subset(rel_rel_int, Relevance == '0' & Recall == '0')

rel12_recyes_Q7 = subset(rel_rel_int_Q7, Relevance == '0' & Recall == '1')
rel12_recno_Q7 = subset(rel_rel_int_Q7, Relevance == '0' & Recall == '0')

#Ref group instead of Recall
ref_group = fread("~/Downloads/refgroup.tsv")

rel45_refT = subset(ref_group, Relevance == '2' & ReferenceGroup == TRUE)
rel45_refF = subset(ref_group, Relevance == '2' & ReferenceGroup == FALSE)

rel3_refT = subset(ref_group, Relevance == '1' & ReferenceGroup == TRUE)
rel3_refF = subset(ref_group, Relevance == '1' & ReferenceGroup == FALSE)

rel12_refT = subset(ref_group, Relevance == '0' & ReferenceGroup == TRUE)
rel12_refF = subset(ref_group, Relevance == '0' & ReferenceGroup == FALSE)

#Recall vs BA

recall_ba = fread("~/Downloads/recall_ba.tsv")

recyes = subset(recall_ba, Recall == '1')
recno = subset(recall_ba, Recall == '0')
ba_another= subset(recall_ba, Brand_Awareness == 'another brand')
ba_our = subset(recall_ba, Brand_Awareness == 'our brand')
ba_none= subset(recall_ba, Brand_Awareness == 'none')



#Recall vs BI

recall_bi = fread("~/Downloads/recall_bi.tsv")

recyes_bi = subset(recall_bi, Recall == '1')
recno_bi = subset(recall_bi, Recall == '0')

ref_bi = fread("~/Downloads/ref_bi.tsv")

refT_bi = subset(ref_bi, ReferenceGroup == TRUE)
refF_bi = subset(ref_bi, ReferenceGroup == FALSE)

#Recommender Score

library(bit64)
rm(d_score)

rec_score = fread("~/Downloads/RecommenderScore")
uid_recall = fread("~/Downloads/uid_rec_rel_int.tsv")
colnames(rec_score) = c("surveyid","originaladid","surveyadid","uid","answersetid","Recommender_Score")
rec_score_NOTNULL = subset(rec_score, rec_score$Recommender_Score <= 5.1)

joined_uid_recscore = merge(rec_score_NOTNULL, uid_recall, by = c("answersetid","uid","surveyid") )

rel_5 = subset(joined_uid_recscore, Relevance == 5)
mean(as.numeric(rel_5$Recommender_Score))

rel_4 = subset(joined_uid_recscore, Relevance == 4)
mean(as.numeric(rel_4$Recommender_Score))

rel_3 = subset(joined_uid_recscore, Relevance == 3)
mean(as.numeric(rel_3$Recommender_Score))

rel_2 = subset(joined_uid_recscore, Relevance == 2)
mean(as.numeric(rel_2$Recommender_Score))

rel_1 = subset(joined_uid_recscore, Relevance == 1)
mean(as.numeric(rel_1$Recommender_Score))

rec_0 = subset(joined_uid_recscore, Recall == 0)
mean(as.numeric(rec_0$Recommender_Score))


rec_1 = subset(joined_uid_recscore, Recall == 1)
mean(as.numeric(rec_1$Recommender_Score))

int_none = subset(joined_uid_recscore, Intent == "none")
mean(as.numeric(int_none$Recommender_Score))

int_our = subset(joined_uid_recscore, Intent == "our brand")
mean(as.numeric(int_our$Recommender_Score))

int_another = subset(joined_uid_recscore, Intent == "another brand")
mean(as.numeric(int_another$Recommender_Score))

library(polycor)
polyserial(as.numeric(joined_uid_recscore$Recommender_Score), joined_uid_recscore$Relevance, ML = FALSE, control = list(), std.err = FALSE, maxcor=.9999, bins=4)



rec_score = fread("~/Downloads/RecommenderScore")
uid_rel = fread("~/Downloads/uid_rel.tsv")
colnames(rec_score) = c("surveyid","originaladid","surveyadid","uid","answersetid","Recommender_Score")
rec_score_NOTNULL = subset(rec_score, rec_score$Recommender_Score <= 5.1)

rel_recscore = merge(rec_score_NOTNULL, uid_rel, by = c("answersetid","uid","surveyid") )

rel_5 = subset(rel_recscore, Relevance == 5)
mean(as.numeric(rel_5$Recommender_Score))

rel_4 = subset(rel_recscore, Relevance == 4)
mean(as.numeric(rel_4$Recommender_Score))

rel_3 = subset(rel_recscore, Relevance == 3)
mean(as.numeric(rel_3$Recommender_Score))

rel_2 = subset(rel_recscore, Relevance == 2)
mean(as.numeric(rel_2$Recommender_Score))

rel_1 = subset(rel_recscore, Relevance == 1)
mean(as.numeric(rel_1$Recommender_Score))

