library(ggplot2)
library(gridExtra)
wt_apo_pca <- read.table("~/obp/wt_apo/pjtion_pca")
wt_apo_pca <- pca[ ,2:3]

names(wt_apo_pca) <- c("PCA1", "PCA2")



plot1 + facet_grid(. ~PCA1)
plot2
plot3
facet_grid(. ~PCA1)
plot1 <- ggplot(pca, aes(PCA1,PCA2)) + stat_bin2d(binwidth = c(0.1, 0.1))
plot2 <- ggplot(pca, aes(PCA1)) + geom_histogram(binwidth = 0.1)
plot3 <- ggplot(pca, aes(PCA2)) + geom_histogram(binwidth = 0.1)
grid.arrange(plot1, plot2, plot3)

facet()