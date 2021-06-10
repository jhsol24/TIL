# 단계별 풀어보기 정수론 및 조합론
# 이항계수 1
# https://www.acmicpc.net/problem/11050

a_, b_ = map(int, input().split())

up = 1; down = 1
for i in range(b_):
    up *= a_ - i
for i in range(b_):
    down *= b_ - i

print(up//down)