#
inf<-read.table("TE_derived_transcript_TSS_v26_inf.txt")
inf$V9<-str_replace_all(inf$V9,"[?]","")
k<-read.table("Sex_Differential_expressed_transcripts.txt",header = T)

breast<-k[k$Tissue=="Breast_Mammary_Tissue",]
br1<-breast[breast$Type=="protein_coding",]; br2<-breast[breast$Type=="lincRNA",];
b1<-inf[inf$V17 %in% br1$Ensembl,]; b2<-inf[inf$V17 %in% br2$Ensembl,];
a1<-as.data.frame(table(b1$V9));a1$Fra<-a1$Freq/sum(a1$Freq);a1$Type<-"PC"
a2<-as.data.frame(table(b2$V9));a2$Fra<-a2$Freq/sum(a2$Freq);a2$Type<-"lincRNA";a<-rbind(a1,a2)

ggplot(a, aes(x=Type, y=Fra, col=Var1)) +
  geom_jitter(position=position_jitter(0.01))+theme_classic()+ylab("Faction of TE class")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size=8,vjust = 0.5))

a1<-as.data.frame(table(b1$V5));a1$Fra<-a1$Freq/sum(a1$Freq);a1$Type<-"PC"
a2<-as.data.frame(table(b2$V5));a2$Fra<-a2$Freq/sum(a2$Freq);a2$Type<-"lincRNA";a<-rbind(a1,a2)
ggplot(a, aes(x=Type, y=Freq, col=Type)) +
  geom_jitter(position=position_jitter(0.1))+theme_classic()+ylab("Copy Number of TE subfamily")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size=8,vjust = 0.5))+
  geom_text_repel(data = subset(a, Freq>=3),aes(label = Var1),size = 1.5)

