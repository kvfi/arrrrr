library(ggplot2)
library(plyr)
library(xlsx)

df <- read.csv(file="db2.csv",head=TRUE,sep=",")

mean <- aggregate(df[, 5], list(df$neighborhood), mean)
mean <- rename(mean, c("Group.1"="Neighborhood", "x"="Price"))

current.time <- gsub("\\s|[:punct:]","_", Sys.time())

#Draw plot
ggplot(mean)+geom_point(aes(x=Neighborhood,y=Price),size=3,color="red")+theme(text = element_text(size=10), axis.text.x = element_text(angle=90, hjust=1))+ggtitle("Mean Price by Neighborhood")

# Create directory and store output to an XLSX file.
path.to.file <- sprintf("output/%s", current.time)
dir.create(path.to.file, recursive = TRUE)
write.xlsx(x = mean, file = sprintf("%s/NeighborhoodMean.xlsx", path.to.file),
           sheetName = "NeighborhoodMean", row.names = FALSE)