# lapply()
# sapply()

iris <- cbind()

iris$Sepal.Length
class(lapply(iris[ , 1:4], mean))
class(sapply(iris[ , 1:4], mean))

irisVec <- sapply(iris[ , 1:4], mean)

class(as.data.frame(irisVec))

iris[1,1] = NA
head(iris)

# split(feature, 분류기준)
irisSlMedian <- sapply(split(iris$Sepal.Length, iris$Species), 
       median, 
       na.rm = T)
class(irisSlMedian)
irisSlMedian[iris$Species]


irisSlMedian['setosa']

iris <- within(iris,
            {
              Sepal.Length <- ifelse(is.na(Sepal.Length), 
                                     irisSlMedian[iris$Species],
                                     Sepal.Length)
            })
iris
?within
x <- 1:5
y <- 6:10
z <- letters[1:5]

exampleDF <- data.frame(x,y,z)
str(exampleDF)

# x의 값이 3 이상인 결과를 새로운데이터 프레임으로 만들어 보자
subDF01 <- subset(exampleDF, x>=3)
subDF01

# y의 값이 8 이하인 결과를 새로운데이터 프레임으로 만들어 보자
subDF02 <- subset(exampleDF, y<=8)
subDF02

# x의 값이 2 이상이고 y의 값이 8 이하인 결과를 새로운데이터 프레임으로 만들어 보자
subDF03 <- subset(exampleDF, x>=2 & y<=8)
subDF03

# subset() 컬럼선택가능
subDF04 <- subset(exampleDF, x>=3, select=c(x,y))
subDF04

iris
str(iris)
names(iris)

# Petal.Length의 평균을 구해보자

meanPL <- mean(iris$Petal.Length)
subiris <- subset(iris, select=c(Sepal.Length, Petal.Length, Species))
subiris
str(subiris)
class(subiris)

# 새로생성한 프레임에 조건으로 Petal.Length가 평균이상인 데이터만 조회
subiris01 <- subset(subiris, Petal.Length>=meanPL)
subiris01
subiris02 <- subset(iris, Petal.Length>=mean(iris$Petal.Length),
                    select=c(Sepal.Length, Petal.Length, Species))
subiris02
str(subiris02)
str(subiris01)

# 위에만든 subiris01과 subiris02는 같음

# Factor?
# 범주형 변수

gender <- factor('m', c('m', 'f'))
nlevels(gender)
levels(gender)
levels(gender)[1]
str(gender)

blood.type <- factor(c('A','A','AB','0','B'))
blood.type[6] <- 'E'

is.factor(blood.type)

lettersVec <- c('a','b','a','c','b','b','c')
class(lettersVec)
lettersVec.fac <- factor(lettersVec,
                         levels = c('a', 'b', 'c'),
                         labels = c('top','mid','bottom'))
lettersVec.fac
levels(lettersVec.fac)

id     <- c(1,2,3,4,5)
gender <- c('F','M','F','M','F')

data <- data.frame(idx = id, gender = gender)
data
str(data)

data$gender <- as.factor(data$gender)
str(data)
levels(data$gender) <- c('female','male')
data

# leves() : 데이터 열 이름 변경

x <- c(11, 30, 35, 13, 23, 77, 2)
mean(x)

# group by 통해서 산술평균 구하기 ㄴ(^ _^)ㄱ

height <- c(201, 191, 211, 208, 198, 203, 202)
gender <- c('M','F','M','F','M','F','M')

height_gender_frm <- data.frame(height, gender)

# ?aggregate
# 성별로 키의 평균을 구한다면?

?aggregate

genderGroupMean <- aggregate(height_gender_frm$height, 
          list(height_gender_frm$gender), 
          mean)
str(height_gender_frm)

# 예제 데이터 mtcars
mtcars
str(mtcars)
head(mtcars)

# cyl 컬럼을 기준으로 나머지 컬럼의 평균값 구하기
grpbycyl <- aggregate(mtcars,
                      list(cylStandard = mtcars$cyl),
                      mean)

# disp 컬럼이 120 이상인 조건 추가
grpbycyl1 <- subset(grpbycyl, grpbycyl$disp>=120)
# 정정
grpbycyl1 <- aggregate(mtcars,
                       list(cylStandard = mtcars$cyl,
                            dispHigh = mtcars[,'disp'] > 120), mean)

# cyl 컬럼을 기준으로 wt 컬럼의 평균만 구하기
grpbycyl2 <- aggregate(mtcars$wt,
                       list(mtcars$cyl),
                       mean)
# 정정
grpbycyl2 <- aggregate(mtcars$wt,
                       list(cyl = mtcars$cyl),
                       mean)
             aggregate(mtcars[ ,6],
                       list(cyl = mtcars$cyl),
                       mean)
             aggregate(wt ~ cyl,
                       data = mtcars,
                       mean)
             
# carb, gear 컬럼 두가지를 기준으로 wt 구하기
aggregate(wt ~ carb + gear, data = mtcars, mean) 

# gear 기준으로 disp, wt 평균 구하기
aggregate(cbind(disp, wt)~ gear, data = mtcars, mean)

# carb, gear 컬럼 기준으로 disp, wt 평균
aggregate(cbind(disp, wt)~ carb + gear, data = mtcars, mean)

# cyl 제외한 다른 모든 컬럼을 기준으로 cyl의 평균을 구하기
aggregate(cyl ~ . , data = mtcars, mean)


# tapply(데이터, 색인, mean)
# 색인 : 범주형(factor)

class(tapply(1:10, rep(1,10), sum))

tapply(1:10, 1:10 %% 2 == 0, sum)

# iris 에서 종별로 Sepal.Length 평균
# tapply()

tapply(iris$Sepal.Length, iris$Species, mean)
class(tapply(iris$Sepal.Length, iris$Species, mean))

m <- matrix(1:8,
            ncol = 2,
            dimnames = list( c('spring', 'summer', 'fall', 'winter'),
                             c('male', 'female')))
m

# 반기별 남성 셀의 값의 합과 여성셀의 합을 구해보자

tapply(m,
       list(c(1,1,2,2,1,1,2,2),
            c(1,1,1,1,2,2,2,2)),
       sum)
?tapply

library(MASS)
Cars93

str(Cars93)
head(Cars93)
levels(Cars93$Type)

# 타입별 고속도로연비 평균
tapply(Cars93$MPG.highway, Cars93$Type, mean)
class(tapply(Cars93$MPG.highway, Cars93$Type, mean))
install.packages('ggplot2')
library(ggplot2)
qplot(MPG.highway,
      data = Cars93,
      facets = Type ~ . ,
      binwidth=2)

# 프로그램의 흐름을 제어하는 제어문, 연산자, 함수

# +,-,*,/
# %%
# ^

# 관계연산자
# ==, !=, <=, >=, <, >

# 논리연산자
# &(AND), |(OR)
# TRUEm FALSE | T,F

#제어문
# if, switch

if(T) {
  print('true')
} else {
  print('else')
}

score <- 55
if(score >= 60) {
  print('pass')
} else {
  print('fail')
}

score <- scan()
score
98

# scan() 함수를 이용하여 키보드로부터 점수를 입력받고
# 점수에 따른 학점등급을 출력하라
# cat() 함수를 이용하여 한줄로 출력

score <- scan()
score

grade <- ''
if(score >= 90){
  grade <- 'A'
} else if(score >= 80){
  grade <- 'B'
} else if(score >= 70){
  grade <- 'C'
} else if(score >= 60){
  grade <- 'D'
} else {
  grade <- 'F'
}
cat('당신의 점수는', score, '점이고, 당신의 학점은', grade)

# 주민번호 14자리를 scan() 입력받아 남자/여자를 구분하는
# if ~ else 를 구현하라~
?substr
RRN <- '931022-1234567'
if (substr(RRN, 8, 8) == '1'|substr(RRN, 8, 8) == '3'){
  print('M')
} else if (substr(RRN, 8, 8) == '2'|substr(RRN, 8, 8) == '4'){
  print('F')
} else {
  print('N/A')
}

# if ~ else 한번에 적용
# ifelse(조건식, true, false)

x <- c(1,2,3,4,5,6,7,8,9)
ifelse(x %% 2 == 0, 'even', 'odd')

naVec <- c(80,65,90,NA,95,80,NA,100)
mean(naVec, na.rm = T)
is.na(naVec)

ifelse(is.na(naVec), mean(naVec, na.rm = T), naVec)

testCsv
str(testCsv)

num5 <- testCsv$q5

num6 <- ifelse(num5>=3, 'bigger','smaller')

testCsv$q6 <- num6
head(testCsv)
table(testCsv$q6)

str(testCsv)

# q6를 범주형 변수로 변환하라
testCsv$q6 <- as.factor(testCsv$q6)
levels(testCsv$q6)

# q6 별 q5의 합은?
tapply(testCsv$q5, testCsv$q6, sum)
# 같은 표현
with(testCsv, tapply(q5, q6, sum))

# service_data_html_cont.csv
html <- read.csv(file.choose())
str(html)
head(html)

# which() : 조건에 만족하는 index를 반환

x <- c(2,3,4,5,6,7)
x
which(x==6)
x[5]

# Hawaii 주에 대한 행만 출력
html[which(html$State == 'Hawaii'), ]

# for, if

# for(루핑을 위한 값){}
#    if() {}

i <- 1:10
length(i)
for(idx in i) {
  cat('idx ->', idx, '\n')
  print(idx * 2)
}

for(idx in 1:10) {
  if(idx %% 2 != 0) {
    cat('idx ->', idx, '\n')
  }
}

# 문) 1~100까지 홀수/짝수의 합을 출력하라!!
even <- 0
odd <- 0
for(x in 1:100) {
  if(x %% 2 ==0) {
    even <- even + x
  } else {
    odd <- odd + x
  }
}
cat('짝수의 합=', even, '홀수의합=', odd)

# 다음 데이터를 이용하여 프레임을 만들어 serviceStu 에 저장

subject.kor <- c(81,95,70)
subject.eng <- c(75,88,78)
subject.mat <- c(78,99,66)
name <- c('임정섭','김정수','최호진')

serviceStu <- data.frame(name, subject.kor, subject.eng, subject.mat)
serviceStu
str(serviceStu)

# 총점과 평균을 구해서 subject.sum, subject.avg에 저장

subject.sum <- apply(serviceStu[2:4], 1, sum)
subject.avg <- round(apply(serviceStu[2:4], 1, mean),0)
serviceStu <- cbind(serviceStu, subject.sum)
serviceStu <- cbind(serviceStu, subject.avg)
serviceStu

# Add column : subject.grade

subject.grade = ''
size <- nrow(serviceStu)
for (idx in 1:size){
  if(serviceStu$subject.avg[idx]>=90){
    subject.grade[idx] <- 'A'
  } else if (serviceStu$subject.avg[idx]>=80){
    subject.grade[idx] <- 'B'
  } else if (serviceStu$subject.avg[idx]>=70){
    subject.grade[idx] <- 'C'
  } else if (serviceStu$subject.avg[idx]>=80){
    subject.grade[idx] <- 'D'
  } else{
    subject.grade[idx] <- 'F'
  }
}
serviceStu$subject.grade <- subject.grade
serviceStu