# 문제.
# 정수 N개로 이루어진 수열 A와 정수 X가 주어진다.
# 이때, A에서 X보다 작은 수를 모두 출력하는 프로그램을 작성하시오.

N, X = map(int, input().split())
# input값을 입력하고 공백을 기준으로 split하여 int형태로 변환

A = list(map(int, input().split()))
# input값을 입력하고 공백을 기준으로 split하여 int형태로 변환하고 값들을 list형태로 반환

# map(변환 함수, 순회 가능한 data) :
# 모든 data에 변환 함수를 적용하여 다른 형태의 데이터를 반환

i = 0

while i <= N-1:

    n = A[i]

    if n < X:
        print(n, end=' ')
    i += 1

# end='' : 문장 마지막을 끝낼 문자를 지정
