#Storelocator vs others

library(data.table)
storelocator = fread("~/Documents/Survey/adformats/Storelocator_vs_Others/storelocator.csv")
nonstorelocator = fread("~/Documents/Survey/adformats/Storelocator_vs_Others/non_storelocator.csv")

storelocator[,ratio:= Storelocator/510]
nonstorelocator[,ratio:= Non_Storelocator/658]

sub_store <- t(data.frame(storelocator$ratio, nonstorelocator$ratio))
barplot(sub_store, legend = c("Storelocator", "Non-storelocator"), names.arg=storelocator$Intent ,beside=TRUE, xlab = "Purchase Intent", ylab = "Ratio of answers", ylim = c(0,1))
