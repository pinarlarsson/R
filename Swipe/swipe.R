#Do less slides in swipe ads cause more interaction due to faster loading time?

library(data.table)
swipe= fread("~/Downloads/swipe")
swipe_2= fread("~/Downloads/Swipe2.csv")

colnames(swipe) = c("adid",
"avg_swipeCount",
"avg_clickCount",
"avg_closeCount",
"median_swipe",
"median_clickCount",
"median_closeCount",
"stddev_swipeCount",
"stddev_clickCount",
"stddev_closeCount")

swipe_table = merge(x = swipe, y = swipe_2, by = "adid", all.x = TRUE)
swipe_table_nonoutlier = subset(swipe_table, adid != 27514)

cor(swipe_table_nonoutlier$avg_swipeCount, swipe_table_nonoutlier$`nb slides`)
cor(swipe_table_nonoutlier$avg_clickCount, swipe_table_nonoutlier$`nb slides`)
cor(swipe_table_nonoutlier$avg_closeCount, swipe_table_nonoutlier$`nb slides`)