library("ggplot2")
library(RColorBrewer)
colores.imam <- brewer.pal(11, "Spectral")
####### Get & clean data #######
# get data
wt.apo.rmsf<- read.table("/home/german/labo/16/obp/run/wt_apo/rmsf_wt_apo")
wt.ctv.rmsf<- read.table("/home/german/labo/16/obp/run/wt_ctv/rmsf_wt_ctv")
wt.eol.rmsf<- read.table("/home/german/labo/16/obp/run/wt_eol/rmsf_wt_eol")
mu.apo.rmsf<- read.table("/home/german/labo/16/obp/run/mu_apo/rmsf_mu_apo")
mu.ctv.rmsf<- read.table("/home/german/labo/16/obp/run/mu_ctv/rmsf_mu_ctv")
mu.eol.rmsf<- read.table("/home/german/labo/16/obp/run/mu_eol/rmsf_mu_eol")

# tidy data
Aminoacid <- seq(1, 119)

names(wt.apo.rmsf) <- c("Atom", "RMSF")
names(wt.ctv.rmsf) <- c("Atom", "RMSF")
names(wt.eol.rmsf) <- c("Atom", "RMSF")
names(mu.apo.rmsf) <- c("Atom", "RMSF")
names(mu.ctv.rmsf) <- c("Atom", "RMSF")
names(mu.eol.rmsf) <- c("Atom", "RMSF")

wt.apo.rmsf$Aminoacid <- Aminoacid
wt.ctv.rmsf$Aminoacid <- Aminoacid
wt.eol.rmsf$Aminoacid <- Aminoacid
mu.apo.rmsf$Aminoacid <- Aminoacid
mu.ctv.rmsf$Aminoacid <- Aminoacid
mu.eol.rmsf$Aminoacid <- Aminoacid

####### Results #######
pdf("rmsf_wt_apo.pdf", height = 8, width = 15)
#
par(mai=c(1.02,1,0.82,1.9))
par(xpd=TRUE)
# IM
par(pch=20, lwd=2, lty=1)
plot(wt.apo.rmsf$Aminoacid[3:116], wt.apo.rmsf$RMSF[3:116], 
     main = "AmelOBP14 RMSF 700ns",
     col=colores.imam[1], bty="n",
     xlab=expression(paste("Aminoacid")),  ylab="RMSF [Angstroms]", cex.lab=1.7, 
     xaxt="n", yaxt="n",
     cex.main= 2.3, 
     xlim = c(0, 120), 
     ylim = c(0, 2.5),
     type = "l")
par(new=TRUE)
par(pch=20, lwd=2, lty=1)
plot(wt.ctv.rmsf$Aminoacid[3:116], wt.ctv.rmsf$RMSF[3:116], 
     col=colores.imam[3], bty="n",
     xlab="", 
     ylab="", 
     xaxt="n", yaxt="n",
     cex.main= 2.3, 
     xlim = c(0, 120),
     ylim = c(0, 2.5),
     type = "l")
par(new=TRUE)
par(pch=20, lwd=2, lty=1)
plot(wt.eol.rmsf$Aminoacid[3:116], wt.eol.rmsf$RMSF[3:116], 
     col=colores.imam[5], bty="n",
     xlab="",
     ylab="", 
     xaxt="n", yaxt="n",
     cex.main= 2.3, 
     xlim = c(0, 120),
     ylim = c(0, 2.5),
     type = "l")
par(new=TRUE)
par(pch=20, lwd=2, lty=1)
#plot(mu.apo.rmsf$Aminoacid[3:116], mu.apo.rmsf$RMSF[3:116], 
#     col=colores.imam[7], bty="n",
#     xlab=expression(paste(alpha, "Aminoacid")),  ylab="RMSF [Angstroms]", cex.lab=1.7, 
#     xaxt="n", yaxt="n",
#     cex.main= 2.3, 
#     xlim = c(0, 120), 
#     ylim = c(0, 2.5),
#     type = "l")
par(new=TRUE)
par(pch=20, lwd=2, lty=1)
#plot(mu.ctv.rmsf$Aminoacid[3:116], mu.ctv.rmsf$RMSF[3:116], 
#     col=colores.imam[9], bty="n",
#     xlab=expression(paste(alpha, "Aminoacid")),  ylab="RMSF [Angstroms]", cex.lab=1.7, 
#     xaxt="n", yaxt="n",
#     cex.main= 2.3, 
#     xlim = c(0, 120), 
#     ylim = c(0, 2.5),
#     type = "l")
#par(new=TRUE)
par(pch=20, lwd=2, lty=1)
#plot(mu.eol.rmsf$Aminoacid[3:116], mu.eol.rmsf$RMSF[3:116], 
#     col=colores.imam[11], bty="n",
#     xlab=expression(paste("Aminoacid")),  ylab="RMSF [Angstroms]", cex.lab=1.7, 
#     xaxt="n", yaxt="n",
#     cex.main= 2.3, 
#     xlim = c(0, 120), 
#     ylim = c(0, 2.5),
#     type = "l")
legend(legend =c("wt_apo", "wt_ctv", "wt_eol"), 
                 #,"mu_apo", "mu_ctv", "mu_eol"
       x="topright", cex=1.5, inset= c(-0.15, 0), lty = c(1), 
       col = colores.imam[c(1, 3, 5)],
                            #,7, 9, 11
                             
       bty = "n")
axis(1, at=seq(0, 120, 10), cex.axis=1.5)
axis(2, at=seq(0, 2.5, 0.5), cex.axis=1.5)
#
# ahora hago las anotaciones de las hélices
par(lend=2)
segments(x0=1, y=0.1, x1=119, y1=0.1, lwd=4, col = colores.imam[11], lty = 1)
segments(x0=3, y=0.1, x1=21, y1=0.1, lwd=16, col = colores.imam[1], lty = 2)
segments(x0=25, y=0.1, x1=32, y1=0.1, lwd=16, col = colores.imam[1], lty = 2)
segments(x0=41, y=0.1, x1=53, y1=0.1, lwd=16, col = colores.imam[1], lty = 2)
segments(x0=65, y=0.1, x1=72, y1=0.1, lwd=16, col = colores.imam[1], lty = 2)
segments(x0=78, y=0.1, x1=88, y1=0.1, lwd=16, col = colores.imam[1], lty = 2)
segments(x0=96, y=0.1, x1=108, y1=0.1, lwd=16, col = colores.imam[1], lty = 2)
segments(x0=113, y=0.1, x1=116, y1=0.1, lwd=16, col = colores.imam[1], lty = 2)
text(x=c(6, 19, 28, 44, 68, 81, 99, 115), y=0.0, cex= 1.8, 
    labels = c(expression(paste(alpha, "1")), 
        expression(paste(alpha, "2")), expression(paste(alpha, "3")),
        expression(paste(alpha, "4")), expression(paste(alpha, "5")),
        expression(paste(alpha, "6")), expression(paste(alpha, "7")),
        expression(paste(alpha, "8"))))
#
dev.off()
