

houses <- read.csv(file="db3.csv",head=TRUE,sep=",")
attach(houses)
par(mfrow=c(2,2))

plot(surface, price, main="Surface (m²) vs. Price (MAD)", 
     xlab="Surface", ylab="Price")
abline(lm(price~surface), col="blue")
mtext(cor(surface, price), cex=.8)


plot(rooms, price, main="No. of rooms vs. Price (MAD)", 
     xlab="No. of rooms", ylab="Price")
abline(lm(price~rooms), col="blue")
mtext(cor(rooms, price), cex=.8)


plot(batrooms, price, main="No. of batrooms vs. Price (MAD)", 
     xlab="No. of batrooms", ylab="Price")
abline(lm(price~batrooms), col="blue")
axis(side = 1,
     at = v1,
     labels = v2,
     tck=-.1,
     tcl = -0.5,
     cex.axis=1.05,
     col.axis="blue",
     font.axis=5)
mtext(cor(batrooms, price), cex=.8)


plot(floors, price, main="No. of floors vs. Price (MAD)", 
     xlab="No. of floors", ylab="Price")
abline(lm(price~floors), col="blue")
mtext(cor(floors, price), cex=.8)


cor(surface, price)
cor(rooms, price)
cor(batrooms, price)
cor(floors, price)


houses <- read.csv(file="db2.csv",head=TRUE,sep=",")
plot_cor = function(x,y) {
  CV = sqrt(chisq.test(x, y, correct=FALSE)$statistic /
              (length(x) * (min(length(unique(x)),length(unique(y))) - 1)))
  print.noquote("Cramér V / Phi:")
  return(as.numeric(CV))
}

helpdata = houses
with(helpdata, cv.test(surface, price))