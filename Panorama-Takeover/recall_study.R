library(data.table)
templatetype = fread("~/Documents/Survey/adformats/formattypes.csv")
surveytable = fread("~/Documents/Survey/adformats/surveytable.csv")
surveytable2 = fread("~/Documents/Survey/adformats/surveytable2.csv")
templatetype2 = fread("~/Documents/Survey/adformats/formattypes2.csv")
templatetype2[,format_type := "panorama"]





is.numeric(surveytable$originalAdId)
is.character(templatetype$adid)


options(max.print=1000000)
adid <- as.character(surveytable$originalAdId)
surveytable <- cbind(surveytable, adid)


Recall_study = merge(templatetype,surveytable,by="adid")
Recall_study$originalAdId <- NULL

temp <- aggregate(Recall_study$answerSetId, by=list(recall = Recall_study$Recall, format = Recall_study$format_type), NROW)


colnames(templatetype2)[1] <- "originalAdId"

is.numeric(surveytable2$originalAdId)
is.numeric(templatetype2$originalAdId)

Recall_study2 = merge(templatetype2,surveytable2,by="originalAdId")
temp2 <- aggregate(Recall_study2$answerSetId, by=list(recall = Recall_study2$Recall, format = Recall_study2$format_type), NROW)

temp$percentage = c(0.02069218608853,0.59499209575429,0.38431571815718)
temp2$percentage = c(0.00838481906443,0.6504854368932,0.34112974404237)

subsettemp <- t(data.frame(temp$percentage, temp2$percentage))
barplot(subsettemp, legend = c("takeover", "panorama"), names.arg=temp$recall ,beside=TRUE, xlab = "Recall", ylab = "Percentage", ylim = c(0,1))

library(data.table)
panorama_refined = fread("~/Documents/Survey/adformats/panorama_refined.csv")
panorama_refined[,format_type := "panorama"]
temp_refined <- aggregate(panorama_refined$answerSetId, by=list(recall = panorama_refined$Recall, format = panorama_refined$format_type), NROW)

### NEW ATTEMPT ###
library(data.table)
main_table = fread("~/Documents/Survey/adformats/main_table.csv")
panorama_adid = fread("~/Documents/Survey/adformats/panorama_adid.csv")
panorama_adid[,format_type := "panorama"]
colnames(panorama_adid)[1] <- "originalAdId"
panorama_study = merge(main_table,panorama_adid,by="originalAdId")
temp_panorama <- aggregate(panorama_study$answerSetId, by=list(recall = panorama_study$Recall, format = panorama_study$format_type), NROW)





