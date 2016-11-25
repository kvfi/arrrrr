library(ggplot2)
library(plyr)
library(xlsx)

df <- read.csv(file="data/raw/sample.csv",head=TRUE,sep=",")

mean <- aggregate(df[, 5], list(df$neighborhood), mean)
mean <- rename(mean, c("Group.1"="Neighborhood", "x"="Price"))

current.time <- gsub("\\s|[:punct:]","_", Sys.time())
path.to.file <- paste("output/", current.time, sep = "")
dir.create(path.to.file, recursive = TRUE)
path.to.plot <- paste(path.to.file, "/plot.png", sep = "")

#Draw plot
ggplot(mean)+geom_point(aes(x=Neighborhood,y=Price),size=3,color="red")+theme(text = element_text(size=10), axis.text.x = element_text(angle=90, hjust=1))+ggtitle("Mean Price by Neighborhood")+ggsave(path.to.plot, width=12, dpi=100)


# Create directory and store output to an XLSX file.

write.xlsx(x = mean, file = paste(path.to.file, "/NeighborhoodMean.xlsx", sep = ""),
           sheetName = "NeighborhoodMean", row.names = FALSE)