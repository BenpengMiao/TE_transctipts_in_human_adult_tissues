#
library(ggplot2)

data<-read.table("conservation_TE_list_main_inf_subfamily_Ratio_2_count5.txt",header = T)

ggplot(data,aes(x=TE, y=Type, size = log2(Count), col=log2Ratio ))+ 
  geom_point(alpha=0.7) +
  scale_color_gradient2(low="navy", mid="white", high="firebrick3" ) + 
  scale_size(range = c(0.01, 3))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size=8,vjust = 0.5), 
        axis.text.y = element_text(size=8),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.border = element_rect( colour = "black", fill = NA, size=0.6),
        strip.text.x = element_text(size=6),
        legend.title = element_text(size = 8),
        legend.position="top",
        panel.grid.minor = element_blank(), panel.background = element_blank())