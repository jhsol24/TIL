stock <- read.csv(file.choose())
str(stock)

head(stock)

stock$diff <- stock$High - stock$Low
head(stock)
mean(stock$diff)

# diff 변수를 이용해서 diff_result 파생변수 생성
# for~
# diff_result에 stock$diff의 평균보다 크면 "nean over", 작으면 "mean under"

row <- nrow(stock)
rows <- 1:row
diff_result = ''

for(idx in rows){
  if(stock$diff[idx] > mean(stock$diff)){
    diff_result[idx] <- 'mean over'
  }else{
    diff_result[idx] <- 'mean under'
  }
}

diff_result

stock$diff_result <- diff_result
head(stock)

# while(i<10){
# 조건을 이용해서 탈출
# }
idx <- 1
while(idx <= 10){
  print(idx)
  idx <- idx + 1
}

# 1 ~ 100의 사이의 5의 배수만 출력하고 싶다면?
idx <- 1
while(idx <= 100) {
  if(idx %% 5 == 0) {
    print(idx)
  }
  idx <- idx + 1
}

# next(continus) : 조건을 만족했을 때 실행하지 않고 넘어감 , break

idx <- 0
while(idx <= 10) {
  idx <- idx + 1
  if(idx && 2 != 0){
    next
  }
  print(idx)
}
print('while outer')

# NA 갯수를 확인
# data.frame

naDF <- data.frame(x = c(NA,2,3),
                   y = c(NA,4,5))

naDF
sum(is.na(naDF))

# NA 처리
NA & T

# 문제를 해결하기 위해서
sum(c(1,2,3,NA))
sum(c(1,2,3,NA), na.rm = T)
mean(c(1,2,3,NA), na.rm = T)

# pakage::caret
# na.omit(), na.pass(), na.fail()

na.omit(c(1,2,3,NA))
na.pass(c(1,2,3,NA))
na.fail(c(1,2,3,NA))

irisDF <- iris

# 임의로 결측값을 넣어보자
irisDF[2:13,3]<-NA
irisDF[1:5,4]<-NA
irisDF[24:77,2]<-NA
irisDF[43:99,5]<-NA

irisDF

?heatmap
heatmap(1 * is.na(irisDF),
        Rowv = NA,
        Colv = NA,
        scale = 'none',
        cexCol = .9)

# 함수정의
newSumFunc <- function(x,y) {
  result <- x + y
  return (result)
}

resultSum <- newSumFunc(11,30)
resultSum

# return 값 설정 안해도 마지막 문장을 자동으로 return

newSumFunc <- function(x,y) {
  cat('x=',x,'\n')
  cat('y=',y,'\n')
  result <- x + y
  return (result)
}

resultSum <- newSumFunc(y=11,x=30)
resultSum

# 가변함수
varFunc <- function(...) {
  args <- list(...)
  result <- 0
  for(idx in args) {
    result <- result + idx
  }
  return (result)
}

varFunc(1)
varFunc(1,2)
varFunc(1,2,3,4)

# 결측치 비율을 계산하는 함수를 만들어보자
# 행 및 열별로 비율 계산하기

irisDF

naMissFunc <- function(x){
 sum(is.na(x))/length(x) * 100 
}

# 행별 결측치 비율을 계산해보자
rowMissingPer <- apply(irisDF, 1, naMissFunc)
colMissingPer <- apply(irisDF, 2, naMissFunc)

irisDF
barplot(colMissingPer)

#조작함수

iris
mtcars

# merge() : join
# rbind(), cbind()

x <- data.frame(name = c('jslim', 'eklim', 'jwlim'),
                math = c(100, 60, 95))
x
y <- data.frame(name = c('jwlim', 'eklim', 'jslim'),
                eng = c(100, 70, 90))
x
y
rbind(x,y)
cbind(x,y)
xy <- cbind(x,y)

merge(x,y)

# summaryBy(), orderBy(), splitBy(), sampleBy()

summary(iris)

# 자료의 분포 quantile()
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, seq(0,1,by = 0.1))

install.packages('doBy')
library(doBy)

# summaryBy()
# 원하는 컬럼의 값을 특정 조건에 따라 요약하는 목적 (사용자 입장에서 보는 것)
?summaryBy

summaryBy(Sepal.Length + Sepal.Width ~ Species, iris)
summaryBy(. ~ Species, iris)

# orderBy()
# 정렬을 위한 목적

?orderBy

orderBy( ~ Species, iris)
orderBy( ~ Species + Sepal.Width, iris) # Species와 Sepal.Width에 따른 오름차순

# pakage::base
# base order()
library(base)

# order() : 주어진 값을 정렬했을 때의 색인 순서대로 반환
order(iris$Sepal.Width)
iris[order(iris$Sepal.Width), ]
# sample()
# 복원추출
# 비복원추출

?sample
sample(1:10, 5, replace = T)
sample(1:28, 28)
sample(nrow(iris), 150)
iris[sample(nrow(iris), nrow(iris)),]

?sampleBy
library(doBy)
examSampleBy <- sampleBy(~ Species, frac = 0.2, data = iris)
examSampleBy

train <- sampleBy(~ Species, frac = 0.8, data = iris)
train

# split()
# 반환값 list
# lapply, sapply
?split
split(iris, iris$Species)

# iris 종별 Sepal.Length 평균
SLmean <- aggregate(iris$Sepal.Length, 
          list(iris$Species), 
          mean)
str(SLmean)

# 정석>>>
irisList <- lapply(split(iris$Sepal.Length, iris$Species), mean)
irisList
class(irisList)

irisVec <- unlist(irisList)
irisVec
class(irisVec)

irisMat <- matrix(irisVec, ncol=3, byrow=T)
irisMat
class(irisMat)

irisFrame <- as.data.frame(irisMat)
irisFrame
names(irisFrame) <- c('s_mean', 'color_mean', 'nica_mean')
class(irisFrame)

# subset()
?subset

# 조작
# package::plyr
# filter  :
# select  :
# mutate  : 열 추가
# arrange : 정렬
# summarise : 집계
# %>>%

install.packages(c("plyr", 'hflights'))
install.packages('dplyr')
library(dplyr)
library(plyr)
library(hflights)

hflights
str(hflights)
# tbl_df -> as_tibble
as_tibble(hflights)

# filter() : 조건에 따라 행을 추출
# 1월 1일 데이터를 추출
?filter
filter(hflights, Month == 1, DayofMonth == 1)
# 1월 또는 2월 데이터 추출
filter(hflights, Month == 1| Month == 2)

?as_tibble
as_tibble(filter(hflights, Month == 1| Month == 2))
tail(as_tibble(filter(hflights, Month == 1| Month == 2)), 10)

# arrange() : 기본 오름차순 정렬
# 데이터를 ArrDelay, Month, Year 순으로 정렬
?arrange
arrange(hflights, ArrDelay, Month, Year)
head(arrange(hflights, desc(Month)))

# select(), mutate() : 조건에 따라 열을 추출 / mutate는 열 추가
# select(), : -
select(hflights, Year, Month, DayofMonth)
select(hflights, Year : DayofMonth)

# Year부터 DayofWeek 를 제외한 열을 추출
head(select(hflights, -c(Year : DayOfWeek)))

# ArrDelay - DepDelay -> gain
# gain / (Airtime/60) -> gain_per_hour
flightDF <- hflights
flightgain <- 
  mutate(flightDF,
       gain <- ArrDelay - DepDelay,
       gain_per_hour <- gain / (AirTime/60))

head(flightgain)
flightgain2 <-  mutate(flightDF,
                       gain = ArrDelay - DepDelay,
                       gain_per_hour <- gain / (AirTime/60))
head(flightgain2)

flightDF <- hflights
head(transform(flightDF,
          gain = ArrDelay - DepDelay))

# summarise()
# 기초통계량 (mean, sd, var, median) 구할 수 있다.
# 데이터프레임 형식으로 반환

?summarise

# 출발지연시간 평균 및 합계 계산한다면?
mean(is.na(flightDF$DepDelay))
sum(is.na(flightDF$DepDelay))
summarise(flightDF, 
          mean = mean(flightDF$DepDelay, na.rm = T),
          sum = sum(flightDF$DepDelay, na.rm = T))
          
# hflights 데이터셋에서 비행편수 20편 이상,
# 평균 비행거리 2,000마일 이상인
# 항공사별 평균 연착시간을 계산한다면?
# TailNum : 항공기, 일련번호

head(hflights)
str(hflights)

?group_by
planes <- group_by(hflights, TailNum)
head(planes)

# 비행편수, 평균거리, 평균연착시간
delay <- summarise(planes,
                   count = n( ),
                   dist  = mean(Distance, na.rm = T),
                   delay = mean(ArrDelay, na.rm = T))

delay


delay <- filter(delay, count >= 20 & distance >= 2000)
delay
# chain을 사용하면?
flightDF %>%
  group_by(TailNum) %>%
  summarise(count = n(), distance = mean(Distance, na.rm = T), delay = mean(ArrDelay, na.rm = T)) %>%
  filter(count >= 20 & distance >= 2000)

library(ggplot2)
ggplot(delay, aes(distance, delay)) +
  geom_point(aes(size=count), alpha = 1/2)

# chain() 함수
# %>%
chain01 <- group_by(hflights, Year, Month, DayofMonth)
chain01
chain02 <- select(chain01, Year:DayofMonth, ArrDelay, DepDelay)
chain02
chain03 <- summarise(chain02,
                     arrival = mean(ArrDelay, na.rm = T),
                     depart = mean(DepDelay, na.rm = T))
# 평균 출발지연 시간이 30분 이상인 데이터 출력
result <- filter(chain03, arrival >= 30 | depart >= 30)
result
# chain을 사용하면?
hflights %>%
  group_by(Year, Month, DayofMonth) %>%
  select(Year:DayofMonth, ArrDelay, DepDelay) %>%
  summarise(arrival = mean(ArrDelay, na.rm = T), depart = mean(DepDelay, na.rm = T)) %>%
  filter(arrival >= 30 | depart >= 30)

# adply()
# 데이터 분할(split), apply, combine 기능을 한번에 해주는 함수
# 타입은 data.frame이다.
?adply
# Sepal.Length가 5.0 이상이고 Species가 setosa인지 여부를 확인한 다음
# 그 결과를 새로운 칼럼 V1에 출력하시오.
plyr::adply ( iris ,
        1 ,
        function(row){
          data.frame(divSetosa = c(row$Sepal.Length >= 5.0 & row$Species == "setosa"))
        }
)

# 설치가 안되어 오류가 날 수도 있으므로 앞에 plyr:: or dplyr:: 붙여주기