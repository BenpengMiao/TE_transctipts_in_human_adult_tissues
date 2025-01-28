#input file
library(ggplot2)
f<-read.table("TE_subfamily_Enrichment.txt",header = T)

mid<-0
ggplot(f,aes(x=TE, y=Type, size = log2(Count), col = log2(Ratio)))+ 
  geom_point(alpha=0.8) +
  scale_color_gradient2(midpoint=mid, low="blue", mid="white", high="red" ) + 
  scale_size(range = c(0.01, 3))+
  scale_y_discrete(limits=c("lincRNA_male_vsAllTE","lincRNA_female_vsAllTE",
                            "PC_male_vsAllTE","PC_female_vsAllTE"))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size=8,vjust = 0.5), 
        axis.text.y = element_text(size=8),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.border = element_rect( colour = "black", fill = NA, size=0.6),
        strip.text.x = element_text(size=6),
        legend.title = element_text(size = 8),
        legend.position="top",
        panel.grid.minor = element_blank(), panel.background = element_blank())
