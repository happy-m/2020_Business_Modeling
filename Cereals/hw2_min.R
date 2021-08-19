cereal <- read.csv("Cereals.csv")
cereal.df <- cereal
View(cereal.df)

library(ggplot2)
library(dplyr)

#1-(1) 확인 작업
str(cereal.df)

#1-(2)
data.frame(mean = sapply(cereal.df[-c(1:3)], mean, na.rm=TRUE),
           min = sapply(cereal.df[-c(1:3)], min, na.rm=TRUE),
           max = sapply(cereal.df[-c(1:3)], max, na.rm=TRUE),
           sd = sapply(cereal.df[-c(1:3)], sd, na.rm=TRUE),
           median = sapply(cereal.df[-c(1:3)], median, na.rm=TRUE))


#1-(3) histogram graph
par(mfrow=c(4, 4)) 
hist(cereal.df[,4], xlab = "calories")
hist(cereal.df[,5], xlab = "protein")
hist(cereal.df[,6], xlab = "fat")
hist(cereal.df[,7], xlab = "sodium")
hist(cereal.df[,8], xlab = "fiber")
hist(cereal.df[,9], xlab = "carbo")
hist(cereal.df[,10], xlab = "sugars")
hist(cereal.df[,11], xlab = "potass")
hist(cereal.df[,12], xlab = "vitamins")
hist(cereal.df[,14], xlab = "weight")
hist(cereal.df[,15], xlab = "cups")

#1-(3), (b, c)
count(cereal.df, fiber)

#1-(4) box graph
par(mfrow=c(1, 2))
HOT <- cereal.df %>%
  filter(type == "H")
HOT
COLD <- cereal.df %>%
  filter(type == "C")
COLD
boxplot(HOT$calories~HOT$type, xlab = "HOT", ylab = "calories")
boxplot(COLD$calories~COLD$type, xlab = "COLD", ylab = "calories")

#1-(5)  box graph
par(mfrow=c(1, 3))
shelf1 <- cereal.df %>%
  filter(shelf == 1)
shelf2 <- cereal.df %>%
  filter(shelf == 2)
shelf3 <- cereal.df %>%
  filter(shelf == 3)
mean(shelf3$rating)
boxplot(shelf1$rating~shelf1$shelf, xlab = "shelf1")
boxplot(shelf2$rating~shelf2$shelf, xlab = "shelf2")
boxplot(shelf3$rating~shelf3$shelf, xlab = "shelf3")

# word 작성을 위한 확인 작업
shelf3 <- cereal.df %>%
  filter(shelf == 3)
mean(shelf3$rating)

#1-(6)
round(cor(cereal.df[,4:16]),2)
plot(cereal.df[,-c(1:3)])  
#NA제거
round(cor(na.omit(cereal.df[-c(1:3)])),2)
