#inscreen for panorama vs takeover

library(data.table)
del1 = fread("~/Downloads/1.csv")
del2 = fread("~/Downloads/2.csv")
del3 = fread("~/Downloads/3.csv")

tempdel = rbind(del1,del2)
dt_1510 = rbind(tempdel,del3)
colnames(dt_1510)[1] = "adid"
colnames(dt_1510)[2] = "percentage"
colnames(dt_1510)[3] = "total time"

dt1510_35398 = subset(dt_1510, adid == 35398)
dt1510_35869 = subset(dt_1510, adid == 35869)
dt1510_35398 = dt1510_35398[order(dt1510_35398$percentage),]
dt1510_35869 = dt1510_35869[order(dt1510_35869$percentage),]

sub_1510 <- t(data.frame(dt1510_35398$`total time`, dt1510_35869$`total time`))
barplot(sub_1510, legend = c("panorama", "takeover"), names.arg=dt1510_35869$percentage ,beside=TRUE, xlab = "Percentage", ylab = "Inscreen msc", ylim = c(0,19313832))

#SAME CAMPAIGN

library(data.table)
new1 = fread("~/Downloads/new1.csv")
new2 = fread("~/Downloads/new2.csv")
new3 = fread("~/Downloads/new3.csv")
new4 = fread("~/Downloads/new4.csv")
new5 = fread("~/Downloads/new5.csv")
new6 = fread("~/Downloads/new6.csv")
new7 = fread("~/Downloads/new7.csv")
new8 = fread("~/Downloads/new8.csv")

Campaign10633 = rbind(new1,new2,new3,new4,new5,new6,new7,new8)

colnames(Campaign10633)[1] = "adid"
colnames(Campaign10633)[2] = "percentage"
colnames(Campaign10633)[3] = "date"
colnames(Campaign10633)[4] = "total time"

Campaign10633_38206 = subset(Campaign10633, adid == 38206)
Campaign10633_38208 = subset(Campaign10633, adid == 38208)
Campaign10633_38206 = Campaign10633_38206[order(Campaign10633_38206$date, Campaign10633_38206$percentage),]
Campaign10633_38208 = Campaign10633_38208[order(Campaign10633_38208$date, Campaign10633_38208$percentage),]

Campaign10633_38206_1 = subset(Campaign10633_38206, date == '2015-12-07')
Campaign10633_38208_1 = subset(Campaign10633_38208, date == '2015-12-07')
Campaign10633_38206_2 = subset(Campaign10633_38206, date == '2015-12-08')
Campaign10633_38208_2 = subset(Campaign10633_38208, date == '2015-12-08')

sub_10633_1 <- t(data.frame(Campaign10633_38206_1$`total time`, Campaign10633_38208_1 $`total time`))
barplot(sub_10633_1, legend = c("takeover","panorama"), names.arg=Campaign10633_38206_1$percentage ,beside=TRUE, xlab = "Percentage", ylab = "Inscreen msc",ylim=c(0,295953419))

sub_10633_2 <- t(data.frame(Campaign10633_38206_2$`total time`, Campaign10633_38208_2 $`total time`))
barplot(sub_10633_2,  names.arg=Campaign10633_38206_2$percentage ,beside=TRUE, xlab = "Percentage", ylab = "Inscreen msc",ylim=c(0,321526076))


new9 = fread("~/Downloads/1")
new10 = fread("~/Downloads/2")
new11 = fread("~/Downloads/3")
new12 = fread("~/Downloads/4")
new13 = fread("~/Downloads/5")
new14 = fread("~/Downloads/6")
new15 = fread("~/Downloads/7")
new16 = fread("~/Downloads/8")
new17 = fread("~/Downloads/9")
new18 = fread("~/Downloads/10")
new19 = fread("~/Downloads/11")
new20 = fread("~/Downloads/12")

Campaign10633_v2 = rbind(new9,new10,new11,new12,new13,new14,new15,new16,new17,new18,new19,new20)

colnames(Campaign10633_v2)[1] = "adid"
colnames(Campaign10633_v2)[2] = "percentage"
colnames(Campaign10633_v2)[4] = "date"
colnames(Campaign10633_v2)[3] = "total time"

Campaign10633_v2_38206 = subset(Campaign10633_v2, adid == 38206)
Campaign10633_v2_38208 = subset(Campaign10633_v2, adid == 38208)
Campaign10633_v2_38206 = Campaign10633_v2_38206[order(Campaign10633_v2_38206$date, Campaign10633_v2_38206$percentage),]
Campaign10633_v2_38208 = Campaign10633_v2_38208[order(Campaign10633_v2_38208$date, Campaign10633_v2_38208$percentage),]

Campaign10633_v2_38206_3 = subset(Campaign10633_v2_38206, date == '2015-12-09' & percentage != 50)
Campaign10633_v2_38208_3 = subset(Campaign10633_v2_38208, date == '2015-12-09')
Campaign10633_v2_38206_4 = subset(Campaign10633_v2_38206, (date == '2015-12-10' & percentage != 40) & (date == '2015-12-10' & percentage != 100))
Campaign10633_v2_38208_4 = subset(Campaign10633_v2_38208, date == '2015-12-10')
Campaign10633_v2_38206_5 = subset(Campaign10633_v2_38206, date == '2015-12-11')
Campaign10633_v2_38208_5 = subset(Campaign10633_v2_38208, date == '2015-12-11')


#Note that 38208 has 0 viewtime for 50 percent so it is removed  
sub_10633_3 <- t(data.frame(Campaign10633_v2_38206_3$`total time`, Campaign10633_v2_38208_3$`total time`))
barplot(sub_10633_3, legend = c("takeover","panorama"), names.arg=Campaign10633_v2_38206_3$percentage ,beside=TRUE, xlab = "Percentage", ylab = "Inscreen msc",ylim=c(0,295953419))

#Note that 38208 has 0 viewtime for 50 percent or 100 percent so they are removed  
sub_10633_4 <- t(data.frame(Campaign10633_v2_38206_4$`total time`, Campaign10633_v2_38208_4 $`total time`))
barplot(sub_10633_4,  names.arg=Campaign10633_v2_38206_4$percentage ,beside=TRUE, xlab = "Percentage", ylab = "Inscreen msc",ylim=c(0,4390110))

sub_10633_5 <- t(data.frame(Campaign10633_v2_38206_5$`total time`, Campaign10633_v2_38208_5 $`total time`))
barplot(sub_10633_5,  names.arg=Campaign10633_v2_38206_5$percentage ,beside=TRUE, xlab = "Percentage", ylab = "Inscreen msc",ylim=c(0,29198792))

v1 = merge(Campaign10633_38206, Campaign10633_38208, by = c("date", "percentage"))
v2 = merge(Campaign10633_v2_38206, Campaign10633_v2_38208, by = c("date", "percentage"))

colnames(v1)[4] = "totaltime.x"
colnames(v1)[6] = "totaltime.y"

colnames(v2)[4] = "totaltime.x"
colnames(v2)[6] = "totaltime.y"

v1 = v1[, change := (totaltime.y*100)/totaltime.x]
v2 = v2[, change := (totaltime.y*100)/totaltime.x]

finaltable_inscreen = rbind(v1,v2)
