correlate <- function(fn,x,y) {
  file.path <- paste('./data/raw/', fn, sep = "")
  df <- read.csv(file=file.path, head=TRUE, sep = ",")
  x <- df[,x]
  y <- df[,y]
  cor(x, y)
}
