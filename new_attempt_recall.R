library(data.table)
main_table = fread("~/Documents/Survey/adformats/main_table.csv")
panorama_adid = fread("~/Documents/Survey/adformats/new_approach/panorama_adid.csv")
takeover_adid = fread("~/Documents/Survey/adformats/new_approach/takeover_adid.csv")

colnames(panorama_adid)[1] <- "originalAdId"
colnames(takeover_adid)[1] <- "originalAdId"

is.numeric(main_table$originalAdId)
options(max.print=1000000)
originalAdid_temp <- as.character(main_table$originalAdId)
main_table$originalAdId <- NULL
main_table <- cbind(main_table, originalAdid_temp)
colnames(main_table)[3] <- "originalAdId"


Panorama_merge = merge(main_table,panorama_adid,by="originalAdId")
Takeover_merge = merge(main_table,takeover_adid,by="originalAdId")
