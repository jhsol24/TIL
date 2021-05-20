# http://www.localdata.kr data자료

# service_data_seoul_coffee_eda.xlsx
install.packages('readxl')
library(readxl)
coffee <- read_xlsx(file.choose())
View(coffee)
str(coffee)

# 1. 데이터 전처리

# select와 filter를 통해 아래 컬럼만 뽑고 주소지가 서울특별시인
# 데이터만 추출하여 확인해보자
# 번호, 사업장명, 소재지전체주소, 업태구분명, 시설총규모, 인허가일자, 폐업일자,
# 소재지면적, 상세영업상태명, 영업상태구분코드

# 참고 : str_detect 구문
fVector <- c('tomato','pear','apple','banana','mato')
# str_detect(vector, '문자')
str_detect(fVector, 't')
str_detect(fVector, '^t')

install.packages('dplyr')
install.packages('plyr')
library(plyr)
library(dplyr)
library(stringr)

coffee_select <- coffee %>%
  dplyr::select(번호, 사업장명, 소재지전체주소, 업태구분명, 시설총규모,
       인허가일자, 폐업일자,소재지면적, 상세영업상태명, 영업상태구분코드) %>%
filter(str_detect(소재지전체주소, '서울특별시'))

coffee_select_coffeeshop <- coffee_select %>%
  filter(업태구분명 == '커피숍')
View(coffee_select_coffeeshop)

# 폐업하지 않고 현재 영업중인 카페 찾기
coffee_select_open <- coffee_select_coffeeshop %>%
  filter(상세영업상태명 == '영업') %>%
summary()
View(coffee_select_open)
head(coffee_select_open)
str(coffee_select_open)
summary(coffee_select_open)


# 지역구별로 데이터 나누기 (서대문, 영등포, 동대문) 3개의 구만
# 추출 (시각화로 사용할 예정)
coffee_select_reg <- coffee_select_open %>%
  filter(substr(소재지전체주소, 7, 10) == '서대문구'|
         substr(소재지전체주소, 7, 10) == '영등포구'|
         substr(소재지전체주소, 7, 10) == '서대문구')


?mutate

coffee_select_reg <- coffee_select_reg %>%
  mutate(지역구 = ifelse( substr(coffee_select_reg$소재지전체주소,6,9)=="서대문", 
                       substr(coffee_select_reg$소재지전체주소,6,10),
                       ifelse(substr(coffee_select_reg$소재지전체주소,6,9)=="영등포", 
                              substr(coffee_select_reg$소재지전체주소,6,10),
                              ifelse(substr(coffee_select_reg$소재지전체주소,6,9)=="동대문",
                                     substr(coffee_select_reg$소재지전체주소,6,10),
                                     substr(coffee_select_reg$소재지전체주소,7,9)))))

# 인허가일자와 폐업일자의 데이터 형식이 chr와 logic으로 되어있는 것을
# 확인할 수 있다.  ymd함수를 통해 chr와 logic형식으로 되어있는 데이터 형식을
# Date로 바꾼다.
install.packages('lubridate')
library(lubridate)
?ymd

str(coffee_select_reg$인허가일자)
str(coffee_select_reg$폐업일자)
coffee_select_reg$인허가일자 <- ymd(coffee_select_reg$인허가일자)
coffee_select_reg$폐업일자 <- ymd(coffee_select_reg$폐업일자)

ymd
# Date로 바꾼 인허가 일자 데이터를 바탕으로 인허가
# year, month, day를 각각 추출해 가변수를 만들어보자.
coffee_select_reg$년도 <- year(coffee_select_reg$인허가일자)
coffee_select_reg$월 <- month(coffee_select_reg$인허가일자)
coffee_select_reg$일 <- day(coffee_select_reg$인허가일자)

str(coffee_select_reg)

# 데이터 형식 전처리 (규모 변수 추가)
# 시설총규모 타입 확인 후 문자형 -> 수치형
# 시설총규모에 따라 이를 구분지어
# 초소형, 초형, 중형, 대형, 초대형으로 구분지어 보려고 한다면
# 구분은 다음코드와 같이 임의로 지정
# 3제곱미터 이하는 초소형,
# 30제곱미터 이하는 소형,
# 70제곱미터 이하는 중형,
# 300제곱미터 이하는 대형 그 이상은 초대형
str(coffee_select_reg$시설총규모)
coffee_select_reg$시설총규모 <- as.numeric(coffee_select_reg$시설총규모)
coffee_select_reg$규모 <- with(coffee_select_reg,
                          ifelse(시설총규모 <= 3, '초소형',
                          ifelse(시설총규모 <= 30, '소형',
                          ifelse(시설총규모 <= 70, '중형',
                          ifelse(시설총규모 <= 300, '대형', '초대형')))))

coffee_select_reg$규모

coffee_select_reg <- coffee_select_reg%>%                      
mutate(규모 = ifelse(시설총규모 <= 3, '초소형',
              ifelse(시설총규모 <= 30, '소형',
              ifelse(시설총규모 <= 70, '중형',
              ifelse(시설총규모 <= 300, '대형', '초대형')))))

# 규모별 커피숍 수 확인하기
table(coffee_select_reg$규모)


# 영업중이면서 인허가일자가 2000년 이후인 커피숍 수를 규모별로 확인해본다면?
str(coffee_select_reg)
coffee_select_reg_2000 <- coffee_select_reg %>%
  filter(상세영업상태명 == '영업' & 인허가일자 >= '2000-01-01') %>%
  group_by(규모) %>%
  summarize(n=n()) %>%
  arrange(desc(n))
 
#
summary(coffee_select_reg_2000)



# 가장 큰 규모의 카페는 어딜까요?
# which.max 함수는 색인 추출
coffee_select_reg_2000[which.max(coffee_select_reg_2000$시설총규모) , ]
coffee_select_reg_2000[which.min(coffee_select_reg_2000$시설총규모) , ]

# 시설 총규모를 시각화 한다면?
library(ggplot2)
ggplot(coffee_select_reg_2000,
       aes(x = 시설총규모, fill = 규모))+
geom_histogram(binwidth=30)+
scale_x_continuous(breaks = c(100,200,300,400,500,600))
# scale_x_continuous : x축 범위를 나눌 때 적용


head(coffee_select_reg_2000)
# 현재영업중인 카페의 인허가연도 히스토그램
coffee_select_reg_2000 %>%
  ggplot(aes(x = 년도, fill = 규모))+
  geom_histogram(alpha = 0.5, color = 'black')


# 영업과 폐업한 카페의 인허가 연도를 히스토그램으로 시각화
View(coffee_select4)
coffee_select4 %>%
  ggplot(aes(x = 년도, fill = 상세영업상태명))+
  geom_histogram(alpha = 0.5, color = 'black', bins = 20)+
  ggtitle('연도별 서울 소재 커피숍 인허가 수 (현재 영업 & 폐업 포함')

# 서울소재 커피숍의 인허가 년도별 숫자 확인
# 확인 후 데이터프레임으로 작성
d1 <- as.data.frame(
  coffee_select4 %>%
    filter(인허가일자 >= '2000-01-01'))%>%
    group_by(년도) %>%
    summarise(n=n())
d1 


# 서울소재 커피숍의 인허가 년도별 숫자와 현재 영업중인 정보확인
# 확인 후 데이터프레임으로 작성
d2 <- as.data.frame(
  coffee_select4 %>%
    filter(상세영업상태명 == '영업' & 인허가일자 >= '2000-01-01')) %>%
    group_by(년도) %>%
    summarise(n=n())
View(coffee_select4)
d2

d3 <- merge(d1, d2, by ='년도')

d3 <- d3 %>%
  mutate(prob = (n.y)/(n.x))

# 생존율 시각화
# geom_line, geom_point
d3 %>%
ggplot(aes(x = 년도, y = prob))+
  geom_line(color = 'purple')+
  geom_point()
ggtitle('서울소재 커피숍의 인허가 연도별 생존률')

names(coffee_select4)

View(coffee_select4 %>%
       filter(년도 == 2001) %>%
       group_by(지역구))

# 2001년도 시설총규모에 따른 영업구분을 히스토그램으로 시각화

coffee_select4 %>%
  filter(년도 == '2001') %>%
  ggplot(aes(x=시설총규모, fill=상세영업상태명))+
  geom_histogram()

# 2000년도 ~
# 지역구에 따른 년도별 커피숍 인허가 정보를 요약하고
# 데이터 프레임으로 만들어보자
g1 <- as.data.frame(
  coffee_select4 %>%
    filter(인허가일자 >= '2010-01-01') %>%
    group_by(년도, 지역구) %>%
                 summarise(n=n())))

# 2000년도~
# 지역구에 따른 년도별 커피숍 인허가 정보와
# 현재영업중인 정보를 요약하고
# 데이터 프레임으로 만들어보자
g2 <- as.data.frame(
  coffee_select4 %>%
    filter(상세영업상태명=='영업' & 인허가일자 >= '2010-01-01') %>%
    group_by(년도, 지역구) %>%
    summarise(n=n())))