# 교차 검증을 위한 데이터셋 분리 방법
# 1. sample()
# 2. K-Fold 방식
# 3. Hold-Out 방식

# 1. 단순임의 추출
# sample()
sample(1:10, replace = T)
sample(iris, 50, replace = T)

# 2. K-Fold 방식
install.packages("cvTools")
library(cvTools)

set.seed(100)
?cvFolds

fold <- cvFolds(n=6, K=3, R=1)
fold

str(fold)
fold$subsets
fold$which

fold$subsets[fold$which==1,1]
fold$subsets[fold$which==2,1]
fold$subsets[fold$which==3,1]




set.seed(200)
irisFold <- cvFolds(n=nrow(iris), K=3, R=1)
irisFold$subsets[irisFold$which==1,1]
irisFold$subsets[irisFold$which==2,1]
irisFold$subsets[irisFold$which==3,1]

# classification - naiveBayes 알고리즘
# 목표변수가 범주형

acc <- numeric()
cnt <- 1
r <- 1
k <- 1:3
k[-1]



install.packages('e1071')
library(e1071)

for(i in k) {
  idx <- irisFold$subsets[irisFold$which==i, r]
  cat('test : ', i, 'Cross Validation\n')
      print(iris[idx,])
      test <- iris[idx,]

  for(j in k[-1]){
    idx <- irisFold$subsets[irisFold$which==j, r]
    cat('train : ', j, 'Training Data\n')
    train <- iris[idx, ]
    cat('rows : ', nrow(train), '\n')
    model <- naiveBayes(Species ~ . , data = train)
    pred <- predict(model, test)
    t <- table(pred, test$Species)
    print(t)
    acc[cnt] <- (t[1,1] + t[2,2] + t[3,3]) / sum(t)
    cnt <- cnt + 1
  }
}


?naiveBayes
?predict
# 첫번째는 test, 나머지는 training set으로



# Hold-Out 교차검증
install.packages('caret')
library(caret)

?createDataPartition
# createDataPartition

set.seed(300)
hold_out_train <- createDataPartition(iris$Species, p=.8)
names(hold_out_train)
iris[hold_out_train$Resample1, 'Species' ]

table(iris[hold_out_train$Resample1, 'Species' ])
table(iris[-hold_out_train$Resample1, 'Species' ])

train_iris <- iris[hold_out_train$Resample1, ]
test_iris <- iris[-hold_out_train$Resample1, ]

model <- naiveBayes(Species ~ . , data = train_iris)
pred <- predict(model, test_iris)
t <- table(pred, test_iris$Species)
print(t)

acc <- (t[1,1] + t[2,2] + t[3,3]) / sum(t)

# --- 분류 실습 (Naive Bayes Classifier)
# 텍스트 분류에 많이 사용
# 문서를 여러 범주로 나누어서 판단하는 알고리즘
# 조건부 확률
# 10개의 메일 중 3개는 스팸메일이다
# 그와 상관없이 free라는 단어를 포함하는 메일이 4개다.
# 문제는 free(A)라는 메일이 와 있을때
# 그것이 스팸메일(B) 인지 아닌지를 구분해야 한다면?
# 공식 : P(B/A) = P(B) * P(A/B) / P(A)
# 1. 스팸메일일 확률 : 3/10
# 2. FREE를 포함하는 메일의 확률 : 4/10
# 3. 스팸메일 중에 포함된 FREE포함 메일 : 2/3
P(SPAM/FREE) = P(SPAM) * P(FREE/SPAM) / P(FREE)

iris

install.packages('klaR')
library(klaR)

train <- sample(nrow(iris), 100)
naive_model <- NaiveBayes(Species ~ . , data = iris, subset = train)

pred <- predict(naive_model, iris[-train, ])
names(pred)

tt <- table(iris$Species[-train],
            predict(naive_model, iris[-train, ])$class)

sum(tt[row(tt) == col(tt)])/sum(tt)
1 - sum(tt[row(tt) == col(tt)])/sum(tt)

library(ggplot2)
test <- iris[-train, ]
test$pred <- predict(naive_model, iris[-train, ])$class

ggplot(test,
       aes(Species, pred, col = Species))+
  geom_jitter(width = 0.2, height = 0.1, size = 2)+
  labs(x = 'Species',
       y = 'Predict')

# 분류는 예측과 달리 시각화 시킬 수 있음







install.packages('rvest')
library(rvest)

url <- 'https://dhlottery.co.kr/store.do?method=topStoreRank&rank=1&pageGubun=L645'
link <- read_html(url)

link %>%
  html_nodes('body') %>%
  html_nodes('.containerWrap') %>%
  html_nodes('.contentSection') %>%
  html_nodes('#article')

link %>%
  html_nodes('td') %>%
  html_text()

lotto15 <- link %>%
           html_nodes('tbody tr td') %>%
           html_text()

library(stringr)
lotto15 <- str_replace_all(lotto15, '\t|\n|\r' , '')
lotto15 <- str_replace_all(lotto15, '[[:space:]]' , '')

storeName <- NULL
cnt       <- NULL
address   <- NULL

for(idx in 1:length(lotto15)){
  if(idx %% 5 == 2) {
    storeName <- c(storeName, lotto15[idx])
  }else if(idx %% 5 == 3) {
    cnt <- c(cnt, lotto15[idx])
  }else if (idx %% 5 == 4) {
    address <- c(address, lotto15[idx])
  }
}

lottoDF <- data.frame(storeName, cnt, address)

last <- link %>%
  html_nodes('.paginate_common') %>%
  html_nodes('a') %>%
  html_attr('onclick') %>% tail(1)


end <- regmatches(last, gregexpr('[0-9]', last))
end <- as.numeric(end[[1]])
end <- as.numeric(paste(end[1], end[2], end[3], sep=''))
end


install.packages('RSelenium')
library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = 'localhost',
                      port = 4445L,
                      browserName = 'chrome')

# cmd 입력 (txt 파일 참조)

remDr$open()
remDr$navigate('https://dhlottery.co.kr/store.do?method=topStoreRank&rank=1&pageGubun=L645')

# 여기서 Chrome 창과 URL이 열림
# -----------------------------



lottoStore = c()
for(idx in 1:end) {
  front  <- 'selfSubmit('
  back   <- ')'
  script <- paste(front, idx, back, sep='')

pagemove <- remDr$executeScript(script, args=1:2)

source  <- remDr$getPageSource()[[1]] # 소스 받아오는 code
js_html <- read_html(source)

js_link <- html_nodes(js_html, 'tbody')
stores  <- js_link %>%
           html_nodes('tr') %>%
           html_nodes('td') %>%
           html_text()

lottoStore = c(lottoStore, stores)
}

# -----------------------------------------

# 불필요한 문자 및 공백 제거

lottoStore <- str_replace_all(lottoStore, '\t|\n|\r' , '')
lottoStore <- str_replace_all(lottoStore, '[[:space:]]' , '')

storeName <- NULL
cnt       <- NULL
address   <- NULL

for(idx in 1:length(lottoStore)){
  if(idx %% 5 == 2) {
    storeName <- c(storeName, lottoStore[idx])
  }else if(idx %% 5 == 3) {
    cnt <- c(cnt, lottoStore[idx])
  }else if (idx %% 5 == 4) {
    address <- c(address, lottoStore[idx])
  }
}

lottoDF <- data.frame(storeName, cnt, address)
lottoDF
write.csv(lottoDF, 'lotto_store_update.csv', row.names=F)
