
temp6$`12` <- NULL
temp6$`3` <- NULL
temp6$`45` <- NULL

temp6[,difference := (p12-p3)]
temp6[,difference2 := (p3-p45)]

c(
sum(merged121$`12`),
sum(merged121$`3`),
sum(merged121$`45`),
sum(merged133$`12`),
sum(merged133$`3`),
sum(merged133$`45`),
sum(merged163$`12`),
sum(merged163$`3`),
sum(merged163$`45`),
sum(merged167$`12`),
sum(merged167$`3`),
sum(merged167$`45`),
sum(merged242$`12`),
sum(merged242$`3`),
sum(merged242$`45`),
sum(merged79$`12`),
sum(merged79$`3`),
sum(merged79$`45`),
sum(merged80$`12`),
sum(merged80$`3`),
sum(merged80$`45`), 1769
)

corr_table = rbind(temp6,temp12)

corr_table_yes = subset(corr_table, Recall == "yes")
mean(corr_table_yes$p12)
mean(corr_table_yes$p3)
mean(corr_table_yes$p45)

median(corr_table_yes$p12)
median(corr_table_yes$p3)
median(corr_table_yes$p45)

sd(corr_table_yes$p12)
sd(corr_table_yes$p3)
sd(corr_table_yes$p45)

corr_table_no = subset(corr_table, Recall == "no")
mean(corr_table_no$p12)
mean(corr_table_no$p3)
mean(corr_table_no$p45)

median(corr_table_no$p12)
median(corr_table_no$p3)
median(corr_table_no$p45)

sd(corr_table_no$p12)
sd(corr_table_no$p3)
sd(corr_table_no$p45)

corr_table_yes[, ratio1 := p3/p12]
corr_table_yes[, ratio2 := p45/p3]

mean(corr_table_yes$ratio1)
median(corr_table_yes$ratio1)
sd(corr_table_yes$ratio1)

mean(corr_table_yes$ratio2)
median(corr_table_yes$ratio2)
sd(corr_table_yes$ratio2)