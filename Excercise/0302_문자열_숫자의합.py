# 단계별 풀어보기 문자열
# https://www.acmicpc.net/problem/11720

N = int(input())
# 띄어쓰기가 없으면 list 함수만 써서 분리할 수 있다.
lst = list(map(int, input()))
print(sum(lst))