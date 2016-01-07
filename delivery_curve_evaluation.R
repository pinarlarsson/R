library(data.table)

# recommendation evaluation
# read data
delivery_curve_reco = fread("~/Documents/SQL/My Queries/rek_aktuellperiod_pre_post_data")

comp_1 = fread("~/Documents/SQL/My Queries/rek_forra_veckan_data")
comp_2 = fread("~/Documents/SQL/My Queries/rek_forra_veckan_2_data")

# modify
comp_1[,period:="pre"]
comp_2[,period:="post"]
delivery_curve_reco_comp = rbind(comp_1,comp_2)

# add key
delivery_curve_reco[,timeperiod:=paste(datecreated,th,minute,sep = "-")]
delivery_curve_reco_comp[,timeperiod:=paste(datecreated,th,minute,sep = "-")]

# add metric
delivery_curve_reco[,reco_ratio:=(impression-rekommendation_is_null)/impression]
delivery_curve_reco_comp[,reco_ratio:=(impression-rekommendation_is_null)/impression]

# plot
ggplot(delivery_curve_reco) + geom_density(aes(x=reco_ratio,group=period,fill=period),alpha = 0.5)
ggplot(delivery_curve_reco_comp) + geom_density(aes(x=reco_ratio,group=period,fill=period),alpha = 0.5)

# merge data sets
delivery_curve_reco[,ref:=FALSE]
delivery_curve_reco_comp[,ref:=TRUE]
plot_data = rbind(delivery_curve_reco,delivery_curve_reco_comp)

# plot
ggplot(plot_data) + 
  geom_density(aes(x=reco_ratio,group=period,fill=period),alpha = 0.5) + 
  facet_grid(.~ref)

# no ad evaluation
#reading
delivery_curve_noad = fread("~/Documents/SQL/My Queries/noad_aktuellperiod")
delivery_curve_noad_comp = fread("~/Documents/SQL/My Queries/noad_forraveckan")

#adding key
delivery_curve_noad[,timeperiod:=paste(datecreated,hour,minute,sep = "-")]
delivery_curve_noad_comp[,timeperiod:=paste(datecreated,hour,minute,sep = "-")]

# adding metric
delivery_curve_noad[,noad_ratio:=noad/impression]
delivery_curve_noad_comp[,noad_ratio:=noad/impression]
delivery_curve_noad[,non_noad_ratio:=(impression-noad)/impression]
delivery_curve_noad_comp[,non_noad_ratio:=(impression-noad)/impression]

# plotting
library(ggplot2)
ggplot(delivery_curve_noad) + geom_density(aes(x=non_noad_ratio,group=period,fill=period),alpha = 0.5)
ggplot(delivery_curve_noad_comp) + geom_density(aes(x=non_noad_ratio,group=period,fill=period),alpha = 0.5)

# merging data sets
delivery_curve_noad[,ref:= FALSE]
delivery_curve_noad_comp[,ref:=TRUE]
plot_data = rbind(delivery_curve_noad,delivery_curve_noad_comp)

# plotting with true/false
ggplot(plot_data) + 
  geom_density(aes(x=non_noad_ratio,group=period,fill=period),alpha = 0.5) + 
  facet_grid(.~ref)
