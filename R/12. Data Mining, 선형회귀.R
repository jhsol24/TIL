# 데이터마이닝
# 지도학습
# - 분류모델(classification)
# - -알고리즘(KNN, SVN, D-TREE, RandomForest,
#    logistic regression etc...)
# - 예측모델(prediction, estimation)
# - - 알고리즘(regression) :

# bizidohakseup
# -- 군집분석(clustering)
# -- 연관규칙(Association rule)
# -- 연속규칙(Sequence rule)

# 1. 단순회귀분석
# 상관분석 vs 회귀분석

# 상관분석 : 하나의 변수와 다른 변수와의 밀접한 관련성을 분석하는 기법
# cor()
# 회귀분석 : 두변수간의 원인과 결과의 인간관계가 있는지를 분석하는 기법
# lm()

height <- c(100, 120, 130, 140, 150, 160, 170, 180, 193)
foot   <- c(200, 205, 210, 220, 230, 240, 250, 270, 290)

plot(height, foot,
      xlab = '키',
      ylab = '발크기')
cor(height, foot)
abline(h = mean(foot), lty=2)
abline(v = mean(height), lty=2)
?cor
?abline

airquality
str(airquality)

air01 <- airquality[ , c(1:4)]
install.packages('psych')
library(psych)

pairs.panels(air01) # ozone, temp가 가장 높음
plot(air01$ozone, air01$temp)

cor(air01$ozone, air01$temp)
cor(air01)

summary(air01)

# NA가 있는 행 찾기
air01[!complete.cases(air01),]

air02 <- air01[complete.cases(air01), ]
air02[!complete.cases(air02), ]

# 결측값을 포한하는 행을 삭제하는 다른 방법 : na.omit(air01)
str(air02)
# -1<=r<=1
cor(air02)

install.packages('corrplot')
library(corrplot)

air.cor <- cor(air02)
corrplot(air.cor, method = 'number')

# 상관계수를 시각화를 통해서 표현하기
# circle, square, ellipse, shade, color, pie
corrplot(air.cor, method = 'circle')
corrplot(air.cor, method = 'ellipse')
corrplot(air.cor, method = 'number')

# ---- [실습]
df <- read.csv("http://goo.gl/HKnl74")
str(df)

colSums(is.na(df))


# 놀이기구의 만족도가 높으면 전체 만족도 또한 높지않을까 예상
plot(df$overall~df$rides)
cor(df$overall, df$rides)

cor.test(df$overall, df$rides)

# --- 실습 iris

iris
colSums(is.na(iris))
# 가설
# 꽃받침의 길이가 길수록 꽃잎의 넓이도 크다.
# Sepal : 꽃받침
# Petal : 꽃잎

str(iris)
cor(iris[ ,1:4])
cor.test(iris$Sepal.Length, iris$Sepal.Width)

symnum(cor(iris[ , 1:3]))

install.packages('corrgram')
library(corrgram)
corrgram(cor(iris[ , 1:4]), type = 'corr',
         upper.panel = panel.conf)

# 선형 회귀분석
# 예측 모델에서 사용하는 알고리즘
# 인과 관계를 분석하는 방법

# 1. 조건
# x가 변할 때 y도 변한다.
# 2. 조건
# 시각적으로 선행 되어야 한다.
# 3. 조건
# 외생변수를 통제 (다른 요인을 통제하고 인과관계를 분석)

# 종속변수, 목표변수
# - 영향을 받는 변수

# 독립변수, 설명변수
# - 영향을 주는 변수

# model <- lm()
# plot(model)
# summary()
# abline()
# abline(intercept, slope)

# y = b0 + b1x  + e
# b0 = 절편
# b1 = 기울기
# e(epsilon) : 오차


women
str(women)

# weight = b0 + b1 * height
head(women)
fit_model <- lm(weight ~ height, data = women)
-87.52 + 3.45 * 58
plot(weight ~ height, data = women)
abline(h = mean(women$weight), lty = 2)
abline(h = mean(women$height), lty = 1)
abline(fit_model, lty = 2, col = 'brown')

fitted(fit_model)[1]

# 모델 예측치
y_pred <- -87.52 + 3.45 * 58
y_pred

# 오차
err <- 115-112.58
err

residuals(fit_model)[1]

summary(fit_model)
cor.test(women$weight, women$height)
predict(fit_model, newdata = data.frame(height = 78))

women01 <- women
women01$height <- women01$height*2.54
women01$weight <- women01$weight*0.453592
women01
predict(fit_model, newdata = data.frame(height = 180))

# 예측모델 평가지표
# ME(Mean of Errors)
# MSE(Mean of Squared Error)
# RMSE(Root Mean of Squared Error)
# MAE(Mean of Absolute Error)
# MPE(Mean of Percentage Error)

install.packages('forecast')
library(forecast)

swiss
str(swiss)

model01 <- lm(Fertility ~ . , data = swiss)
model02 <- lm(Fertility ~ Agriculture, data = swiss)

plot(swiss$Fertility)
lines(model01$fitted.values, col = 'red')
lines(model02$fitted.values, col = 'blue')

accuracy(model01)
accuracy(model02)

accuracy(fit_model)

# ----- 선형회귀분석 PART02
# service_datasets_product_regression.csv
product <- read.csv(file.choose())

cor(product)
product_reg <- lm(제품_친밀도 ~제품_만족도, data = product)














# ----- [실습]PART03
# Linear Regression

# https://www.kaggle.com/andonians/random-linear-regression

# service_datasets_train_ml.csv
train <- read.csv(file.choose())
str(train)

# 1. 결측치 확인 및 제거
colSums(is.na(train))
train[!complete.cases(train), ]
train <- train[complete.cases(train), ]

# 2. 상관분석
cor(train)
plot(train)
abline(h = mean(train$y), lty = 2, col = 'gold')
abline(v = mean(train$x), lty = 2, col = 'blue')

# 3. 이상치 확인
boxplot(train$x,
        main = 'x')

boxplot(train$y,
        main = 'y')

# 회귀 적합모델 생성 (goal : x의 값을 통해 y의 값을 예측)
train_model <- lm(y ~ x, data = train)
train_model
head(train, 1)

y_pred <- -0.1073 + (24 * 1.0007)
y_pred

fitted(train_model)[1]

err <- 21.54945 - 23.9095
err

residuals(train_model)[1]

summary(train_model)

# 분석 결과를 시각화
library(ggplot2)

ggplot(train, aes(x,y))+
  geom_point(col = 'blue')+
  geom_line(aes(x,
               y = predict(train_model, newdata = train)),
           col = 'red')

# 정확도를 계산
y_predict <- predict(train_model, newdata = test)
y_predict[1]
head(test, 1)

ggplot( , aes(x,y))+
  geom_point(col = 'blue')+
  geom_line(aes(x,
                y = predict(train_model, newdata = test)),
            col = 'red')+
  ggtitle('X vs Y')+
  xlab('X')+
  ylab('Y')

compare <- cbind(actual = test$y, y_predict)
accuracy(train_model)

# 다중(다항) 선형회귀
iris
# Sepal.Length 예측 <- 종속변수
# 나머지는 독립변수

iris_model <- lm(Sepal.Length ~ .-Species, data = iris)
summary(iris_model)

# 회귀직선 그리기 (abline)
# abline() 첫번째 인자는 절편, 두번째 인자는 기울기, 선 스타일

# service_datasets_insurance_ml
insu_train <- read.csv(file.choose())
str(insu_train)

# 종속변수 : charges
# 독립변수 : age, bmi, children

# 상관계수 : 

cor(insu_train[, c('age','bmi','children','charges')])
corrplot(air.cor, method = 'circle')
corrplot(air.cor, method = 'square')
corrplot(air.cor, method = 'ellipse')
corrplot(air.cor, method = 'shade')
corrplot(air.cor, method = 'color')
corrplot(air.cor, method = 'pie')

insu_model <- lm(charges ~ age + bmi + children, data = insu_train)
age <- insu_model$coefficients[2]
bmi <- insu_model$coefficients[3]
children <- insu_model$coefficients[4]

# y = (19*age)+(27.9*bmi)+(0*childeren)
lm(charges ~ age + bmi + children + smoker + region, data = insu_train)

install.packages('car')
library(car)

Prestige
str(Prestige)
# 종속변수 : income
# 독립변수 : education, women, prestige

# 상관분석
prestige_train <- Prestige[, c(1:4)]
cor(prestige_train)
head(prestige_train, 1)

# 회귀모델 만들기
prestige_model <- lm(income ~., data = prestige_train)
# y = Intercept + (a1 * x1) + (a2 * x2) + (a3 * x3)
predict_y <- -253.8 + (177.2 * 13.11) + (-50.9 * 11.16) + (141.4 * 68.8)

summary(prestige_model)

# service_datasets_train_test_ml.csv
test <- read.csv(file.choose())
str(test)
