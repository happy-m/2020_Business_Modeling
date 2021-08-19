#HW4

# 1-(1)
car <- read.csv("ToyotaCorolla.csv")
car.df <- car
View(car.df)
dim(car.df)

train.rows <- sample(rownames(car.df), dim(car.df)[1]*0.5) # 50% 추출
selected.var <- c(3, 4, 7, 8, 9, 12, 14, 17, 19, 21, 25, 26, 28, 30, 34, 39)
train.data <- car[train.rows, selected.var]
dim(train.data)
View(train.data)

valid.rows <- sample(setdiff(rownames(car.df), train.rows), dim(car.df)[1]*0.3) # 30% 추출
valid.data <- car[valid.rows, selected.var]
dim(valid.data)
head(valid.data)
View(valid.data)

test.rows <- setdiff(rownames(car.df), union(train.rows, valid.rows)) # 나머지 20% 추출
test.data <- car[test.rows, selected.var]
dim(test.data)
head(test.data)
View(test.data)

# 다중 선형 모델
car.lm <- lm(Price ~ ., data = train.data)
options(scipen = 999)

library(forecast)

car.lm.pred <- predict(car.lm, valid.data)
options(scipen = 999, digits = 0)
some.residuals <- valid.data$Price[1:20] - car.lm.pred[1:20]
data.frame("Predicted" = car.lm.pred[1:20], "Actual"= valid.data$Price[1:20], "Resudual" = some.residuals)
options(scipen = 999,digits = 3)
accuracy(car.lm.pred, valid.data$Price)

# 1-(2)번
car.lm.null <- lm(Price ~ 1, data = train.data) 
car.lm.step <- step(car.lm.null, scope = list(lower = car.lm.null, upper = car.lm), direction = "forward")
summary(car.lm.step)

# 1-(3)번

# valid.data 적용
car.lm.valid <- lm(Price ~ ., data = valid.data)
car.lm.null.valid <- lm(Price ~ 1, data = valid.data)
car.lm.step.valid <- step(car.lm.null, scope = list(lower = car.lm.null.valid, upper = car.lm.valid), direction = "forward")
car.lm.step.pred.valid <- predict(car.lm.step.valid, valid.data)
accuracy(car.lm.step.pred.valid, valid.data$Price)

# test.data 적용
car.lm.test <- lm(Price ~ ., data = test.data)
car.lm.null.test <- lm(Price ~ 1, data = test.data)
car.lm.step.test <- step(car.lm.null, scope = list(lower = car.lm.null.test, upper = car.lm.test), direction = "forward")
car.lm.step.pred.test <- predict(car.lm.step.test, test.data)
accuracy(car.lm.step.pred.test, test.data$Price)

