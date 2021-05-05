?ddply
# ddply(데이터, .(), 처리함수)
library(plyr)

# iris 데이터에서 종별 Sepal.Length 평균을 계산한다면?
str(iris)
ddply(iris,
      .(Species), 
      function(x){
        data.frame(sepal.length.mean = mean(x$Sepal.Length))
      })

# 처리 조건으로 Sepal.Length >= 5.0. 추가한다면?
ddply(iris,
      .(Species, Sepal.Length >= 5.0), 
      function(x){
        data.frame(sepal.length.mean = mean(x$Sepal.Length))
      })

data(baseball)
head(baseball)
str(baseball)

names(baseball)

# id가 ansonca01 인 선수의 데이터만 확인하고 싶다면?
filter(baseball, id == 'ansonca01')
subset(baseball, id == 'ansonca01')

# ddply() 함수를 이용하여 각 선수별 출전한 게임수의 평균을 구한다면?
ddply(baseball,
      .(id),
      function(x){
        data.frame(g.mean = mean(x$g))
      })

# 각 선수별 최대 게임을 플레이한 해의 기록을 구한다면?
?max
ddply(baseball,
      .(id),
      subset,
      g == max(g)
      )

# reshape Package
# 변환
# cast(dcast, acast)

# melt : 가로로 긴 데이터 > 세로로 긴 데이터
?melt
library(melt)
# melt(데이터를 구분하는 식별자, 측정대상 변수, 측정치)
install.packages('reshape2')
library(reshape2)

data(french_fries)
head(french_fries)
str(french_fries)

fries_melt <- melt(id=1:4, french_fries)
head(fries_melt, 20)
tail(fries_melt, 20)

# cast()
fries_d <- dcast(fries_melt, time + treatment + subject + rep ~ variable)

# data.table 패키지
install.packages('data.table')
library(data.table)

iris_table <- data.table(iris)
iris_table[1, ]
iris_table[iris_table$Species == 'setosa', ]

# 임의의 2개의 피쳐만 출력한다면?
iris_table[1, c(Sepal.Length, Species)]
iris_table[1, list(Sepal.Length, Species)] # list 주는게 피쳐명 나옴
# iris 데이터에서 Sepal.Length의 평균값을 종별로 구한다면?
class(iris_table)
str(iris_table)
iris_table[ , mean(Sepal.Length), Species]

# --- 외부파일 읽어들이는 패키지 readxl
install.packages('readxl')
library(readxl)

# read_excel(), read.table() ->> txt파일 읽어들임, read.csv()
# excel
excel_data_sample <- read_excel(file.choose())
View(excel_data_sample)

# txt
# read.table
# header
# skip
# nrows : 몇개의 행만 가져오겠다
# sep
# col.names = c(칼럼이름) : 칼럼이름

txt_data_sample <- read.table(file.choose(), header = T)
txt_data_sample02 <- read.table(file.choose(), header = T)
txt_data_sample02

# service_data_tap_ex2.txt
colNames <- c('ID','SEX','AGE','AREA')
txt_data_sample03 <-
  read.table(file.choose(),
             header = T,
             sep = ',',
             col.names = colNames)
txt_data_sample03

# service_data_excel_sample.xlsx 읽어보자
ex_sample_data <- read_excel(file.choose())
ex_sample_data
class(ex_sample_data)
str(ex_sample_data)

ex_sample_data$SEX <- as.factor(ex_sample_data$SEX)
ex_sample_data$AREA <- as.factor(ex_sample_data$AREA)

levels(ex_sample_data$SEX)
levels(ex_sample_data$AREA)
str(ex_sample_data)

# 성별에 따른 17_AMT 평균이용 금액을 확인하고 싶다면?
ddply(ex_sample_date,
      .(SEX),
      function(x){
        data.frame(AMT17.mean = mean(x$AMT17))
      })
# or using split or adply
install.packages(dplyr)
library(dplyr)
ex_sample_data %>%
  group_by(SEX) %>%
  dplyr::summarise(cnt = n(), mean = mean(AMT17))

sapply(split(ex_sample_data$AMT17, ex_sample_data$SEX),
       mean,
       na.rm = TRUE)
# 지역에 따른 Y17_CNT 이용건수의 합을 확인하고 싶다면?
lapply(split(ex_sample_data$Y17_CNT, ex_sample_data$AREA), sum)

aggregate(ex_sample_data$Y17_CNT, list(ex_sample_data$AREA), sum)
?aggregate

# 변수명 변경하기
# dply::rename()
str(ex_sample_data)
colRename <- rename(ex_sample_data, Y17_AMT = AMT17, Y16_AMT = AMT16)

# 파생변수
colRename$AMT <- colRename$Y16_AMT + colRename$Y17_AMT
colRename$CNT <- colRename$Y16_CNT + colRename$Y17_CNT




# 1. colRename 데이터 세트에서 ID 변수만 추출
subset(colRename, select = ID)

# 2. colRename 데이터 세트에서 ID, AREA, Y17_CNT 변수 추출
subset(colRename, select = c(ID, AREA, Y17_CNT))

# 3. colRename 데이터 세트에서 AREA 변수만 제외하고 추출
subset(colRename, select = -c(AREA))

# 4. colRename 데이터 세트에서 AREA, Y17_CNT 변수를 제외하고 추출
select(colRename, -c(AREA, Y17_CNT))

# 5. colRename 데이터 세트에 AREA(지역)가 서울인 경우만 추출
filter(colRename, AREA == '서울')

# 6. colRename 데이터 세트에서 AREA(지역)가 서울이면서 
#    Y17_CNT(17년 이용 건수)가 10건 이상인 경우만 추출
filter(colRename, AREA == '서울' & Y17_CNT >= 10)

# 8. colRename 데이터 세트의 AGE 변수를 오름차순 정렬
arrange(colRename, AGE)

# 9. colRename 데이터 세트의 Y17_AMT 변수를 내림차순 정렬
arrange(colRename, desc(Y17_AMT))

# 정렬 중첩 
# 10. colRename 데이터 세트의 AGE 변수는 오름차순, Y17_AMT 변수는 내림차순 정렬
arrange(colRename, AGE, desc(Y17_AMT))

# 데이터 요약하기
# 11. colRename 데이터 세트의 Y17_AMT(17년 이용 금액) 변수 값 합계를
# TOT_Y17_AMT 변수로 도출
TOT_Y17_AMT <- sum(colRename$Y17_AMT, na.rm = T)

# 12. colRename 데이터 세트의 AREA(지역) 변수 값별로 
# Y17_AMT(17년 이용 금액)를 더해 SUM_Y17_AMT 변수로 도출
SUM_Y17_AMT <- ddply(colRename,
                     .(AREA),
                     function(x){
                     data.frame(SUM_Y17_AMT = sum(x$Y17_AMT))
                    })

# 13. colRename 데이터 세트의 AMT를 CNT로 나눈 값을 
# colRename 데이터 세트의 AVG_AMT로 생성
colRename$AVG_AMT = colRename$AMT/colRename$CNT
colRename

# 14. colRename 데이터 세트에서 AGE 변수 값이 50 이상이면 “Y”
# 50 미만이면 “N” 값으로 colRename 데이터 세트에 AGE50_YN 변수 생성 
colRename$AGE50_YN = ifelse(colRename$AGE >=50, 'Y', 'N')
str(colRename)

# ::나이분류
# 15. colRename 데이터 세트의 
# AGE 값이 50 이상이면 “50++”, 
# 40 이상이면 “4049”
# 30 이상이면 “3039”, 
# 20 이상이면 "2029”, 
# 나머지는 “0019”를 값으로 하는 AGE_GR10 변수 생성 
colRename$AGE_GR10 = ifelse(colRename$AGE >=50, '50++',
                            ifelse(colRename$AGE >=40, '4049',
                            ifelse(colRename$AGE >=30, '3039',
                            ifelse(colRename$AGE >=20, '2029',
                            '0019'))))

# 데이터 결합
# service_data_excel_m_history.xlsx 열기
library(readxl)
male_hist <- read_excel(file.choose())
male_hist

# service_data_excel_f_history.xlsx 열기
female_hist <- read_excel(file.choose())
female_hist

# 세로결합 : 셀 기준이기때문 (헷갈리지말기)
# 변수명 기준으로 결합
# bind_rows()

m_f_bind_join <- bind_rows(male_hist, female_hist)

# 가로결합
# left_join : 지정한 변수와 데이터세트1을 기준으로 데이터세트2에 있는
#             나머지 변수 결합
# inner_join : 데이터세트1과 데이터세트2에서 기준으로 지정한 변수값이
#              동일할 때만 결합
# full_join : 전체를 결합
# service_data_jeju_y17_history.xlsx
# service_data_jeju_y16_history.xlsx
# 위 두개의 파일을 읽어보자.
jeju_y17_hist <- read_excel(file.choose())
jeju_y16_hist <- read_excel(file.choose())

# ID를 기준으로 jeju_y17_hist 데이터 세트를 기준으로 결합
bind_left <- left_join(jeju_y17_hist, jeju_y16_hist, by='ID')
bind_inner <- inner_join(jeju_y17_hist, jeju_y16_hist, by='ID')
bind_full <- full_join(jeju_y17_hist, jeju_y16_hist, by='ID')

# service_data_excel_sample.xlsx
sample_excel <- read_excel(file.choose())
sample_excel

# 특정 값이 얼마나 반복되는지 분석하고 싶다면?

# descr::freq()
install.packages('descr')
library(descr)

freqArea <- freq(sample_excel$AREA, plot = T,
                 main = '지역별 빈도')
freqArea

# 성별에 따른 빈도분석을 하려고 한다면?
freqGender <- freq(sample_excel$SEX,
                   plot = T,
                   main = '성별 빈도')
freqGender

barplot(freqGender)

# 시각화
# 변수 구분(이산 vs 연속)
# 이산형 변수 : 변수가 가질 수 있는 값이 끊어진 변수
# - 명목변수
# - 순위변수
# 막대, 점, 파이

char_data <- c(380, 520, 330, 390, 320, 460, 300, 405)
names(char_data) <-
  c('2018 1Q', '2019 1Q','2018 2Q', '2019 2Q','2018 3Q', '2019 3Q','2018 4Q', '2019 4Q')

char_data
range(char_data)
max(char_data)
length(char_data)

# 막대차트:: barplot()
barplot(char_data)
barplot(char_data, ylim = c(0,600))
barplot(char_data, ylim = c(0,600),
        col = rainbow(2))
barplot(char_data, ylim = c(0,600),
        col = rainbow(2),
        main = '2018 vs 2019 분기매출')
barplot(char_data, xlim = c(0,600),
        col = rainbow(2),
        main = '2018 vs 2019 분기매출',
        horiz = T)
barplot(char_data, 
        xlim = c(0,600),
        col = rainbow(2),
        main = '2018 vs 2019 분기매출',
        horiz = T,
        ylab = '년도별 분기',
        xlab = '2018 vs 2019 분기매출 현황')

# dot chart
?dotchart

dotchart(char_data)
dotchart(char_data,
         color = c('green', 'red'),
         xlab  = '매출액',
         ylab  = '년도별 분기',
         pch   = 1:2,
         cex   = 0.8,
         lcolor = 'brown')

# pie chart
pie(char_data)
par(mfrow = c(2,2))
pie(char_data)

pie(char_data,
    border = 'brown',
    col    = rainbow(8))

data(iris)

class(table(iris$Species))

pie(table(iris$Species))

# 연속변수 (상자그래프, 히스토그램, 산점도)
# = 변수가 연속된 구간을 갖는다는 뜻
# 간격변수, 비율변수
# boxplot, hist, plot()

# 시각화
# VADeaths

data(VADeaths)
VADeaths

str(VADeaths)
summary(VADeaths)
boxplot(VADeaths) # *****중요***** 정규화,표준화에 쓰임

# Histogram
data(iris)

# attach(), detach()
attach(iris)
mean(Sepal.Length)
detach(iris)

iris
summary(iris)
hist(iris$Sepal.Length)
hist(iris$Sepal.Length,
     xlab = '꽃받침의 길이',
     col  = 'brown',
     main = 'iris SL',
     xlim = c(4.0, 8.0))

# 꽃받침의 넓이 히스토그램으로
hist(iris$Sepal.Width,
     xlab = '꽃받침의 넓이',
     col  = 'green',
     main = 'iris SW',
     xlim = c(2.0, 4.5),
     freq = F)
lines(density(iris$Sepal.Width), col = 'red')

# 산점도(plot)
x <- runif(5, min = 0, max = 1)
y <- x^2
plot(x,y)

price <- runif(10, min = 2, max = 8)
plot(price, type = 'l')
plot(price, type = 'o')
plot(price, type = 'h')
plot(price, type = 's')

# pch : 점의 모양 1~25 존재
plot(price, type = 'o', pch = 17)

# iris - scatter matrix(산점도 매트릭스)
# pairs()

iris
pairs(iris[1:4])

# 3차원 산점도
install.packages('scatterplot3d')
library(scatterplot3d)

# 종별로 분류해서 변수에 담아 보세요
str(iris)
# 다른방법들
subset(iris, Species == 'setosa')
iris[iris$Species = 'setosa']

iris_setosa     <- filter(iris, Species == 'setosa')
iris_versicolor <- filter(iris, Species == 'versicolor')
iris_virginica  <- filter(iris, Species == 'virginica')

iris3D <- scatterplot3d(iris$Petal.Length,
                        iris$Sepal.Length,
                        iris$Sepal.Width, type='n')

iris3D$points3d(iris_setosa$Petal.Length,
                iris_setosa$Sepal.Length,
                iris_setosa$Sepal.Width,
                bg='brown',
                pch=21)

iris3D$points3d(iris_versicolor$Petal.Length,
                iris_versicolor$Sepal.Length,
                iris_versicolor$Sepal.Width,
                bg='gray',
                pch=23)

iris3D$points3d(iris_virginica$Petal.Length,
                iris_virginica$Sepal.Length,
                iris_virginica$Sepal.Width,
                bg='orange',
                pch=22)
