library(ggplot2)
library(dplyr)

riding <- read.csv("RidingMowers.csv")

df_riding <- riding
View(df_riding)

#1번문제
plot(df_riding$Lot_Size ~ df_riding$Income, xlab = "Lot_Size", ylab="Income", 
     col = ifelse(df_riding$Ownership == "Owner","black","red"))
legend('topright', legend = c("Owner", "NonOwner"), col = c("black", "red"), #legend 오른쪽 상단 표시
       cex = 0.8, pch = 1)
      
#2-(1)번문제
laptop <- read.csv("LaptopSalesJanuary2008.csv")
df_laptop <- laptop
View(df_laptop)      

data.for.plot <- aggregate(df_laptop$Retail.Price, by = list(df_laptop$Store.Postcode), FUN = mean) #데이터 생성 
data.for.plot
names(data.for.plot) <- c("StorePostcode", "Price") #변수 이름 설정정

ggplot(data = data.for.plot, aes(reorder(x = StorePostcode, Price), y = Price), stat = "identity") + geom_col() + coord_flip() + xlab('StorePostcode')
#막대그래프 그리고, 정렬

#2-(2)번문제 
note <- df_laptop %>%
  filter(Store.Postcode == "N17 6QA") 
note   

note2 <- df_laptop %>%
  filter(Store.Postcode == "W4 3PH")
note2

par(mfcol = c(1, 2)) #그래프 두 개 같이 그리기 위한 작업
boxplot(note$Retail.Price~note$Store.Postcode, xlab = "Store.Postcode$N17 6QA", ylab = "Retail.Price") #평균 소매가격이 가장 높은 매장 
boxplot(note2$Retail.Price~note2$Store.Postcode, xlab = "Store.Postcode$W4 3PH", ylab = "Retail.Price") #평균 소매가격이 가장 작은 매장
