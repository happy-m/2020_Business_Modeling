library(ggplot2)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
mpg
View(mpg)
#복사
df_mpg <- mpg

midwest <- as.data.frame(ggplot2::midwest)  
midwest
#복사
df_midwest <- midwest

#1번문제
ggplot(df_mpg) + geom_point(aes(x = cty, y = hwy), colour = "navy", alpha = 1)

#2번문제
ggplot(df_midwest) + geom_point(aes(x = poptotal, y = popasian)) + xlim(0, 500000) + ylim(0, 10000)                                                             

#3번문제
df_cty <- df_mpg %>% 
  filter(class == "suv") %>%  #suv차종 필터
  group_by(manufacturer) %>% #만든 회사로 그룹
  summarise(mean.cty = mean(cty)) %>% #평균 연비
  arrange(desc(mean.cty)) %>% #높은 순이니까 내림차순
  head(5)
df_cty
ggplot(df_cty, aes(x = reorder(manufacturer, -mean.cty), y = mean.cty)) + geom_col()

#4번문제
ggplot(data = df_mpg, aes(x = class)) + geom_bar()
