# Text mining

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_121')
library(rJava)
library(KoNLP)

install.packages(c("hash", "tau", "Sejong", 
                   "RSQLite", "devtools", "bit", 
                   "rex", "lazyeval", "htmlwidgets", 
                   "crosstalk", "promises", "later", 
                   "sessioninfo", "xopen", "bit64", 
                   "blob", "DBI", "memoise", "plogr", 
                   "covr", "DT", "rcmdcheck", "rversions"), 
                 type = "binary")  
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', 
                        upgrade = "never", 
                        INSTALL_opts=c("--no-multiarch"))
library(tm)
library(wordcloud)
library(RColorBrewer)

# 명사, 형용사 등을 추출한 사전
useSejongDic()

text <- "최근 이슈가 되고 있는 빅데이터에 대한 이해와 활용을 위해 데이터 과학(Data Science)의 측면에서 접근한다.
빅데이터는 통계학을 비롯한 경영, IT 등의 다양한 분야들이 서로 결합되어 있고 그 정의가 다양하지만, 본 강의는 데이터 분석을
기반으로 하는 과학적 의사결정의 관점에서 바라보고자 한다. 빅데이터에 대한 이해를 위해 실제 사례들을 살펴보고,
데이터를 통해 의사결정에 유용한 정보 및 지식을 찾는 과정을 이해한다. 나아가 빅데이터 분석에서 필수적으로 언급되고 있는
R 통계프로그램을 소개하고 이를 분석에 활용할 수 있게 한다."

nouns <- extractNoun(text)

# nchar() : 단어의 Length 추출
nouns <- nouns[nchar(nouns) >= 2]

# 빈도표
wFreq <- table(nouns)
wFreq

# gsub
nouns <- gsub('빅테이터.*','빅데이터', nouns)
nouns
wFreq <- table(nouns)
wFreq
names(wFreq)

?wordcloud
pal <- brewer.pal(6, 'Accent')
wordcloud(words = names(wFreq),
          freq = wFreq,
          min.freq = 1,
          random.order = F,
          colors = pal)

# 텍스트마이닝 단계
# text -> corpus(말뭉치) -> TDM -> TM 분석 -> Matrix(DF) -> wordcloud
# service_data_I_love_mom.txt

data <- readLines(file.choose(), encoding = 'UTF-8')
data

corpus <- VCorpus(VectorSource(data))
corpus

# TermDocumentMatrix : 행이 단어, 열이 문서가 되는 행렬
# TDM : 해당 단어가 어디서 나오는지 분포를 봄
TDM <- TermDocumentMatrix(corpus)
TDM

# tm_map(TDM, function)
# stripWhithespace : 여러개의 공백을 하나의 공백으로
corpus_map <- tm_map(corpus, stripWhitespace)
corpus_map[[1]]$content

corpus_map <- tm_map(corpus_map, removeNumbers)
corpus_map <- tm_map(corpus_map, removePunctuation)
corpus_map[[9]]$content

# 위에 한 여러번의 작업 한번에 하기 : list에 함수 저장 가능
# corpus_tm2 <- TermDocumentMatrix(corpus,
#                                  control = list(stripWhitespace = T,
#                                                 removeNumbers = T,
#                                                 removePunctuation = T))

# stopword 처리 방법
stopwords('english')
stopword2 <- stopwords('en')
stopword2 <- c(stopwords('en'), 'and', 'not', 'but')
data

# 불용어 삭제

DTM <- DocumentTermMatrix(corpus_map)

?tm_map
corpus_map <- tm_map(corpus, removeWords, stopword2)
# 이건 먼저 했어야?

# 빈도 체크
TDM2 <- TermDocumentMatrix(corpus_map)
corpus_freq <- as.matrix(TDM)

# 몇 자 이상 몇 자 이하
findFreqTerms(TDM, 2)

# >>>>>정리
corpus <- VCorpus(VectorSource(data))
corpus

# tm_map(corpus, function)
corpus_map <- tm_map(corpus, stripWhitespace)
corpus_map <- tm_map(corpus_map, removeNumbers) 
corpus_map <- tm_map(corpus_map, removePunctuation)
stopwords('en')
stopword2 <- stopwords('en')
stopword2 <- c(stopwords('en'), 'and', 'not', 'but')
corpus_map <- tm_map(corpus_map, removeWords, stopword2)

TDM <- TermDocumentMatrix(corpus_map)

?findFreqTerms
findFreqTerms(TDM, 2)

# 빈도표
matrix <- as.matrix(TDM)
rownames(matrix)
rowSums(matrix)

wFreq <- sort(rowSums(matrix), decreasing = T)

wordcloud(words = names(wFreq),
          freq = wFreq,
          min.freq = 1,
          random.order = F,
          colors = pal)

# --- 실습 ---
# --- service_data_president_text_mining.txt
speech <- readLines(file.choose())
speech_nouns <- extractNoun(speech)

corpus_speech <- VCorpus(VectorSource(speech_nouns))
corpus_speech

corpus_speech_map <- tm_map(corpus_speech, stripWhitespace)
corpus_speech_map <- tm_map(corpus_speech_map, removeNumbers)
corpus_speech_map <- tm_map(corpus_speech_map, removePunctuation)

stopword_speech <- c('대통령')
corpus_speech_map <- tm_map(corpus_speech_map, removeWords, stopword_speech)

TDM_speech <- TermDocumentMatrix(corpus_speech_map)

?findFreqTerms
findFreqTerms(TDM_speech, 2)

matrix <- as.matrix(TDM_speech)
rownames(matrix)
rowSums(matrix)

wFreq <- sort(rowSums(matrix), decreasing = T)

wordcloud(words = names(wFreq),
          freq = wFreq,
          min.freq = 1,
          random.order = F,
          colors = pal)

# 강사님 답안
useSejongDic()
speech <- readLines(file.choose())
exampleCorp <- VCorpus(VectorSource(speech))

exampleCorp <- tm_map(exampleCorp, stripWhitespace)
exampleCorp <- tm_map(exampleCorp, removeNumbers)
exampleCorp <- tm_map(exampleCorp, removePunctuation)

nounsWord <- function(doc){
  d <- as.character(doc)
  extractNoun(d)
}

TDM <- TermDocumentMatrix(exampleCorp,
                          control=list(tokenizse=nounsWord))
matrix <- as.matrix(TDM)
rownames(matrix)
rowSums(matrix)
stopword <- c('전합니','통치화','되겠습니','것입니','만들겠습니')
TDM <- TermDocumentMatrix(exampleCorp,
                          control=list(tokenize=nounsWord,
                                       wordLengths=c(2,3),
                                       stopwords=stopword))
matrix <- as.matrix(TDM)

wFreq <- sort(rowSums(matrix), decreasing = T)

pal <- brewer.pal(6, 'Accent')
wordcloud(words = names(wFreq),
          freq = wFreq,
          min.freq = 1,
          random.order = F,
          colors = pal)





# wordcloud2 로 만들기
matrix <- as.matrix(TDM)
rownames(matrix)
rowSums(matrix)
wFreq <- sort(sowSums(matrix), decreasing = T)

wDF <- data.frame(wFreq)
wDF
install.packages('wordcloud2')
library(wordcloud2)

wordcloud2(data.frame(rownames(wDF), wdF$freq1))


# 실습
# service_data_text_mining_movie
# 영화 리뷰에서 가장 많이 나온 단어를 시각화 하기
movies <- read.csv(file.choose())
str(movies)

movies$Description

movieCorp <- VCorpus(VectorSource(movies$Description))

movieCorp <- tm_map(movieCorp, stripWhitespace)
movieCorp <- tm_map(movieCorp, removeNumbers)
movieCorp <- tm_map(movieCorp, removePunctuation)
movieCorp <- tm_map(movieCorp, removeWords, stopwords('en'))
movieCorp <- tm_map(movieCorp, content_transformer(tolower))

movieTDM <- TermDocumentMatrix(movieCorp)


# wordcloud, 단어 빈도 그래프(barplot() etc..) 그려보기

?findFreqTerms
findFreqTerms(movieTDM, 2)

movie_matrix <- as.matrix(movieTDM)
rownames(movie_matrix)
rowSums(movie_matrix)

movie_wFreq <- sort(rowSums(movie_matrix), decreasing = T)

pal <- brewer.pal(6, 'Accent')
wordcloud(words = names(movie_wFreq),
          freq = movie_wFreq,
          min.freq = 1,
          random.order = F,
          colors = pal)

library(dplyr)
movieDF_head <- head(movieDF, 30)
class(movieDF_head)
movieDF_head <- arrange(movieDF_head,desc(freq))
barplot(movieDF_head,
        horiz = F,
        beside = T,
        col = rainbow(30))

library(ggplot2)
ggplot(data = movieDF_head,
       aes(x=word, y=freq, fill=word))+
  geom_bar(stat='identity'
           )+
  theme(axis.text.x = element_text(angle = 90))
       



# 강사님 답안
# TDM까진 같음

wFreq <- sort(rowSums(movie_matrix), decreasing = T)

names(movie_wFreq)

movieDF <- data.frame(word = names(wFreq), freq=wFreq)
movieDF
names(movieDF)
wordcloud(words = movieDF$word,
          freq = movieDF$freq,
          min.freq = 5,
          max.words = 200, random.order = FALSE,
          colors=brewer.pal(8,'Dark2'))

