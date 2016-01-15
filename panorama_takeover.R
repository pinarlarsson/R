#panorama survey + requestlog results

library(data.table)
panorama = fread("~/Downloads/Panorama_survey")
colnames(panorama) = c("adspace_id","premium_level", "survey_id","originaladid", "surveyadid","format","market","uid", "answersetid","questionid","optionid","deliveries","viewableimps")

takeover1 = fread("~/Downloads/4cc86a3f-bfd5-4d8b-97f4-cd268cc22625-000000")
colnames(takeover1) = c("adspace_id","premium_level", "survey_id","originaladid", "surveyadid","format","market","uid", "answersetid","questionid","optionid","deliveries","viewableimps")

takeover2 = fread("~/Downloads/takeover2_survey")
colnames(takeover2) = c("adspace_id","premium_level", "survey_id","originaladid", "surveyadid","format","market","uid", "answersetid","questionid","optionid","deliveries","viewableimps")

panorama_recall = subset(panorama, questionid == 84)
panorama_recall_positive = subset(panorama_recall, optionid == 259)
panorama_recall_negative = subset(panorama_recall, optionid == 258)

takeover1_recall = subset(takeover1, questionid == 28)
takeover1_recall_positive = subset(takeover1_recall, optionid == 77)
takeover1_recall_negative = subset(takeover1_recall, optionid == 78)

takeover2_recall = subset(takeover2, questionid == 28)
takeover2_recall_positive = subset(takeover2_recall, optionid == 77)
takeover2_recall_negative = subset(takeover2_recall, optionid == 78)

takeover =  rbind(takeover1, takeover2)
rm(takeover1_recall, takeover2_recall)

takeover_recall = subset(takeover, questionid == 28)
takeover_recall_positive = subset(takeover_recall, optionid == 77)
takeover_recall_negative = subset(takeover_recall, optionid == 78)