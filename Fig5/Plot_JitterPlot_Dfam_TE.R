#
library(ggplot2)
library(ggrepel)

#protein coding
data<-read.table("Dfam_TE_inf_PC_summary.txt",header = T)

ggplot(data, aes(x=(-1)*MYA, y=log2(Freq), col=Group, shape=V8)) +
  geom_jitter(position=position_jitter(0.2))+theme_classic()+
  ylab("Counts of individual copies")+xlab("Time: million years")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size=8,vjust = 0.5))+
  geom_text_repel(data = subset(data, Freq>=16),aes(label = V7),size = 1.5)

#lincRNA
data<-read.table("Dfam_TE_inf_lincRNA_summary.txt",header = T)

ggplot(data, aes(x=(-1)*MYA, y=log2(Freq), col=Group, shape=V8)) +
  geom_jitter(position=position_jitter(0.2))+theme_classic()+
  ylab("Counts of individual copies")+xlab("Time: million years")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size=8,vjust = 0.5))+
  geom_text_repel(data = subset(data, Freq>=8),aes(label = V7),size = 1.5)

