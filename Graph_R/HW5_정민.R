#(1)번문제
housing.df <- read.csv("ApplianceShipments.csv")
View(housing.df)
head(housing.df)
library(forecast)

#시계열 그래프 그리기
ApplianceShipments.ts <- ts(housing.df$Shipments, start = c(1985, 1), end = c(1989, 4), freq = 4)
#4분기로 나뉘어있으므로 freq = 4
ApplianceShipments.ts
plot(ApplianceShipments.ts, xlab = "Quarter", ylab = "Shipments")

#(2)번문제
plot(ApplianceShipments.ts, xlab = "Quarter", ylab = "Shipments", ylim = c(3500, 5000))
# Shipments 범위가 3000~5000 > ylim으로 설정 가능