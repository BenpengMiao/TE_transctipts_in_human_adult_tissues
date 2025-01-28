#
library(ggplot2)

data<-read.table("TE_class_distribution_Tissue_Number.txt",header = T)
data$group<-paste(data$Sex,data$Type,sep=",")

ggplot(data, aes(x=Tissue_Number, y=Freq, fill=TE)) +geom_bar(stat="identity")+
  theme_classic()+facet_wrap(~group)
