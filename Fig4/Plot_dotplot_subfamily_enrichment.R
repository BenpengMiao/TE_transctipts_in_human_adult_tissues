#

library(ggplot2)
library(ggrepel)

data<-read.table("TE_subfamily_enrichment_TE_PC_transcript_w_diff_length.txt",header = T)

cutoff_x<-5;cutoff_y<-1.5
ggplot(data, aes(x=log2(Freq), y=log2(Ratio), col=Class))+geom_point(alpha=0.8)+theme_classic()+
  geom_hline(yintercept=log2(cutoff_y),linetype="dashed",size=0.5)+geom_vline(xintercept=log2(cutoff_x), linetype="dashed",size=0.5)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size=8,vjust = 0.5))+
  geom_text_repel(data = subset(data, data$Freq>=cutoff_x & data$Ratio>=cutoff_y),aes(label = V20),size = 2)+
  theme(strip.text = element_text(size=7))