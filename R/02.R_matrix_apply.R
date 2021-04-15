# 행렬 (matrix)
# matrix(), rbind(), cbind()

# apply(data, margin, function)

x <- c(1,2,3,4,5,6,7,8,9)
matrix(x)
mat <- matrix(x)
class(mat)

matrix(x, nrow = 3)
matrix(x, ncol = 3)
matrix(x, nrow = 3, ncol = 3, byrow = T)

matrix(0, nrow = 2, ncol = 3)
diag(0,3)
matD <- diag(0,3)
class(matD)

x <- matrix( c(1,2,3,4,5,6), 2, 3)
t(x)
x

# 데이터 접근 ([row index, column index])
x <- matrix(x, 3, 3)

row(x)
col(x)

x
x[1,1]
x[3,3]
x[1:2,2]
tmp <- x[c(1,2), 2]
class(tmp)

x[c(-3), 1:3]
tmp <- x[-3, ]
tmp
class(tmp)

anothertmp <- x[3,]
class(anothertmp)

x[-1, c(1,3)]
x[-1, c(T, F, T)] # using TRUE or FALSE
tmp <- x[-1, c(T, F, T)]

# 1,3열을 제외한 행렬을 인덱싱 해보자
x[ , c(-1, -3)]
tmp <- x[ , c(-1, -3)]
class(tmp)

x1 <- c(1, 2, 3)
x2 <- c(4, 5, 6)

tmpMatrix <- cbind(x1, x2)
tmpMatrix
class(tmpMatrix)

tmpMatrix <- rbind(1:3, c(4,5,6), 7:9, 10:12)
tmpMatrix

# matrix()함수에 dimnames 옵션을 활용하면 행이름, 열이름을
# 지정할 수 있고 이를 활용하여 인덱싱이 가능하다.

nameMatrix <- matrix(c(1,2,3,4,5,6,7,8,9),
                     nrow = 3,
                     dimnames = list(c("idx1", "idx2", "idx3"),
                                     c("feature1", "feature2", "feature3")))
nameMatrix
nameMatrix['idx3', 'feature2']
nameMatrix - 2

# apply()
# apply(data, margin, function)
# margin 1 = row, 2 = col

(x <- matrix(1:4, 2, 2))
# 열 합
colSums(x)
sumApply <- apply(x, 2, sum)
sumApply
class(sumApply)

# 행 합
rowSums(x)
iris

str(iris)

head(iris)
tail(iris)

# apply() 함수를 적용해서 컬럼의 요약정보를 확인해보세요
irissetosa <- iris[1:50, -5]
irissetosa

apply(irissetosa, 2, mean)
apply(irissetosa, 2, median)

apply(iris[, -5], 2, sum)
apply(iris[, -5], 2, mean)
apply(iris[, -5], 2, median)

summary(iris)

# 특정행 또는 열을 기준으로 정렬
(x <- matrix(runif(4), 2, 2))

# order()
order(x[,2])
x[order(x[,2]),]

order(x[,2], decreasing = T)

# 배열(Array)
# array(), dim()

m <- matrix(1:12, ncol = 4)
m
class(m)

arr <- array(1:12, dim=c(3,4,3))
arr
class(arr)

# 배열에 대한 접근
# 행렬과 유사한 방식으로 각 요소에 접근할 수 있다.
arr[1,2,1]
arr[1,2,3]

arrD <- array(1:16, dim=c(2,4,2))
arrD

arrDmean <- apply(arrD, c(1,2), mean) # 1면과 2면에 있는 값들의 평균
class(arrDmean)

iris3
apply(iris3, 1, mean)
apply(iris3, 2, mean)
apply(iris3, 3, mean)
apply(iris3, c(1,2), mean)
apply(iris3, c(1,2,3), mean)

# list
# (키, 값)형태의 데이터를 담는 연관배열이다.
# list()
# apply -> lapply() : key value 적용, sapply() : value 적용
list <- list()

exList <- list(name='curry', height = 191)
exList

exList$name
exList$height

exList <- list(name='curry', height = c(1,3,5))
exList

simpleList <- list(1:4, rep(3:5), 'dog')
simpleList # >> key가 없기 때문에 [[1]], [[2]] 나옴


# list는 list를 중첩 가능
newList <- c(list(1,2,simpleList), c(3,4))
newList

list(a = list( c(1,2,3)),
     b = list( c(1,2,3,4)))

overList <- list(a = list( c(1,2,3)),
                 b = list( c(1,2,3,4)))
overList
overList$a
overList$b
overList$a[[1]][2]
overList$b[[1]][3]

member <- list(
  name    = 'hsjeong',
  address = 'seoul',
  tel     = '010-7547-5071',
  age     = 26,
  married = F
)
member
member$name
member$address
member[1]
member[[2]]
member[2]

member <- list(
  name    = c('섭섭해', '임섭순'),
  address = c('seoul', 'gwangu'),
  age     = c('26','29'),
  gender  = c('M','W')
)

member$name
member$name[2]
member$age[2]<-28
member$age
member$id <- c('jslim', 'admin')
member$id <- NULL
member$id
member

# 서로 다른 자료구조(vecto, matrix, array)
multiList <- list(
  one    = c('one', 'two', 'three'),
  second = matrix(1:9, nrow = 3),
  third  = array(1:12, dim = c(2,3,2))
)
multiList

one
multiList$one
multiList$second[4]
multiList$third[2]
multiList$third[[3]]
multiList$third[[9]]
multiList$third[2,3,1]
multiList$third[2,1:3,2]
multiList$third[ , ,1]

x <- list(1:4)

#unlist() list -> vector
vec <- unlist(x)
vec
class(vec)

matrixList <- list(
  row1 = list(1,2,3),
  row2 = list(10,20,30),
  row3 = list(100,200,300)
)
matrixList
class(matrixList)

# do.call(func, data)
row_mat <- do.call(rbind, matrixList)
class(row_mat)

col_mat <- do.call(cbind, matrixList)
col_mat

mat_mat <- matrix(matrixList)
mat_mat

listLength <- list(1:5, list('This is My Firt time R', c(T,F,T)))
listLength
length(listLength)

listLength[[2]]
listLength[[2]][1]
length(listLength[[2]][1])

library(stringr)
str_length(listLength[[2]][1])

# list 처리 함수
# lapply() : list, key = value
# sapply() : list, value

x <- list(1:5)
y <- list(6:10)

lapply(c(x,y), FUN = sum)
sapply(c(x,y), FUN = sum)

class(x)
class(lapply(c(x,y), FUN = sum))
class(sapply(c(x,y), FUN = sum))

iris
list_iris <- lapply(iris[ , 1:4], mean)
class(lapply(iris[ , 1:4], mean))

# unlist() list -> vector transform
vec_iris <- unlist(list_iris)
class(vec_iris)

# matrix() vector -> matrix transform
mat_iris <- matrix(vec_iris, ncol = 4, byrow = T)
class(mat_iris)

# as.data.frame() matrix -> dataframe
df_iris <- as.data.frame(mat_iris)
class(df_iris)

# names() 리스트로부터 변수명을 얻어와
names(df_iris) <- names(iris[ , 1:4])

# 데이터 프레임의 각 열에 이름 부여
data.frame(do.call(cbind, lapply(iris[ , 1:4], mean)))

# data.frame
# 행렬과 비슷하다
# 다만, 다양한 변수(관측값이 숫자, 문자, 범주 등)으로 표현된다.
# 각 열에 대한 접근은 $이용하여 접근할 수 있다.
# 인덱스를 활용하는 방법도 있다.

x <- c(1,3,5,7,9)
y <- c(2,4,6,8,10)

exampleDF <- data.frame(x,y)
exampleDF
str(exampleDF)

exampleDF[-1, ]
exampleDF[ , c('x')]
class(exampleDF[ , c('x')])
exampleDF

# colnames() , rownames()
colnames(exampleDF) <- c('val01', 'val02')
exampleDF

colist <- names(exampleDF)
colist
class(colist)

# 문자열 벡터, 숫자형 벡터, 문자열 벡터
# data. frame

stuName      <- c('조동균', '한소연', '박수진', '최가은')
subject.eng  <- c(100, 100, 100, 70)
subject.math <- c(80, 75, 100, 100)
subject.kor  <- c(100, 100, 100, 100)
score.grade  <- c('A', 'B', 'A', 'C')

schDF <- data.frame(stuName, subject.eng, subject.math, subject.kor, score.grade)
schDF
str(schDF)

colnames(schDF) <- c('이름', '영어', '수학', '국어', '등급')
schDF

# 행의 갯수는?
nrow(schDF)
ncol(schDF)

# 열 추가
# 학번을 열로 추가해 보세요
학번 <- c('012571', '062154', '016743', '032421')
scondschDF <- cbind(schDF, 학번)
scondschDF
str(scondschDF)

# 더미데이터를 이용해서 행 추가
김망고 <- c('김망고', 10, 20, 30, 'F', '012345')
thirdschDF <- rbind(scondschDF, 김망고)
thirdschDF
str(thirdschDF)
class(thirdschDF)

thirdschDF$'등급'
thirdschDF$'학번'
thirdschDF$등급[3]

apply(thirdschDF, 2, mean)
class(thirdschDF)

apply(scondschDF[c(2,3,4)], 2, mean)

thirdschDF$영어 <- as.numeric(thirdschDF$영어)
thirdschDF$수학 <- as.numeric(thirdschDF$수학)
thirdschDF$국어 <- as.numeric(thirdschDF$국어)

apply(thirdschDF[c(2,3,4)], 2, mean)

# with(data, expression)
# within(data, expression)

data(iris)
iris

mean(iris$Sepal.Length)
mean(iris$Sepal.Width)

with(
  iris,
  {
    print(mean(Sepal.Length))
    print(mean(Sepal.Width))
  }
)

x <- data.frame(val = c(1,2,3,4,NA,5,NA))
x

within(x,
       {
         val <- ifelse(is.na(val), mean(val, na.rm = T), val)
       })
# na면 na제외한 값들의 mean 넣고, 아니면 val 넣어라

?rm