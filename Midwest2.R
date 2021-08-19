library(ggplot2)
install.packages("dplyr")
library(dplyr)
#midwest를 데이터프레임 형태로 불러오기
midwest <- as.data.frame(ggplot2::midwest)  
midwest
View(midwest)

#복사
df_midwest <- midwest

#1번문제
#미성년 인구 백분율 구하기((전체 인구 - 성인 인구)/전체 인구)*100
df_midwest$child_rate <- ((df_midwest$poptotal - df_midwest$popadults)/df_midwest$poptotal) * 100
df_midwest

#2번문제
df_midwest %>% select(child_rate) %>% arrange(desc(child_rate)) %>% head(5)

#3번문제
#미성년 비율 등급 추가하기(ifelse문 이용)
df_midwest$child_rate_grade <- ifelse(df_midwest$child_rate >= 40, "large", (ifelse(df_midwest$child_rate >= 30, "middle", "small")))
#지역 확인
df_midwest %>% group_by(df_midwest$child_rate_grade)
table(df_midwest$child_rate_grade)
df_midwest

#4번문제
#아시아인 백분율 구하기
df_midwest$perAsian <- (df_midwest$popasian/df_midwest$popadults)*100
df_midwest %>% select(state, county, perAsian) %>% arrange(perAsian) %>% head(10)