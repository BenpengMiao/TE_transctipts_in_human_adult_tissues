#pheatmap
library(pheatmap)

#Protein coding Male
data<-read.table("Heatmap_Male_Protein_coding_Zscore_Expression.txt",header = T)
cluster<-read.table("Heatmap_Male_Protein_coding_cluster.txt",header = T)
d<-data[rownames(cluster),]

ann<-as.data.frame(cluster$Group);rownames(ann)<-rownames(cluster);colnames(ann)<-"Group"
x<-cluster$Group;x<-x[!(duplicated(x))];ann$Group<-factor(ann$Group,levels=x)

paletteLength <- 100
myColor <- colorRampPalette(c("blue", "white", "red"))(paletteLength)
myBreaks <- c(seq(-2, 0, length.out=ceiling(paletteLength/2) + 1),
              seq(2/paletteLength, 6, length.out=floor(paletteLength/2)))

pheatmap(d,cluster_rows = F,cluster_cols = F,show_rownames = F,show_colnames = F,
         breaks = myBreaks,color=myColor,annotation_row = ann)

#Protein coding Female
data<-read.table("Heatmap_Female_Protein_coding_Zscore_Expression.txt",header = T)
cluster<-read.table("Heatmap_Female_Protein_coding_cluster.txt",header = T)
d<-data[rownames(cluster),]

ann<-as.data.frame(cluster$Group);rownames(ann)<-rownames(cluster);colnames(ann)<-"Group"
x<-cluster$Group;x<-x[!(duplicated(x))];ann$Group<-factor(ann$Group,levels=x)

paletteLength <- 100
myColor <- colorRampPalette(c("blue", "white", "red"))(paletteLength)
myBreaks <- c(seq(-2, 0, length.out=ceiling(paletteLength/2) + 1),
              seq(2/paletteLength, 6, length.out=floor(paletteLength/2)))

pheatmap(d,cluster_rows = F,cluster_cols = F,show_rownames = F,show_colnames = F,
         breaks = myBreaks,color=myColor,annotation_row = ann)

#LincRNA Male
data<-read.table("Heatmap_Male_LincRNA_Zscore_Expression.txt",header = T)
cluster<-read.table("Heatmap_Male_LincRNA_cluster.txt",header = T)
d<-data[rownames(cluster),]

ann<-as.data.frame(cluster$Group);rownames(ann)<-rownames(cluster);colnames(ann)<-"Group"
x<-cluster$Group;x<-x[!(duplicated(x))];ann$Group<-factor(ann$Group,levels=x)

paletteLength <- 100
myColor <- colorRampPalette(c("blue", "white", "red"))(paletteLength)
myBreaks <- c(seq(-2, 0, length.out=ceiling(paletteLength/2) + 1),
              seq(2/paletteLength, 6, length.out=floor(paletteLength/2)))

pheatmap(d,cluster_rows = F,cluster_cols = F,show_rownames = F,show_colnames = F,
         breaks = myBreaks,color=myColor,annotation_row = ann)

#LincRNA Female
data<-read.table("Heatmap_Female_LincRNA_Zscore_Expression.txt",header = T)
cluster<-read.table("Heatmap_Female_LincRNA_cluster.txt",header = T)
d<-data[rownames(cluster),]

ann<-as.data.frame(cluster$Group);rownames(ann)<-rownames(cluster);colnames(ann)<-"Group"
x<-cluster$Group;x<-x[!(duplicated(x))];ann$Group<-factor(ann$Group,levels=x)

paletteLength <- 100
myColor <- colorRampPalette(c("blue", "white", "red"))(paletteLength)
myBreaks <- c(seq(-2, 0, length.out=ceiling(paletteLength/2) + 1),
              seq(2/paletteLength, 6, length.out=floor(paletteLength/2)))

pheatmap(d,cluster_rows = F,cluster_cols = F,show_rownames = F,show_colnames = F,
         breaks = myBreaks,color=myColor,annotation_row = ann)







