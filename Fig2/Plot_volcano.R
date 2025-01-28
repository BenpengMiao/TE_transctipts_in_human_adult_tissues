#
library(ggplot2)
library(ggrepel)
k<-read.table("Sex_Differential_expressed_transcripts.txt",header = T)
y<-k[k$Tissue=="Breast_Mammary_Tissue",]
x<-d[d$Tissue=="Breast_Mammary_Tissue",];x$Sig<-x$Ensembl %in% y$Ensembl
x1<-x[x$Type=="protein_coding",];x2<-x[x$Type=="lincRNA",]
x1<-x1[x1$Male>=0.1 | x1$Female>=0.1,];x2<-x2[x2$Male>=0.1 | x2$Female>=0.1,];

#protein coding
ggplot(x1, aes(x=logFC, y=-log10(FDR), col=Sig))+geom_point(alpha=0.8)+theme_classic()+
  geom_hline(yintercept=-log10(0.01),linetype="dashed",size=0.5)+
  geom_vline(xintercept=log2(1.5), linetype="dashed",size=0.5)+
  geom_vline(xintercept=-log2(1.5), linetype="dashed",size=0.5)+
  scale_color_manual(values = c("grey","#F8766D"))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size=8,vjust = 0.5))+
  geom_text_repel(data = subset(x1, Sig=="TRUE"),aes(label = Gene),size = 2.5)+
  theme(strip.text = element_text(size=7))

#lincRNA
ggplot(x2, aes(x=logFC, y=-log10(FDR), col=Sig))+geom_point(alpha=0.8)+theme_classic()+
  geom_hline(yintercept=-log10(0.01),linetype="dashed",size=0.5)+
  geom_vline(xintercept=log2(1.5), linetype="dashed",size=0.5)+
  geom_vline(xintercept=-log2(1.5), linetype="dashed",size=0.5)+
  scale_color_manual(values = c("grey","purple"))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size=8,vjust = 0.5))+
  theme(strip.text = element_text(size=7))

