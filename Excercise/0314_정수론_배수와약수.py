# 단계별 풀어보기 정수론 및 조합론
# 배수와 약수
# https://www.acmicpc.net/problem/5086

answer = []
while True:
    A, B = map(int, input().split())
    if A == 0 and B == 0:
        break
    elif B%A == 0:
        answer.append('factor')
    elif A%B == 0:
        answer.append('multiple')
    else:
        answer.append('neither')

for i in answer:
    print(i)