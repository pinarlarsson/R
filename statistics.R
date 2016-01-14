#Recommender system study

# More parameters

library(data.table)
s1 = fread("~/Documents/Recommender_system_study/1")
s2 = fread("~/Documents/Recommender_system_study/2")
s3 = fread("~/Documents/Recommender_system_study/3")
s4 = fread("~/Documents/Recommender_system_study/4")
s5 = fread("~/Documents/Recommender_system_study/5")
s6 = fread("~/Documents/Recommender_system_study/6")
s7 = fread("~/Documents/Recommender_system_study/7")
s8 = fread("~/Documents/Recommender_system_study/8")
s9 = fread("~/Documents/Recommender_system_study/9")
s10 = fread("~/Documents/Recommender_system_study/10")
s11 = fread("~/Documents/Recommender_system_study/11")
s12 = fread("~/Documents/Recommender_system_study/12")
s13 = fread("~/Documents/Recommender_system_study/13")
s14 = fread("~/Documents/Recommender_system_study/14")
s15 = fread("~/Documents/Recommender_system_study/15")
s16 = fread("~/Documents/Recommender_system_study/16")
s17 = fread("~/Documents/Recommender_system_study/17")
s18 = fread("~/Documents/Recommender_system_study/18") 

dev_stat = rbind(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18)
rm(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18)

colnames(dev_stat) = c("Device_id","Model", "Total","Min relevance", "Min recall","Min totalviewtime","Min relativeviewtime","Max relevance", "Max recall","Max totalviewtime","Max relativeviewtime","Average Ad Relevance","Average Ad Recall","Average TotalViewTime","Average RelativeViewTime","SD Ad Relevance","SD Ad Recall","SD TotalViewTime","SD RelativeViewTime")



###Extra shit
ss1 = fread("~/Downloads/1")
ss2 = fread("~/Downloads/2")
ss3 = fread("~/Downloads/3")
ss4 = fread("~/Downloads/4")
ss5 = fread("~/Downloads/5")
ss6 = fread("~/Downloads/6")
ss7 = fread("~/Downloads/7")
ss8 = fread("~/Downloads/8")
ss9 = fread("~/Downloads/9")
ss10 = fread("~/Downloads/10")
ss11 = fread("~/Downloads/11")
ss12 = fread("~/Downloads/12")
ss13 = fread("~/Downloads/13")
ss14 = fread("~/Downloads/14")
ss15 = fread("~/Downloads/15")
ss16 = fread("~/Downloads/16")
ss17 = fread("~/Downloads/17")
ss18 = fread("~/Downloads/18")
ss19 = fread("~/Downloads/19")

dev_stat_shit = rbind(ss1,ss2,ss3,ss4,ss5,ss6,ss7,ss8,ss9,ss10,ss11,ss12,ss13,ss14,ss15,ss16,ss17,ss18,ss19)
rm(ss1,ss2,ss3,ss4,ss5,ss6,ss7,ss8,ss9,ss10,ss11,ss12,ss13,ss14,ss15,ss16,ss17,ss18,ss19)
colnames(dev_stat_shit) = c("Device_id","Total","Average Ad Relevance","Average Ad Recall","Average TotalViewTime","Average RelativeViewTime","SD Ad Relevance","SD Ad Recall","SD TotalViewTime","SD RelativeViewTime")

dev_stat_temp = merge(dev_stat, dev_stat_shit, by = "Device_id")
rm(temp)

dev_stat_temp$Total.x = NULL
dev_stat_temp$`Average Ad Recall.x`= NULL
dev_stat_temp$`Average Ad Relevance.x`= NULL
dev_stat_temp$`Average TotalViewTime.x` = NULL
dev_stat_temp$`Average RelativeViewTime.x` = NULL
dev_stat_temp$`SD Ad Recall.x`= NULL
dev_stat_temp$`SD Ad Relevance.x`= NULL
dev_stat_temp$`SD TotalViewTime.x` = NULL
dev_stat_temp$`SD RelativeViewTime.x` = NULL

colnames(dev_stat_temp) = c("Device id","Model", "Min relevance", "Min recall","Min totalviewtime","Min relativeviewtime","Max relevance", "Max recall","Max totalviewtime","Max relativeviewtime","Total","Average Ad Relevance","Average Ad Recall","Average TotalViewTime","Average RelativeViewTime","SD Ad Relevance","SD Ad Recall","SD TotalViewTime","SD RelativeViewTime")
dev_stat_refined = subset(dev_stat_temp, Total >= 300)
dev_stat_shit_refined = subset(dev_stat_shit, Total >= 300)

##extended with ad

library(data.table)
library(bit64)
sss1 = fread("~/Downloads/Recommender_system_study/extended2/1")
sss2 = fread("~/Documents/Recommender_system_study/extended2/2")
sss3 = fread("~/Documents/Recommender_system_study/extended2/3")
sss4 = fread("~/Documents/Recommender_system_study/extended2/4")
sss5 = fread("~/Documents/Recommender_system_study/extended2/5")
sss6 = fread("~/Documents/Recommender_system_study/extended2/6")
sss7 = fread("~/Documents/Recommender_system_study/extended2/7")
sss8 = fread("~/Documents/Recommender_system_study/extended2/8")
sss9 = fread("~/Documents/Recommender_system_study/extended2/9")
sss10 = fread("~/Documents/Recommender_system_study/extended2/10")
sss11 = fread("~/Documents/Recommender_system_study/extended2/11")
sss12 = fread("~/Documents/Recommender_system_study/extended2/12")
sss13 = fread("~/Documents/Recommender_system_study/extended2/13")
sss14 = fread("~/Documents/Recommender_system_study/extended2/14")
sss15 = fread("~/Documents/Recommender_system_study/extended2/15")
sss16 = fread("~/Documents/Recommender_system_study/extended2/16")
sss17 = fread("~/Documents/Recommender_system_study/extended2/17")
sss18 = fread("~/Documents/Recommender_system_study/extended2/18")

dev_stat_extended2 = rbind(sss1,sss2,sss3,sss4,sss5,sss6,sss7,sss8,sss9,sss10,sss11,sss12,sss13,sss14,sss15,sss16,sss17,sss18)
rm(sss1,sss2,sss3,sss4,sss5,sss6,sss7,sss8,sss9,sss10,sss11,sss12,sss13,sss14,sss15,sss16,sss17,sss18)
colnames(dev_stat_extended2) = c("adid", "Device_id","Total","Average TotalViewTime","Average RelativeViewTime","Average Ad Relevance","Average Ad Recall","SD TotalViewTime","SD RelativeViewTime","SD Ad Relevance","SD Ad Recall")

nb_of_devices = aggregate(dev_stat_extended2$`Device id`, by = list(dev_stat_extended2$adid), FUN = NROW)
nb_of_ads = aggregate(dev_stat_extended2$adid, by = list(dev_stat_extended2$`Device id`), FUN = NROW)

subset_d_100222 = subset(dev_stat_final, Device_id == 100222)
subset_d_107943 = subset(dev_stat_final, Device_id == 107943)
subset_d_103013 = subset(dev_stat_final, Device_id == 103013)
subset_d_102719 = subset(dev_stat_final, Device_id == 102719)
subset_d_102387 = subset(dev_stat_final, Device_id == 102387)
subset_d_100023 = subset(dev_stat_final, Device_id == 100023)
subset_d_104919 = subset(dev_stat_final, Device_id == 104919)
subset_d_105725 = subset(dev_stat_final, Device_id == 105725)
36389subset_d_iphone = subset(dev_stat_final, Device_id == 102719 | Device_id == 103010 | Device_id == 103013 | Device_id == 104772 | Device_id == 104776 | Device_id == 110833 | Device_id == 110834 | Device_id == 100000 | Device_id == 101767 | Device_id == 102387 | Device_id == 102388)

subset_37590 = subset(dev_stat_final, adid == 37590)
subset_34121 = subset(dev_stat_final, adid == 34121)
subset_36389 = subset(dev_stat_final, adid == 36389)
subset_36388 = subset(dev_stat_final, adid == 36388)
subset_36390 = subset(dev_stat_final, adid == 36390)
subset_36413 = subset(dev_stat_final, adid == 36413)
subset_37552 = subset(dev_stat_final, adid == 37552)
subset_33068 = subset(dev_stat_final, adid == 33068)
subset_37735 = subset(dev_stat_final, adid == 37735)
subset_35907 = subset(dev_stat_final, adid == 35907)
subset_37275 = subset(dev_stat_final, adid == 37275)

usable_ads = subset(nb_of_devices, x >= 80)
#from usable ads table
subset_35605 = subset(dev_stat_final, adid == 35605)
subset_37597 = subset(dev_stat_final, adid == 37597)
subset_36387 = subset(dev_stat_final, adid == 36387)

#test for 5 top ads
subset_34888 = subset(dev_stat_final, adid == 34888)
subset_35772 = subset(dev_stat_final, adid == 35772)
subset_36304 = subset(dev_stat_final, adid == 36304)
subset_36806 = subset(dev_stat_final, adid == 36806)
subset_36541 = subset(dev_stat_final, adid == 36541)


#additions (click vs vs)
library(data.table)
ss0 = fread("~/Downloads/0")
ss1 = fread("~/Downloads/1")
ss2 = fread("~/Downloads/2")
ss3 = fread("~/Downloads/3")
ss4 = fread("~/Downloads/4")
ss5 = fread("~/Downloads/5")
ss6 = fread("~/Downloads/6")
ss7 = fread("~/Downloads/7")
ss8 = fread("~/Downloads/8")
ss9 = fread("~/Downloads/9")
ss10 = fread("~/Downloads/10")
ss11 = fread("~/Downloads/11")
ss12 = fread("~/Downloads/12")
ss13 = fread("~/Downloads/13")
ss14 = fread("~/Downloads/14")
ss15 = fread("~/Downloads/15")
ss16 = fread("~/Downloads/16")
ss17 = fread("~/Downloads/17")

dev_stat_additions = rbind(ss0, ss1,ss2,ss3,ss4,ss5,ss6,ss7,ss8,ss9,ss10,ss11,ss12,ss13,ss14,ss15,ss16,ss17)
rm(ss0,ss1,ss2,ss3,ss4,ss5,ss6,ss7,ss8,ss9,ss10,ss11,ss12,ss13,ss14,ss15,ss16,ss17)

colnames(dev_stat_additions) = c("adid", "Device_id","Total","Average SwipeCount","Average ClickCount","Average CloseCount","SD SwipeCount","SD ClickCount","SD CloseCount")


dev_stat_final = merge(dev_stat_extended2,dev_stat_additions, by=c("adid", "Device_id","Total"))
setcolorder(dev_stat_final, c(1,2,3,4,5,6,7,12,13,14,8,9,10,11,15,16,17))

rm(dev_stat_additions, dev_stat_extended2)

#testing device vs totalviewtime
subset_28863 = subset(dev_stat_final, adid == 28863)
subset_26596 = subset(dev_stat_final, adid == 26596)
subset_24041 = subset(dev_stat_final, adid == 24041)
subset_27253 = subset(dev_stat_final, adid == 27253)
subset_37590 = subset(dev_stat_final, adid == 37590)
subset_35846 = subset(dev_stat_final, adid == 35846)
subset_37503 = subset(dev_stat_final, adid == 37503)
subset_34888 = subset(dev_stat_final, adid == 34888)
subset_36897 = subset(dev_stat_final, adid == 36897)
subset_36304 = subset(dev_stat_final, adid == 36304)
subset_34792 = subset(dev_stat_final, adid == 34792)
subset_37286 = subset(dev_stat_final, adid == 37286)
subset_35772 = subset(dev_stat_final, adid == 35772)
subset_36155 = subset(dev_stat_final, adid == 36155)
subset_35846 = subset(dev_stat_final, adid == 35846)
subset_34792 = subset(dev_stat_final, adid == 34792)
subset_36540 = subset(dev_stat_final, adid == 36540)

