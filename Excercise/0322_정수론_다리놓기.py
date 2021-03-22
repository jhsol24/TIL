# 단계별 풀어보기 정수론 및 조합론
# 다리 놓기
# https://www.acmicpc.net/problem/1010

def combination(a, b):
    up = 1; down = 1
    for i in range(b):
        up *= a - i
    for j in range(b):
        down *= b - j
    return up//down

answer = []
for _ in range(int(input())):
    A, B = map(int, input().split())
    answer.append(combination(B, A))

for k in answer:
    print(k)