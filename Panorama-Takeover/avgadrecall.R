#takeover vs panorama (avgadrecall attempt)
require(bit64)

library(data.table)
panorama = fread("~/Downloads/panorama.csv")
takeover = fread("~/Downloads/takeover.csv")
panorama$V2 = NULL
takeover$V2 = NULL

takeover_19 = takeover[1:19,]
colnames(panorama)[1] = "adid"
colnames(panorama)[2] = "avgAdRecall"
colnames(takeover)[1] = "adid"
colnames(takeover)[2] = "avgAdRecall"

mean(panorama$avgAdRecall)
median(panorama$avgAdRecall)
sd(panorama$avgAdRecall)
mean(takeover$avgAdRecall)
median(takeover$avgAdRecall)
sd(takeover$avgAdRecall)
mean(takeover_19$avgAdRecall)
median(takeover_19$avgAdRecall)
sd(takeover_19$avgAdRecall)