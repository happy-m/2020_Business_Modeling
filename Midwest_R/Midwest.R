library(ggplot2)
#midwest를 데이터프레임 형태로 불러오기
midwest <- as.data.frame(ggplot2::midwest)  
midwest
View(midwest)

#복사
df_midwest <- midwest
df_midwest

#1번 문제(분석을 위한 함수 사용)
dim(df_midwest)
#전체적인 요약확인
summary(df_midwest)
#백인의 백분율과 히스토그램그래프
df_midwest$white_radio <- (df_midwest$popwhite / df_midwest$poptotal) * 100
hist(df_midwest$white_radio)
#흑인의 백분율과 히스토그램 그래프프
df_midwest$black_radio <- (df_midwest$popblack / df_midwest$poptotal) * 100
hist(df_midwest$black_radio)
summary(df_midwest$asian_radio)

#rename하기 위해 dplyr패키지 설치
install.packages("dplyr")
library(dplyr)

#2번 문제
df_midwest <- rename(df_midwest, total = poptotal)
df_midwest <- rename(df_midwest, asian = popasian)

#3번 문제
df_midwest$asian_radio <- (df_midwest$asian / df_midwest$total) * 100
df_midwest$asian_radio
hist(df_midwest$asian_radio, xlab = "asian_radio")

#4번 문제
#아시아인구 백분률의 평균 구하기
mean(df_midwest$asian_radio)
#평균 = 0.4872462보다 크면 large 아니면 small로 하는 ifelse문
df_midwest$group <- ifelse(df_midwest$asian_radio > 0.4872462, "large", "small")
head(df_midwest)

#5번 문제
#빈도표
table(df_midwest$group)
#빈도 막대 그래프
qplot(df_midwest$group)

