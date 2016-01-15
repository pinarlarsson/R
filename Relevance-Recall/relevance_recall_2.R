#second 7
library(data.table)
s44_12= fread("~/Documents/Survey/Relevance_Recall/relevance12_44.csv")
s44_3= fread("~/Documents/Survey/Relevance_Recall/relevance3_44.csv")
s44_45= fread("~/Documents/Survey/Relevance_Recall/relevance45_44.csv")
s124_12= fread("~/Documents/Survey/Relevance_Recall/relevance12_124.csv")
s124_3= fread("~/Documents/Survey/Relevance_Recall/relevance3_124.csv")
s124_45= fread("~/Documents/Survey/Relevance_Recall/relevance45_124.csv")
s219_12= fread("~/Documents/Survey/Relevance_Recall/relevance12_219.csv")
s219_3= fread("~/Documents/Survey/Relevance_Recall/relevance3_219.csv")
s219_45= fread("~/Documents/Survey/Relevance_Recall/relevance45_219.csv")

s236_12= fread("~/Documents/Survey/Relevance_Recall/relevance12_236.csv")
s236_3= fread("~/Documents/Survey/Relevance_Recall/relevance3_236.csv")
s236_45= fread("~/Documents/Survey/Relevance_Recall/relevance45_236.csv")
s251_12= fread("~/Documents/Survey/Relevance_Recall/relevance12_251.csv")
s251_3= fread("~/Documents/Survey/Relevance_Recall/relevance3_251.csv")
s251_45= fread("~/Documents/Survey/Relevance_Recall/relevance45_251.csv")
s317_12= fread("~/Documents/Survey/Relevance_Recall/relevance12_317.csv")
s317_3= fread("~/Documents/Survey/Relevance_Recall/relevance3_317.csv")
s317_45= fread("~/Documents/Survey/Relevance_Recall/relevance45_317.csv")
s90_12= fread("~/Documents/Survey/Relevance_Recall/relevance12_90.csv")
s90_3= fread("~/Documents/Survey/Relevance_Recall/relevance3_90.csv")
s90_45= fread("~/Documents/Survey/Relevance_Recall/relevance45_90.csv")



temp124 = merge(s124_12, s124_3, by = "Recall")
merged124 = merge(temp124, s124_45, by = "Recall")

temp219 = merge(s219_12, s219_3, by = "Recall")
merged219 = merge(temp219, s219_45, by = "Recall")

temp236 = merge(s236_12, s236_3, by = "Recall")
merged236 = merge(temp236, s236_45, by = "Recall")
temp251 = merge(s251_12, s251_3, by = "Recall")
merged251 = merge(temp251, s251_45, by = "Recall")
temp317 = merge(s317_12, s317_3, by = "Recall")
merged317 = merge(temp317, s317_45, by = "Recall")
temp90 = merge(s90_12, s90_3, by = "Recall")
merged90 = merge(temp90, s90_45, by = "Recall")

merged90[,p12:=(s90_12/sum(merged90$s90_12))]
merged90[,p3:=(s90_3/sum(merged90$s90_3))]
merged90[,p45:=(s90_45/sum(merged90$s90_45))]

merged219[,p12:=(s219_12/sum(merged219$s219_12))]
merged219[,p3:=(s219_3/sum(merged219$s219_3))]
merged219[,p45:=(s219_45/sum(merged219$s219_45))]

merged251[,p12:=(s251_12/sum(merged251$s251_12))]
merged251[,p3:=(s251_3/sum(merged251$s251_3))]
merged251[,p45:=(s251_45/sum(merged251$s251_45))]

merged317[,p12:=(s317_12/sum(merged317$s317_12))]
merged317[,p3:=(s317_3/sum(merged317$s317_3))]
merged317[,p45:=(s317_45/sum(merged317$s317_45))]

merged124[,p12:=(s124_12/sum(merged124$s124_12))]
merged124[,p3:=(s124_3/sum(merged124$s124_3))]
merged124[,p45:=(s124_45/sum(merged124$s124_45))]

merged44[,p12:=(s44_12/sum(merged44$s44_12))]
merged44[,p3:=(s44_3/sum(merged44$s44_3))]
merged44[,p45:=(s44_45/sum(merged44$s44_45))]

merged236[,p12:=(s236_12/sum(merged236$s236_12))]
merged236[,p3:=(s236_3/sum(merged236$s236_3))]
merged236[,p45:=(s236_45/sum(merged236$s236_45))]


colnames(merged219)[2]="12"
colnames(merged219)[3]="3"
colnames(merged219)[4]="45"
colnames(merged251)[2]="12"
colnames(merged251)[3]="3"
colnames(merged251)[4]="45"
colnames(merged317)[2]="12"
colnames(merged317)[3]="3"
colnames(merged317)[4]="45"
colnames(merged124)[2]="12"
colnames(merged124)[3]="3"
colnames(merged124)[4]="45"
colnames(merged90)[2]="12"
colnames(merged90)[3]="3"
colnames(merged90)[4]="45"
colnames(merged44)[2]="12"
colnames(merged44)[3]="3"
colnames(merged44)[4]="45"
colnames(merged236)[2]="12"
colnames(merged236)[3]="3"
colnames(merged236)[4]="45"

merged219[,number := c("219","219")]
merged251[,number := c("251","251")]
merged317[,number := c("317","317")]
merged124[,number := c("124","124")]
merged90[,number := c("90","90")]
merged44[,number := c("44","44")]
merged236[,number := c("236","236")]

temp7 = rbind(merged219,merged251)
temp8 = rbind(temp7,merged317)
temp9= rbind(temp8,merged124)
temp10 = rbind(temp9,merged90)
temp11 = rbind(temp10,merged44)
temp12 = rbind(temp11,merged236)



temp12[,difference := (p12-p3)]
temp12[,difference2 := (p3-p45)]

c(
  sum(merged219$`12`),
  sum(merged219$`3`),
  sum(merged219$`45`),
  sum(merged251$`12`),
  sum(merged251$`3`),
  sum(merged251$`45`),
  sum(merged317$`12`),
  sum(merged317$`3`),
  sum(merged317$`45`),
  sum(merged124$`12`),
  sum(merged124$`3`),
  sum(merged124$`45`),
  sum(merged90$`12`),
  sum(merged90$`3`),
  sum(merged90$`45`),
  sum(merged44$`12`),
  sum(merged44$`3`),
  sum(merged44$`45`),
  sum(merged236$`12`),
  sum(merged236$`3`),
  sum(merged236$`45`), 1549
)