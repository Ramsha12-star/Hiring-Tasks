library(tidyverse)
library(stringr)
library(readr)
gene_info <- data <- read_tsv(gzfile("D:/Tasks/Task3/Homo_sapiens.gene_info.gz"))
gene_plot <- gene_info %>%
  group_by(chromosome)%>%
  summarise(gene_count = n())
gene_plot <- gene_plot[-c(1,4,28),]
ggplot(gene_plot, aes(chromosome, gene_count))+
  geom_bar(stat = "identity")+
  theme_classic()+
  xlab("Chromosomes")+
  ylab("Gene count")+
  ggtitle("Number of gene in each chromosome")
