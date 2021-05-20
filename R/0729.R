# 시각화 마무리 & EDA

library(ggplot2)
seoul_subway <- read.csv(file.choose())
head(seoul_subway)
str(seoul_subway)

# x 축을 평균일 승차인원으로 설정하고
# y 축을 각 노선의 운행횟수로 설정

ggplot(data = seoul_subway,
       aes(x = AVG_ONEDAY, y = RUNNINGTIMES_WEEKDAYS))+
  geom_point(aes(col = LINE, size = AVG_CROWDEDNESS))

# x 축 각 노선(LINE)으로 일평균 막대그래프를 만들어보자

ggplot(data = seoul_subway,
       aes(x = LINE, y = AVG_ONEDAY))+
  geom_bar(stat = 'identity',
           aes(fill = LINE))

# mtcars
# 차량별 연비를 가지고 시각화 하려고 한다.
# 문제점?
# rownames()

mtcars$type <- rownames(mtcars)
mtcars

# 차량별 연비를 이용해서 막대그래프

ggplot(data = mtcars,
       aes(x = type, y = mpg))+
  geom_bar(stat = 'identity')

# same
ggplot()+
  geom_bar(data = mtcars,
           aes(x = type, y = mpg),
           stat = 'identity')

# reorder(type, mtcars$mpg) 오름차순 정렬
ggplot(data = mtcars,
       aes(x = reorder(type, mpg),
           y = mpg))+
  geom_bar(stat = 'identity')+
  theme(axis.text.x = element_text(angle = 90))

carMpg <- ggplot(data = mtcars,
                 aes(x = reorder(type, mpg),
                     y = mpg))+
            geom_bar(stat = 'identity')+
            coord_flip()

carMpg + labs(x = '', y = '', title = '차량별 연비')



# EDA(Exploratory Data Analysis)

# 1. 데이터 탐색
# 2. 결측지(NA) 처리
# 3. 이상치(outlier) 발견 처리
# 4. 리코딩(코딩 변경)
# 5. 파생변수, 가변수 추가
# 6. 시각화
# 7. 의사결정

# service_data_dataset_eda.csv
dataset <- read.csv(file.choose())
View(dataset)
names(dataset)

dim(dataset)
nrow(dataset)
ncol(dataset)
length(dataset)

summary(dataset)
summary(dataset$price)
is.na(dataset$price)
table(is.na(dataset$price))

# 결측치 처리하는 방법
# caret : na.omit()
dataset_new <- na.omit(dataset)
table(is.na(dataset_new))
str(dataset_new)

# 0 대체
ifelse(is.na(price), 0, )

# 평균 대체
maen(dataset$price, na.rm = T)

ifelse()

# 통계적 방법
priceAvg <- mean(dataset$price, na.rm = T)
str(dataset)

dataset$type <- rep(1:3, 100)
head(dataset)
# type : 1 * 1.5, 2 * 1.0, 3 * .5
# 300명의 고객 유형을 판단하여
# 새로운 가변수 priceSta 만들어 처리된 값을 넣어보자

temp = 0
for (i in 1:nrow(dataset)){
  if(is.na(dataset$price[i])){
    temp[i] = priceAvg * 1.5
  }else if(dataset$type[i] == 2){
    temp[i] = priceAvg * 1.0
  }else{
    temp[i] = priceAvg * 0.5
  }
}

dataset$priceSta <- temp
dataset

gender <- dataset$gender
range(gender)
table(gender)

# subset을 활용하여 이상치를 제거한 후
# gender를 범주형으로 변환 해보자
dataset <- subset(dataset, gender == 1 | gender == 2)
table(dataset$gender)
pie(table(dataset$gender))

dataset$gender <- as.factor(dataset$gender)
levels(dataset$gender)

# if types of variables are consecutitive variables,
# how can we delete the 이상치

seqPrice <- dataset$price
length(seqPrice)
summary(seqPrice)
# IQR (Q3-Q1) 6.5-4.6 = 1.6
outlier <- boxplot(seqPrice)

dataset <- subset(dataset, seqPrice >= 2.3 & seqPrice <= 7.9)
nrow(dataset)
boxplot(dataset$price)

# age check
summary(dataset$age)

# 결측치 제거 후 시각화
dataset_age <- subset(dataset, is.na(dataset$age) == F)
boxplot(dataset_age$age, horizontal = T)
table(dataset_age$age)
nrow(dataset_age)

# 리코딩 - 데이터의 가독성을 위해
# 연속형 -> 범주형
# 형식) dataset$컬럼[조건식] <- 추가할 값
# 1: 서울, 2: 부산, 3: 광주, 4: 대전, 5: 대구
dataset$resident_new[dataset$resident == 1] <- '서울'
dataset$resident_new[dataset$resident == 2] <- '부산'
dataset$resident_new[dataset$resident == 3] <- '광주'
dataset$resident_new[dataset$resident == 4] <- '대전'
dataset$resident_new[dataset$resident == 5] <- '대구'

# 주거지의 NA 값을 행정수도인 대전으로 대체
dataset$resident_new[is.na(dataset$resident) == T] <- '대전'
head(dataset)
dataset$resident <- as.factor(dataset$resident_new)
levels(dataset$resident)

# job
# 1: 분석가, 2: 데이터과학자, 3: 개발자
dataset$job_new[dataset$job == 1] <- '분석가'
dataset$job_new[dataset$job == 2] <- '배우'
dataset$job_new[dataset$job == 3] <- '개발자'
dataset$job_new[is.na(dataset$job)] <- '백수'
dataset$job <- as.factor(dataset$job_new)
levels(dataset$job)

# ---- 간단 분석
url <- 'https://www.dropbox.com/s/0djexymb42zd1e2/example_salary.csv?dl=1'
salary_data_eda <- read.csv(url, stringsAsFactors = F, na = '-')

head(salary_data_eda)
str(salary_data_eda)

# 1. 컬럼명을 영문으로 변경
names(salary_data_eda) <- c('age','sal_month','sal_bonus','worktime',
                            'headcount','career','gender')

# 2. 각 피쳐별 결측값 확인
table(is.na(salary_data_eda$age))
table(is.na(salary_data_eda$sal_month))
table(is.na(salary_data_eda$sal_bonus))
table(is.na(salary_data_eda$worktime))
table(is.na(salary_data_eda$headcount))
table(is.na(salary_data_eda$career))
table(is.na(salary_data_eda$gender))

# 3. 임금 평균 확인
summary(salary_data_eda)
mean(salary_data_eda$sal_month, na.rm = T)

# 4. 임금 중앙값 확인
median(salary_data_eda$sal_month, na.rm = T)

# 5. 임금 범위 구해보기 (최저, 최고)

min(salary_data_eda$sal_month, na.rm = T)
max(salary_data_eda$sal_month, na.rm = T)

# 6. 임금에 대한 사분위수(quantile()) 구하기
quantile(salary_data_eda$sal_month, na.rm = T)

# 7. 성별에 따른 임금 격차 확인해보기
sal_avg_gender <- ddply(salary_data_eda,
                       .(gender),
                       summarise,
                       sal_avg = mean(sal_month, na.rm = T))

sal_avg_m <- sal_avg_gender[1,2]
sal_avg_f <- sal_avg_gender[2,2]

sal_avg_m - sal_avg_f

salary.gender_sal <- tapply(salary_data_eda$sal_month, 
                            salary_data_eda$gender, 
                            mean, 
                            na.rm = T)

# 8. 분석된 데이터를 가지고 원하는 시각화 진행
boxplot(sal_month ~ gender, data = salary_data_eda)
head(salary_data_eda)

library(reshape2)
salary.melt <-  melt(salary.gender_sal)
salary.melt
ggplot(salary.melt, aes(x = Var1 , y = value , fill = Var1))+
  geom_bar(stat = "identity")

# 9. 성별에 따른 표준편차 구하기
salary.gender_sal_range <- tapply(salary_data_eda$sal_month, 
                                  salary_data_eda$gender, 
                                  range, 
                                  na.rm = T)
salary.gender_sal_range

salary.gender_sal_sd <- tapply(salary_data_eda$sal_month, 
                               salary_data_eda$gender, 
                               sd, 
                               na.rm = T)
salary.gender_sal_sd

# 10. 경력별 임금 평균치
head(salary_data_eda)
salary.career <- tapply(salary_data_eda$sal_month,
                        salary_data_eda$career,
                        mean,
                        na.rm = T)
salary.career

# 11. 경력별 임금 평균치 시각화
ggplot(salary_data_eda, aes(x = career, y = sal_month))+
  geom_bar(stat = 'identity')

career.melt <- melt(salary.career)

ggplot(career.melt, aes(x = Var1, y = value, group = 1)) + 
  geom_line(color = "gray",
            size = 2) +
  coord_polar() +
  ylim(0 , max(career.melt$value))




# -----------------------------------------------(실습)

# 통닭집이 가장 많은 지역 찾기
# 서대문구에 통닭집이 많은 동을 시각화 해보자
install.packages("readxl")
library(readxl)
# data load : service_data_chicken_store_eda_visualization
ck <- read_xlsx(file.choose())
head(ck)

# 
# substr() 함수를 이용하여 소재지전체주소에 동만 가져오기
pattern <- regexpr('[[:alpha:]]{1,}동', ck$소재지전체주소)
dong <- regmatches(ck$소재지전체주소, pattern)

install.packages('dplyr')
library(dplyr)
dong %>% head
head(dong)

# 실행결과 동 이름이 3글자인 경우와 4글자인 경우가 있으므로 지정한
# 자리만큼 글자를 추출하면 3글자인 동은 숫자가 포함된다.
# 공백과 숫자를 제거하자




# 동별 도수분포표 만들어보기
# table() 함수를 이용해서 숫자 세기, 변수가 한개일때 도수분표표를 만들어줌
# 도수분포표란 항목별 개수를 나타낸 것이다
tableDF <- as.data.frame(table(dong))



install.packages("treemap")
library(treemap)

# 트리맵은 옵션으로 데이터 프레임을 입력받는다.
# treemap(데이터, index=구분 열 , vSize=분포 열 , vColor=컬러, title=제목)
treemap(tableDF, index="dong" , vSize="Freq" , vColor=rainbow(), title="서대문구 치킨집 분포")

