library(data.table)

adid_avgrecall= fread("~/Documents/Survey/adformats/new_approach/hivetable.csv")
takeover_adid_temp = fread("~/Documents/Survey/adformats/new_approach/takeover_adid_temp.csv")

colnames(adid_avgrecall)[1] <- "adid"
colnames(adid_avgrecall)[2] <- "avgrecall"

colnames(panorama_adid)[1] <- "originalAdId"
colnames(takeover_adid)[1] <- "originalAdId"
colnames(takeover_adid_temp)[1] <- "originalAdId"

panorama_adid[,format_type:= "panorama"]
takeover_adid[,format_type:= "takeover"]
takeover_adid_temp[,format_type:= "takeover_temp"]

panorama_takover = rbind(panorama_adid,takeover_adid)
colnames(panorama_takover)[1] <- "adid"

panorama_takover_temp = rbind(panorama_adid,takeover_adid_temp)
colnames(panorama_takover_temp)[1] <- "adid"

is.numeric(adid_avgrecall$adid)
options(max.print=1000000)
adid_temp <- as.character(adid_avgrecall$adid)
adid_avgrecall <- cbind(adid_avgrecall, adid_temp)
adid_avgrecall$adid <- NULL
colnames(adid_avgrecall)[2] <- "adid"

merge_avgrecall = merge(panorama_takover,adid_avgrecall, by = "adid")



agg <- aggregate(merge_avgrecall$avgrecall, by=list(format = merge_avgrecall$format_type), mean)

merge_avgrecall_temp = merge(panorama_takover_temp,adid_avgrecall, by = "adid")

agg_temp <- aggregate(merge_avgrecall_temp$avgrecall, by=list(format = merge_avgrecall_temp$format_type), mean)



deneme = merge_avgrecall[format_type == "panorama"]

deneme_temp = merge_avgrecall_temp[format_type == "takeover_temp"]
