# 단계별 풀어보기 문자열
# https://www.acmicpc.net/problem/2675

T = int(input())
lst = []
for _ in range(T):
    lst.append(list(input().split()))

answer = []
for i in lst:
    S = list(i[1])
    result = ''
    for j in S:
        result += j * int(i[0])
    answer.append(result)

for k in answer:
    print(k)