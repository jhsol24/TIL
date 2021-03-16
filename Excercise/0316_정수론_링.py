# 단계별 풀어보기 정수론 및 조합론
# 링
# https://www.acmicpc.net/problem/3036

N = int(input())
ring = list(map(int, input().split()))
first = ring[0]

def gcd(x, y):
    while y:
        x = x % y
        x, y = y, x
    return x

for i in ring[1:]:
    num1 = first//gcd(first, i)
    num2 = i//gcd(first, i)
    print(str(num1) + '/' + str(num2))