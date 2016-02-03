#Average adrecall rates for panorama and takeover formats using AdRecall table

library(data.table)
panorama= fread("~/Downloads/panorama_final")
takeover = fread("~/Downloads/takeoever_final")

colnames(panorama) = c("adid","total","average_ad_recall")
colnames(takeover) = c("adid","total","average_ad_recall")

mean(panorama$average_ad_recall)
mean(takeover$average_ad_recall)
