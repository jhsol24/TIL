# 데이터 전처리 및 탐색적 분석

# 1. 데이터 로드 및 라이브러리 로드 (정형데이터 처리)

library(readxl)
library(dplyr)
dustdata <- read_xlsx(file.choose())
str(dustdata)
head(dustdata)
View(dustdata)

# 로드한 데이터로부터 성북구와 중구의 미세먼지를 비교하고 시각화하기
# 2. 비교할 지역 데이터만 추출하여 미세먼지 농도차이가 있는지 확인하기
dust <- dustdata
dust_select <- dust %>%
  filter(area == '성북구'|
         area == '중구')

str(dust_select)
head(dust_select)
names(dust_select)

library(ggplot2)

dust_select %>%
ggplot()+
  geom_line(aes(x=yyyymmdd, y=finedust, col=area, group = area))

# 3. 현황 파악하기

# yyyymmdd에 따른 데이터 수 파악(내림차순 정렬)
# count() 함수 이용
count(dust_select, yyyymmdd) %>%
  arrange(desc(n))

# area 에 따른 데이터 수 파악(내림차순 정렬)
count(dust_select, area)

# 4. 지역(성북구, 중구)에 따른 데이터를 변수에 각각 할당하기
dust_sb <- subset(dust_select, area == '성북구')
dust_jg <- subset(dust_select, area == '중구')

summary(dust_sb$finedust)
summary(dust_jg$finedust)

# 5. boxplot을 이용하여 시각화하기 (분포차이)
boxplot(finedust ~ area, data = dust_select)

boxplot(dust_sb$finedust,
        dust_jg$finedust,
        main = 'finedust compare',
        xlab = 'AREA',
        names = c('성북구','중구'),
        ylab = 'FINEDUST',
        col = c('gold','purple'))

# 만약 가설에 대한 검정을 한다면
t.test(data = dust_select,
       finedust ~ area,
       var.equal = T)

# R과 DBMS 연동을 통한 정형 데이터 처리방법
install.packages('rJava')
install.packages('DBI')
# JDBC 함수 제공
install.packages('RJDBC')

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_121')
library(rJava)
library(DBI)
library(RJDBC)

# DB 연동을 위한 순서는
# Driver loading, Connection(hr,hr), Query 수행, 결과 집합 확인하는 과정으로

# Driver loading
driver <- JDBC(driverClass = 'oracle.jdbc.driver.OracleDriver',
               classPath = 'C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar')

conn <- dbConnect(driver,
                  'jdbc:oracle:thin:@localhost:1521:xe',
                  'hr',
                  'hr')

selectEmpQuery <- 'select * from employee'

# dbGetQuery() : select
empTable <- dbGetQuery(conn, selectEmpQuery)
str(empTable)
dim(empTable)

# table 생성
createTempTable <- 'create table r_tbl(id varchar2(20) primary key,
                    pwd varchar2(20),
                    username varchar2(50),
                    upoint number default 1000)'

# dbSendUpdate() : DML(insert, update, delete), DDL(create, drop, alter)
dbSendUpdate(conn, createTempTable)

# insert(dummy data)
insertSQL <- "insert into r_tbl values('jslim', 'jslim', '섭섭이', 2000)"
dbSendUpdate(conn, insertSQL)

selectDummySQL <- 'select * from r_tbl'

dumyTbl <- dbGetQuery(conn, selectDummySQL)

# jslim > 관리자 변경
updateSQL <- "update r_tbl
                  set username = '관리자'
                  where id = 'jslim'"
dbSendUpdate(conn, updateSQL)
dumyTbl <- dbGetQuery(conn, selectDummySQL)

# 아이디가 jslim인 데이터를 삭제
dbSendUpdate(conn, "delete from r_tbl where id = 'jslim'")
dumyTbl <- dbGetQuery(conn, selectDummySQL)

# table 제거
dbSendUpdate(conn, "drop table r_tbl")
dumyTbl <- dbGetQuery(conn, selectDummySQL)

# 성별에 따른 급여 평균 구하기
salary_gender <- "select emp_no, salary from employee"
dbSendUpdate(conn, salary_gender)
sgTbl <- dbGetQuery(conn, salary_gender)


# 강사님 Method 2
library(stringr)
empTable$gender <- NULL
empTable$gender <- ifelse(str_sub(empTable$EMP_NO, 8, 8) == 1 |
                          str_sub(empTable$EMP_NO, 8, 8) == 3, 'M', 'F')

genderGroupMean <- aggregate( empTable$SALARY,
                              list(empTable$gender),
                              mean, na.rm = T)
genderGroupMean

ggplot(genderGroupMean,
       aes(x = Group.1, y = x, fill = Group.1))+
  geom_bar(stat = 'identity')

# DB 종료
dbDisconnect(conn)



# 비정형 데이터 처리 (텍스트 마이닝)
# 단어 빈도를 나타내는 시각화(wordcloud, koNLP, tm)

install.packages(c("hash", "tau", "Sejong", 
                   "RSQLite", "devtools", "bit", 
                   "rex", "lazyeval", "htmlwidgets", 
                   "crosstalk", "promises", "later", 
                   "sessioninfo", "xopen", "bit64", 
                   "blob", "DBI", "memoise", "plogr", 
                   "covr", "DT", "rcmdcheck", "rversions"), 
                 type = "binary")  

# github 버전 설치
install.packages("remotes")
# 64bit 에서만 동작합니다.
remotes::install_github('haven-jeon/KoNLP', 
                        upgrade = "never", 
                        INSTALL_opts=c("--no-multiarch"))

# 감성분석
# service_data_facebook_bigdata.txt
fbook <- file(file.choose(), encoding = 'UTF-8')
fbook_read <- readLines(fbook)
head(fbook_read)

str(fbook_read)

# 2. 전처리(정규표현식을 필요로 한다)
# 문장부호 제거 [[:punct:]] 하는 정규표현식을 활용
# 특수문자 제거 [[:cntrl:]]
# 숫자 제거 [0-9] \\d+
# \\w+, \\s+, \n, \t

# gsub() 함수를 이용해서 전처리
s <- gsub('[[:punct:]]', '', fbook_read)
s[1]
s <- gsub('[[:digit:]]', '', s)
s[1]
s <- tolower(s)
class(str_split(s,'\\s+'))
wordList <- str_split(s,'\\s+')
wordVec <- unlist(wordList)
?unlist
class(wordVec)

# 제공되는 단어사전으로부터 파일을 읽어오기
positiveDic <- file(file.choose(), encoding='UTF-8')
pDic <- readLines(positiveDic)
head(pDic)
str(pDic)

negativeDic <- file(file.choose(), encoding='UTF-8')
nDic <- readLines(negativeDic)
head(nDic)
str(nDic)

pDic <- c(pDic, '긍정의 씨앗')
str(pDic)

nDic <- c(nDic, '부정의 씨앗')
str(nDic)

# 분석을 위한 함수 정의
# 분석된 단어 vs 사전 단어에 매치가 되는지를 검사 \(^_ ^ )/
# match()

pMatch <- match(wordVec, pDic)
nMatch <- match(wordVec, nDic)

# 사전에 등록된 단어 추출을 한다면?
pMatch <- !is.na(pMatch)
nMatch <- !is.na(nMatch)

scores <- sum(pMatch) - sum(nMatch)

scoresDF <- data.frame(score = scores, text = wordVec)
head(scoresDF)
str(scoresDF)


?match
library(stringr)
library(plyr)
?laply

# 이 함수를 정의하세요
resultS <- function(words , positive , negative) {
  scores = laply(words, function(words, positive, negative) {
    pMatch = match(words, positive) 
    nMatch = match(words, negative)
    
    pMatch = !is.na(pMatch) 
    nMatch = !is.na(nMatch)
    
    score = sum(pMatch) - sum(nMatch) 
    return(score)
  }, positive, negative)
  
  scores.df = data.frame(score=scores , text=words)
  return(scores.df)
}


resultTbl <- resultS(wordVec, pDic, nDic)
head(resultTbl)

resultTbl$score
resultTbl$text
resultTbl$remark[resultTbl$score >= 1] <- '긍정'
resultTbl$remark[resultTbl$score == 0] <- '중립'
resultTbl$remark[resultTbl$score < 0] <- '부정'


pieResult <- table(resultTbl$remark)
?pie
pie(pieResult, 
    labels = names(pieResult),
    col = rainbow(3))
