# service_data_new_data_eda.csv
dataset <- read.csv(file.choose())
View(dataset)
str(dataset)

# 범주형 vs 범주형을 가지고 데이터의 분포를 확인한다면?
# 1. resident2, age2 를 범주형으로 변환
dataset$resident2 <- as.factor(dataset$resident2)
dataset$gender2 <- as.factor(dataset$gender2)
levels(dataset$resident2)
levels(dataset$gender2)

# 2. 두 변수를 table()함수를 이용하여 분포를 확인해보자
resident_gender <- table(dataset$resident2,
                         dataset$gender2)
resident_gender

barplot(resident_gender,
        horiz = T,
        beside = T,
        legend = row.names(resident_gender),
        col = rainbow(5))




library(ggplot2)
resident_gender_DF <- data.frame(resident_gender)
ggplot()+
  geom_bar(data = resident_gender_DF,
           aes(x = Freq, y = Var2, fill = Var1),
           stat = 'identity', position = 'dodge')

# position 을 dodge로 하면 누적bar -> 멀티bar

mosaicplot(resident_gender, col = rainbow(2))

# 직업유형(job2) vs 나이(age2)
head(dataset)
dataset$job2 <- as.factor(dataset$job2)
levels(dataset$resident2)
job_age <- table(dataset$job2,
                 dataset$age2)

barplot(job_age,
        horiz = F,
        beside = T,
        legend = row.names(job_age),
        col = rainbow(3))
ggplot()+
  geom_bar()

# 숫자형 vs 범주형
# 직업유형에 따른 나이 비율?

# 카테고리 유형별 시각화
install.packages('lattice')
library(lattice)
str(dataset)
densityplot(dataset$age, dataset,
            group = dataset$job2,
            auto.key = T)

# auto.key : 범례

ggplot()+
  geom_bar(data = dataset,
           aes(x = age, fill = job2),
           position = 'dodge')


# --------------실습------------------
# 데이터 프레임의 복사본 생성하기
library(ggplot2)
midwest_raw <- as.data.frame(midwest)
midwest_new<-midwest_raw

str(midwest_new)
head(midwest_new)

# [문제]
# poptotal(전체인구) 변수를 total로, 
# popasian(아시안 인구) 변수를 asian으로 수정하세요.
install.packages('dplyr')
library(dplyr)
midwest_new_rn <- rename(midwest_new, total = poptotal, asian = popasian)
head(midwest_new_rn)

# [문제]
# total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 
# percasian 파생변수를 만들고,
# 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보세요.

hist(midwest_new_rn$percasian,
     xlab = 'Percentage of Asian',
     main = 'Histogram of Percentage of Asian')

?geom_histogram
str(midwest_new_rn)

# [문제]
# 아시아 인구 백분율 전체 평균을 구하고, 
# 평균을 초과하면 "large", 
# 그 외에는 "small"을 부여하는 mean 파생변수를 만들어 보세요.
percasian_mean <- mean(midwest_new_rn$percasian)
midwest_new_rn$percasian2 <- ifelse(
  midwest_new_rn$percasian > percasian_mean, 'large', 'small')

table(midwest_new_rn$percasian2)


# [문제]
# "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도표와 
# 빈도 막대 그래프를 만들어 확인해 보세요.
percasian3 <- table(midwest_new_rn$percasian2)

barplot(percasian3,
        col = rainbow(2),
        main = 'Is Percentage of Asian over mean?')


# ggplot2의 midwest 데이터를 사용하여 데이터 분석을 실습하는 문제 입니다.

# popadults는 해당 지역의 성인 인구, 
# poptotal은 전체 인구를 나타냅니다. 

# 1번 문제
# midwest 데이터에 '전체 인구 대비 미성년 인구 백분율' 변수를 추가하세요.
str(midwest)
midwest$percadults_not <- with(midwest,
                               ((poptotal - popadults)/poptotal)*100)
head(midwest)

# 2번 문제
# 미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의 
# 미성년 인구 백분율을 출력하시오.
tail(sort(midwest$percadults_not), n=5)


# 3번 문제
# 다음과 같은 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 
# 각 등급에 몇 개의 지역이 있는지 알아보세요.

# 분류     기준
# large    40%이상
# middle   30 ~ 40미만
# small    30미만

percadults_not2 <- ifelse()




# 4번 문제
# popasian은 해당 지역의 아시아인 인구를 나타냅니다. 
# '전체 인구 대비 아시아인 인구 백분율' 변수를 추가하고 
# 하위 10개 지역의 state(주), county(지역), 아시아인 인구 백분율을 출력하세요.



# 시계열 (time series)
# 변수간의 상관성





# --------------오후 수업-------------
# iris 시계열 데이터 만들기

iris

seq = as.integer(rownames(iris))
iris <- cbind(iris, seq)
head(iris)
data(iris)
irisDF <- cbind(seq, iris)
head(irisDF)

# x축은 seq
# y축은 -Species

colsColor <- topo.colors(4, alpha = .4)

names(colsColor) <- names(irisDF)[2:5]

irisDF
library(reshape2)
# melt함수를 이용해서 기준 seq, species
# 나머지 컬럼을 variable 해서 wide -> long

iris_melt <- melt(irisDF, id = c('seq', 'Species'))

library(ggplot2)
g <- ggplot()+
  geom_line(data = iris_melt,
            aes(x = seq, value, col = variable),
            cex = 0.8,
            show.legend = T)

# 추가적으로 선의 색상과 범례 라벨링
g <- g + scale_color_manual(
  name = 'iris',
  values = colsColor[iris_melt$variable],
  labels = c('꽃받침 길이', '꽃받침 너비', '꽃잎 길이', '꽃잎 너비')
)
g

# 날짜
# 문자변수를 날짜변수 변환

# R의 날짜 데이터 타입 'POSIXct'
# as.POSIXct

str_date <- '200730 13:40'
as.POSIXct(str_date, format = '%y%m%d %H:%M')

str_date <- '2020-07-30 13:40:01 PM'
as.POSIXct(str_date, format = '%Y-%m-%d %H:%M:%S')

str_date <- '07/30/20 13:40:01'
as.POSIXct(str_date, format = '%m/%d/%y %H:%M:%S')


# service_data_cospi_time_series_visualization.csv
cospi <- read.csv(file.choose())
str(cospi)
head(cospi)
table(is.na(cospi))

cospi$Date <- as.POSIXct(cospi$Date, format = '%Y-%m-%d')

cospi_melt <- melt(cospi, id = c('Date', 'Volume'))

g <- ggplot(cospi_melt, aes(x = Date,
                            y = value,
                            col = variable,
                            group = variable))+
  geom_line(cex = 0.8, show.legend = T)
g




# ------------------실습----------------------
# service_high_speed_spanish_trains.csv
train <- read.csv(file.choose())
str(train)
trainDF <- train

# 1.
# 데이터 내에 결측치 여부를 확인한다. 
# NA값이 310681개 있는 것을 확인할 수 있다.
trainDF[!complete.cases(trainDF), ]
str(trainDF)

# 2.
# filter와 !is.na함수를 통해 결측치를 모두 제거했다.
trainDF2 <- trainDF[complete.cases(trainDF), ]

# 3.
# 마드리드 출발
# 마드리드에서 출발하는 열차 데이터만을 떼어내 madrid_origin이라는 변수로 저장하고 
# 우선, 마드리드에서 출발하는 열차 데이터만을 이용해 비교해보기로 한다.
str(trainDF2)
madrid_origin <- trainDF2[trainDF2$origin == 'MADRID', ]
str(madrid_origin)


# 4.
# summary함수를 통해 일반적 데이터 정보를 다시 확인한다.
summary(madrid_origin)




# 5.
# 마드리드 출발 열차의 빈도 수
# 마드리드를 출발하는 기차의 도착 도시별 운행빈도 수를 바형태로 나타내보자
ggplot(data = madrid_origin,
       aes(x = destination, fill = destination))+
  geom_bar()+
  coord_flip()


# 6.
# 마드리발 도착지별 가격 박스플롯으로
# 티켓가격의 높은 순을 확인해보자 ---->>>> 높은순 모르겠다.
?arrange
madrid_origin_arr <- arrange(madrid_origin, desc(madrid_origin$price))
boxplot(price ~ destination,
        data = madrid_origin_arr,
        horizontal = T)
head(madrid_origin)



# 7.
# AVE의좌석 등급별 가격박스플롯이 시각화 
# 똑같은 열차와 똑같은 좌석등급, 똑같은 도착지라 하더라도 
# 가격이 차이가 나는 것을 확인할 수 있다.
train_type : AVE
str(trainDF)
head(trainDF)




# 8. 
# 이 차이를 이해하고 싶어 시계열로 데이터를 만들어보았다.

# 9.
#날짜 데이터 변환. as.POSIXct는 factor형식의 날짜 사용가능


# 10.
# 컬럼이름지정
colnames(a_b) <- c("preferente","Turista")


# 11.
# 도착지별, 트레인 클래스별로 가격을 박스플롯형태로 나타낼 수도 있다.
