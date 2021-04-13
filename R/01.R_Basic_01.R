?letters
letters
month.abb
month.name
?print
# package란? 함수(function) + 데이터셋(dataset)
install.packages("stringr")
library(stringr)
.libPaths()

library()

print("섭섭쌤 윤종신 닮았어요")

sprintf()

# %d : 정수, %f : 실수, %s : 문자

sprintf("%d", 123)
sprintf("Number : %d", 100)
sprintf("Number : %d, String : %s", 100, 'hsjeong')

sprintf("%.2f", 123.456)
sprintf("%5d", 123)
sprintf("%5d", 12345)
sprintf("%5d", 123456)

print('subsubi')
print('neinom')

name <- 'hsjeong' ;
name

myFunc <- function() {
  total <- 0
  cat("append ...")
  for(i in 1:10){
    total <- total+i
    cat(i, "...")
  }
  cat("End!!", "\n")
  return(total)
}

myFunc() 

# 변수 (알파벳, 숫자, _, . 로 구성된다. 단 첫글자는 반드시 문자 또는 . 로 )
# 시작될수 있다.
# 단일형 : vector, matrix, array
# 복수형 : list, data.frame

# Vector == python 에서는 Vector를 list 타입으로 취급한다.
# c()

sample_vec <- c(1,2,3,4,5)

sum(sample_vec)/length(sample_vec)
mean(sample_vec)

class(sample_vec)
typeof(sample_vec)
mode(sample_vec)

x <- 1:10
x
y <-x^2
y
plot(x,y)

boolean_vec <- c(T,F,T,F)

# 변수의 의미를 체크할 때 쓰는 함수
str(boolean_vec)
class(boolean_vec)
typeof(boolean_vec)
mode(boolean_vec)

string_vec <- c('a', 'b', 'c', 'd')
string_vec

sample_na <- NA
sample_na
is.na(sample_na)

sample_null <- NULL
sample_null
is.null(sample_null)

over_vec <- c(1,2,3, c(4,5,6))

# rep(), seq()

rep(1:7, 5)
rep(1:7, each = 5)

?seq

# seq(from, to, by)
seq(1,10,2)

seq(1,10,length.out = 5) # length.out : 간격

seq_vec02 <- seq(1,100,by=3)
length(seq_vec02)

# indexing[]
seq_vec02[27]

# 인덱싱에서 조건식을 활용할 수 있다.
# AND = &, OR = |

# 인덱스 번지가 30 이하인 데이터만 출력하려면?
seq(1,seq_vec02[30],3)

# 인덱스 번지가 10 이상이고 30 이하인 데이터만 출력하려면?
seq(seq_vec02[10],seq_vec02[30],3)




# 데이터가 30 이하인 데이터만 출력하려면?
seq_vec02[seq_vec02 <= 30]

# 데이터가 10 이상이고 30 이하인 데이터만 출력하려면?30
seq_vec02[seq_vec02 >= 10 & seq_vec02 <= 30]

# 데이터가 10 이상 이거나 30 이하인 데이터만 출력하려면?
seq_vec02[seq_vec02 >= 10 | seq_vec02 <= 30]

# index가 홀수인 데이터만 출력하려면?
seq_vec02[seq(1,length(seq_vec02),2)]

# round()

data_x<-c(1,2,3)
cols<-c('lim','park','jeong')
?names
# names()
names(data_x) <- cols

names(data_x)
names(data_x)[3]

data_x['lim']
data_x[c('lim','jeong')]

# Vector Indexing(인덱스는 1)
# 벡터내의 데이터 접근 방법

index_vec <- c(1,3,5,7,9)
index_vec[2]
index_vec[5:3]
index_vec[length(index_vec):3]

index_vec[c(1,3)]

# 특정요소만을 제외한다면
index_vec
index_vec[-1]
index_vec[c(-2,-4)]

# 길이
length(index_vec)
nrow(index_vec) # 행과 열을 가진 프레임 형식에서 행의 갯수를 리턴
NROW(index_vec) # 1차원의 벡터를 2차원으로 만들어서 행의 벡터로 리턴

# %in% 연산자
bool <- "A" %in% c('A','B')
bool

# setdiff(), union(), intsect()
setdiff(c("a","b","c"), c("a","b"))

# setequl() 집합간의 비교

# 100에서 200으로 구성된 벡터 sampleVec를 생성한 다음
# 각 문제를 수행하는 코드를 작성하고 답을 구하시오!!
sampleVec <- c(100:200)

# hint : head(), tail()
# 문1) 10번째 값을 출력하세요
sampleVec[c(10)]
# 문2) 끝에서 10개의 값을 잘라내어 출력하세요
head(sampleVec, 91)
# 문3) 홀수만 출력하세요
sampleVec[seq(2,length(sampleVec),2)] 
sampleVec[sampleVec %% 2 == 1]
# 문4) 3의 배수만 출력하세요
sampleVec[seq(3,length(sampleVec),3)]
sampleVec[sampleVec %% 3 == 0]
# 문5) 앞에서 20개의 값을 잘라내고 smapleVec.head 변수에 저장하고 출력
sampleVec.head<-sampleVec[seq(21, length(sampleVec))]
# 문6) sampleVec.head 변수에서 5번째 값을 제외하고 출력
sampleVec.head[-5]
# 문7) sampleVec.head 변수에서 5,7,9번째 값을 제외하고 출력
sampleVec.head[c(-5,-7,-9)]

head(sampleVec,10)
?head

# 월별 결석생 수 통계가 다음과 같을 때
# 이 자료를 absent 벡터에 저장하시오
# (결석생 수를 값으로 하고, 월 이름을 값의 이름으로 한다.)

?month.name
absent <- c(10,8,14,15,9,10,15,12,9,7,8,7)

names(absent) <-month.name
absent

# 문1) 5월의 결석생 수를 출력
absent[5]
# 문2) 7월,9월의 결석생 수를 출력
absent[c(7,9)]
# 문3) 상반기(1~6월)의 결석생 수의 합계를 출력
sum(absent[1:6])
# 문4) 하반기의 결석생 수의 평균을 출력
round(mean(absent[7:12]),2)

# 논리형벡터, 문자형벡터
c(T,F,TRUE,FALSE)
c(T,F,T) & c(F,T,F)
!c(T,F,T)
xor(c(T,F,T),c(T,T,F))

(randomNum <- runif(3))
(0.3<=randomNum)&(randomNum<=0.7)
any(randomNum > 0.8) # 하나라도 만족할 경우 T
all(randomNum > 0.8) # 둘다 만족해야 T

c('a','b','c','d','e')
strVec<-c('H','S','T','N','O')
strVec[1] > strVec[5] # 문자열 비교 가능
strVec[3] > strVec[5]

paste('May I', 'help you ?') # 두 문자열을 붙임

paste(month.abb, 1:12)
paste(month.abb, 1:12, c("st", "nd", "r",rep('th', 9)))

paste('/usr', 'local', 'bin', sep='/')
seqVec<-paste(1:4)
class(seqVec)

paste(seqVec, collapes='jslim')
paste(seqVec, collapes='')

# 정규표현식 함수()
# grep(pattern, data, ignore.case, value)
?grep

grepValue <- c('gender', 'name', 'age', 'height', 'weight', 'tall',
               'eight')
grepValue

# 문1) 'ei'로 시작되는 요소가 있는지
grep('^ei', grepValue)

# 문2) 'ei' 문자를 포함하는 요소가 있는지
grep('ei', grepValue, value=T)

grepTxt <- c('Bigdata', 'Bigdata','bigdata','Data','dataMining',
             'textMining', 'campus6', 'campus5')
grepTxt

# 문) b로 시작하는 하나 이상의 문자 패턴을 확인하고 싶다면?

grep('^b+', grepTxt, value = T, ignore.case = T)

# gsub(pattern, replacement, data, ignore.case)
# 문자열에서 문자를 바꾸는 기능
grepTxt

# 문) big 이라는 단어를 bigger 라는 단어로 바꾸고자한다면?
gsub('big', 'bigger', grepTxt)
gsub('big', 'bigger', grepTxt, ignore.case = T)

# 문) grepTxt에서 숫자를 제거하고자 한다면?
gsub('[0-9]', '', grepTxt)

sub('[0-9]', '', grepTxt)

nchar(grepTxt)
str_length(grepTxt)

# strsplit(data, split) : 문자열을 쪼개는 함수이다.
# substr(data, start, stop)

greetingMsg <- 'Hi, Bigdata is very important'
class(strsplit(greetingMsg, ' '))
substr(greetingMsg, 5,11)

remove.packages('stringr')

install.packages('stringr')
library(stringr)

?str_extract_all
str_extract_all('abc123def456', '[0-9]{3}')
str_extract_all('abc123def456', '[a-z]{3}')

stringDumy <- '임정섭jslim48섭섭해seop34유관순임꺽정홍길동30'
str_extract_all(stringDumy, '[a-z]{3,4}')
str_extract_all(stringDumy, '[a-z]{3,}')

# 문) 연속된 한글 3자 이상 추출
eqName <- str_extract_all(stringDumy, '[가-힣]{3,}')
class(eqName)

# 문) 나이 추출
age <- str_extract_all(stringDumy, '[0-9]{2}')
age
class(age)

# 문) 숫자를 제외
escapeNum <- str_extract_all(stringDumy, '[^0-9]{3,}')
class(escapeNum)

# 문) 한글이름 추출 (영문자 제외)
names <- str_extract_all(escapeNum[[1]], '[^a-zA-Z]{3,}')
names

# 단어와 숫자에 관련된 메타문자
# 단어(word)    : \\w
# 숫자(digit)   : \\d
# 엔터키, 탭키  : \n, \t

ssn <- '730910-1234567'
ssn

str_extract_all(ssn, '[0-9]{6}-[1-4][0-9]{6}')
str_extract_all(ssn, '\\d{6}-[1-4]\\d{6}')

email <- 'jslim9413@naver.com'
email

str_extract_all(email, '\\w{4,}@[a-z]\\w{3,}.[a-z]{2,}')

# 문자열 길이 : str_length()
stringLength <- '우리는 달려간다 이상한 나라로 섭섭'

# 문자열 위치
str_locate_all(stringLength, '섭섭')
class(str_locate_all(stringLength, '섭섭'))

# 특수문자 제외
num <- '$123,456'
num
tmp <- str_replace_all(num, '\\$|\\,','')
tmp
class(tmp)

# 형변환
# as.numeric(tmp)
data <- as.numeric(tmp)
data * 2
