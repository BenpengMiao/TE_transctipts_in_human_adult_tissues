#
library(clusterProfiler)
library(enrichplot)
library("ggnewscale")
library(DOSE)
library(org.Hs.eg.db)
hg<-org.Hs.eg.db

f<-read.csv("GO_clusterprofile_PC_human_TE_gene_list_pvalue_0.01.txt",sep="\t");f<-f[1:10,]
group<-c();g<-as.character(f$Description);list<-c()
for(x in 1:nrow(f)){
  symbols<- strsplit(f[x,"geneID"], "/")[[1]]
  group$x<-symbols
  names(group)<-g[1:x]
  list<-c(list,symbols)
}
l<-list[!(duplicated(list))]

data<-read.table("Contribution_Protein_coding_Gene_w_TE_transcript.txt",header = T)
d<-data[l,1:89];k<-c();for(i in 1:nrow(d)){k[i]<-max(d[i,])};names(k)<-l

p <- cnetplot(group,showCategory = 20,color.params = list(foldChange = k),
              cex.params = list(category_node = 0.8, gene_node = 0.7, 
                                category_label = 0.6, gene_label = 0.5),layout="fr")+
  scale_color_gradient2(name='TE-Contribution', low='white', high='firebrick')






