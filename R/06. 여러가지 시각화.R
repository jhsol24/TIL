# 시각화 알아보기
install.packages('mlbench')
library(mlbench)
str(Ozone)
data(Ozone)
?Ozone

# 산점도
head(Ozone)

# 숫자형 데이터인 경우
plot(Ozone$V8, Ozone$V9)

# 축 이름(xlab, ylab)
plot(Ozone$V8, Ozone$V9,
     xlab = 'Sandburg Temp',
     ylab = 'EI Monte Temp')

# title(main)
plot(Ozone$V8, Ozone$V9,
     xlab = 'Sandburg Temp',
     ylab = 'EI Monte Temp',
     main = 'Region Ozone')

# 점의 종류(pch) : 1~25 사용하고 '기호'로도 대체 가능
# 점 크기
# 색상
plot(Ozone$V8, Ozone$V9,
     xlab = 'Sandburg Temp',
     ylab = 'EI Monte Temp',
     main = 'Region Ozone',
     pch  = '?',
     cex  = .8,
     col  = 'purple')

# 좌표축의 범위(xlim, ylim)
range(Ozone$V8, na.rm = T)
range(Ozone$V9, na.rm = T)

plot(Ozone$V8, Ozone$V9,
     xlab = 'Sandburg Temp',
     ylab = 'EI Monte Temp',
     main = 'Region Ozone',
     pch  = '?',
     cex  = .8,
     col  = 'purple',
     xlim = c(20,100),
     ylim = c(25,90))

# jitter : 겹치는 점들을 좀 더 명확하게 보이게 함
?Ozone
?jitter
plot(jitter(Ozone$V6), jitter(Ozone$V7))
head(Ozone)

data(cars)
str(cars)
head(cars)
?cars

#type
plot(cars$speed, cars$dist)
plot(cars, type = 'l')
plot(cars, type = 'o')

# 직선 (abline)
# b0 : 절편, b1 : 기울기
# y = b0+b1x+e

# dist = -5 + 3.5 * speed
plot(cars)
abline(a = -5, b = 3.5, col = 'purple')

# 그래프에서 speed와 dist 평균까지 abline 표시한다면?
abline(h=mean(cars$dist), lty=2, col = 'orange')
abline(v=mean(cars$speed), lty=2, col = 'navy')

# 선형회귀(lm)
# lm(종속변수 ~ 독립변수, data = )

# dist = -5 + 3.5 * speed
# dist = -17.579 + 3.932 * 4
abs(-17.579 + 3.932 * 4)
head(cars)

car_model <- lm(dist ~ speed, data = cars)
car_model
abline(car_model)

# 점 (points)
# iris, Sepal.Width, Sepal.Length -> plot

plot(iris$Sepal.Width, iris$Sepal.Length,
     cex = .7,
     pch = 20,
     xlab = 'width', ylab = 'length',
     main = 'iris')
points(iris$Petal.Width, iris$Petal.Length,
       cex = .5,
       pch = '+',
       col = '#99FFCC')

with(iris,
     {
       plot(iris$Sepal.Width, iris$Sepal.Length,
            cex = .7,
            pch = 20,
            xlab = 'width', ylab = 'length',
            main = 'iris')
       points(iris$Petal.Width, iris$Petal.Length,
              cex = .5,
              pch = '+',
              col = '#99FFCC') 
       legend('topright',
              legend = c('Sepal', 'Petal'),
              pch = c(6,7),
              cex = .8,
              col = c('black', 'red'),
              bg = 'gray')
     }
     
# boxplot
summary(iris$Sepal.Width)
boxplot(iris$Sepal.Width)

# IQR(3사분위수 - 1사분위수)
# 1사분위수 2.8
# 3사분위수 3.3
# median    3.0
# whisker 값을 계산한다면
# 중앙값 - 1.5 * IQR (lower whisker)
# 중앙값 + 1.5 * IQR (upper whisker)

3.0 - 1.5*(3.3-2.8)
3.0 + 1.5*0.5

boxplotStats <- boxplot(iris$Sepal.Width,
                        horizontal = T)
boxplotStats
text(boxplotStats$out,
     rep(1, NROW(boxplotStats$out)),
     pos = 1, cex = .5)

# iris의 setosa종과 versicolor 종의
# Sepal.Width에 대한 상자 그림을 그려보자
sw <- subset(iris, Species == 'setosa' | Species == 'versicolor')
str(sw)
sw$Species <- factor(sw$Species)
levels(sw$Species)
boxplot(Sepal.Width ~ Species, data = sw)
boxplot(iris$Sepal.Width, iris$Species == 'setosa')

# hist(빈도수 기반, 밀도 기반)
region <- read.csv(file.choose())
str(region)
avgTemp <- region$평균기온
hist(avgTemp)

hist(avgTemp, breaks = 30)


# ggplot ******** 중요 *********
# - ggplot()
# - geom_그래프 계열
# - gemo_ 도형 계열
# - coord_계열, labs

library(ggplot2)
library(dplyr)

# ggplot 필수함수로 데이터와 축 지정
iris

# geom_point()
# geom_line()
# geom_boxplot()
# geom_histogram()
# geom_bar()

# point()
# 종에 따라 색상, 모양, 크기를 다르게 한다면?
ggplot(data = iris,
       aes(x = Sepal.Length,
           y = Sepal.Width)) +
  geom_point(pch  = c('8','A','L')[iris$Species],
             size = c(5,6,7)[iris$Species],
             col  = c('black', 'gold','purple')[iris$Species])

# 도형계열
# Species별 Sepal.Length, Sepal.Width 최대, 최소값 구하라
library(plyr)
aesXY <- ddply(iris,
               .(Species),
               summarise,
               min_x = min(Sepal.Length),
               max_x = max(Sepal.Length),
               min_y = min(Sepal.Width),
               max_y = max(Sepal.Width))

aesX_start <- max(aesXY$min_x)
aesX_end   <- min(aesXY$max_x)
aesY_start <- max(aesXY$min_y)
aesY_end   <- min(aesXY$max_y)

# annota
irisG+
  annotate(geom = 'rect',
           xmin = aesX_start,
           ymin = aesY_start,
           xmax = aesX_end,
           ymax = aesY_end,
           fill = 'purple',
           alpha = .1,
           col = 'black',
           lty = 2)

irisG <- ggplot(data = iris,
                aes(x = Sepal.Length,
                    y = Sepal.Width)) +
  geom_point(pch  = c('8','A','L')[iris$Species],
             size = c(5,6,7)[iris$Species],
             col  = c('black', 'gold','purple')[iris$Species])

# 외부옵션을 활용한 -  coord_계열, labs
# 축 변환 - coord_flip()
# 축 범위 - coord_cartesian()
irisG
irisG + coord_flip()

# 라벨링 - labs()
irisG + labs(title = '제목',
             x = 'x 이름',
             y = 'y 이름름')

# ggplot
sampleDF <- data.frame(
  years = c(2015, 2016, 2017, 2018, 2019, 2020),
  gdp   = c(300, 350, 400, 450, 500, 550)
)

# 1. 틀 생성
# aes : 축의 이름 생성
# tip : 한 번에 만들지 말고 틀>dot>line>... 순서로
ggplot(data = sampleDF,
       aes(x = years, y = gdp))+
  geom_point() +
  geom_line(linetype = 'dashed')

install.packages('gcookbook')
library(gcookbook)
data(uspopage)
str(uspopage)
head(uspopage)

# year, thousands 가지고 기본적 ggplot() 만들어보세요
ggplot(data = uspopage,
       aes(x = Year, y = Thousands, fill = AgeGroup))+
  geom_area(alpha = .5, col = 'purple')

# geom_bar()
korMovies <- c('강철비2','반도','테넷','킹덤','살아있다')
cntMovies <- c(5,11,3,34,23)

moviesDF <- data.frame(moviesName = korMovies,
                       moviesCnt  = cntMovies)

ggplot(data = moviesDF,
       aes(x = moviesName, y = moviesCnt))+
  geom_col(col = 'gold', width = .7)

library(MASS)
str(Cars93)
head(Cars93)

ggplot(data = Cars93,
       aes(x = Type))+
  geom_bar(fill = 'gray', col = 'black')+
  ggtitle('Bar Chart by Type')

library(sqldf)
install.packages('sqldf')

# 자동차의 유형별로 집계(count())해서 막대그래프를 
# 표현한다면?
type_cnt <- sqldf('select type, count(*) as cnt
                  from Cars93
                  group by Type
                  order by Type')
type_cnt
?sqldf

ggplot(data = type_cnt,
       aes(x = Type, y = cnt))+
  geom_bar(stat = 'identity', fill = 'gray', col = 'orange')+
  ggtitle('Bar Chart by Type')

# melt 사용해서 Dataframe을 변형 후 plot 만들기
maleStu   <- c(20, 35, 30, 27, 25, 23)
femaleStu <- c(17, 28, 33, 29, 26, 24)
classNum  <- c(1,2,3,4,5,6)

stuDF <- data.frame(maleStu, femaleStu, classNum)
stuDF

library(reshape2)
stuMelt <- melt(stuDF, id = 'classNum')

ggplot(data = stuMelt,
       aes(x = classNum, y = value, fill = variable))+
  geom_bar(stat = 'identity', width = .4)

# multi_bar
ggplot(data = stuMelt,
       aes(x = classNum, y = value, fill = variable))+
  geom_bar(stat = 'identity',
           width = .4,
           position = position_dodge(width = .5))

# Cars93 데이터를 이용하여
# 차종(Type)별 제조국(Origin)별 자동차 수를 가지고
# 막대그래프를 그려본다면?
str(Cars93)
head(Cars93)

ggplot(data = Cars93,
       aes(x = Type, fill = Origin))+
  geom_bar(position = position_dodge(width = .5),
           col = 'black')+
    ggtitle('Bar Chart of Frequency by Car Type & Origin')

# 워드클라우드(Word Cloud) 그리기
install.packages('wordcloud2')
library(wordcloud2)

head(wordcloud2)
wordcloud2(demoFreq,
           color = 'random-light',
           backgroundColor = 'gray')

install.packages('webshot')
install.packages('htmlwidgets')

library(webshot)
library(htmlwidgets)

wImg <- wordcloud2(demoFreq,
                   color = 'random-light',
                   backgroundColor = 'black')
saveWidget(wImg,
           'wImg.html',
           selfcontained = F)
webshot::install_phantomjs()
webshot('wImg.html',
        'wImg.pdf',
        vwidth = 480,
        vheight = 480,
        delay = 5)

# 시각화 실습
# data - airquality
?airquality
head(airquality)
names(airquality) <- c('ozone','solar',
                       'wind','temp','month','day')
str(airquality)

# 1. x축은 day, y축은 temp 틀 만들기
ggplot(data = airquality,
       aes(x = day, y = temp))

# 2. 만들어진 틀에 산점도 그리기
ggplot(data = airquality,
       aes(x = day, y = temp))+
geom_point()

# 3. 크기를 3, 색상을 빨간색으로 적용한 산점도 그리기
ggplot(data = airquality,
       aes(x = day, y = temp))+
  geom_point(size = 3,
             col = 'red')

# 4. 만들어진 틀에 꺾은선 그래프와 선점도 그리기
ggplot(data = airquality,
       aes(x = day, y = temp))+
  geom_line()

# 5. 꺾은선 그래프 색상을 빨간색과 산점도 크기를 3의로
# 변경하고 겹쳐 그리기
ggplot(data = airquality,
       aes(x = day, y = temp))+
  geom_point(size = 3,
             col = 'red')+
  geom_line(col = 'red')

# 6. day 열을 그룹지어, 날짜별 온도 상자그림(boxplot) 그리기
str(airquality)
head(airquality)
boxplot(temp ~ day, data = airquality)

# 7. temp 히스토그램 그리기
hist(airquality$temp)

# 아래부터는 mtcar 데이터 이용
# 1. cyl 종류별 빈도수 확인 geom_bar
str(mtcars)
cyl_cnt <- sqldf('select cyl, count(*) as cnt
                  from mtcars
                  group by cyl
                  order by cyl')
cyl_cnt
ggplot(data = cyl_cnt,
       aes(x = cyl, y = cnt))+
  geom_bar(stat = 'identity', fill = 'gray', col = 'orange'
           , width = 0.3)+
  ggtitle('Bar Chart by cyl')

# 2. 빈 범주(결측값)를 제외하고 cyl 종류별 빈도수 확인
ggplot(data = cyl_cnt,
       aes(x = factor(cyl), y = cnt))+
  geom_bar(stat = 'identity', fill = 'gray', col = 'orange'
           , width = 0.3)+
  ggtitle('Bar Chart by cyl')

# 5. cyl 종류별 gear빈도 누적 막대 그래프 그리기
ggplot(mtcars, aes(x = factor(cyl)))+
  geom_bar(aes(fill = factor(gear)))

# 6. cly열을 x축으로 지정하여 cly별 gear 빈도 파악 선버스트
# 차트 그리기
ggplot(mtcars, aes(x = factor(cyl)
                   geom_bar(aes(fill = factor(gear)
                                coord_polar))))
# 7. cly열을 x축으로 지정하여 cly별 gear 빈도 파악 원그래프
# 그리기
ggplot(mtcars, aes(x = factor(cyl)))
