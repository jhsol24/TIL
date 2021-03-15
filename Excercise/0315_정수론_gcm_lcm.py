# 단계별 풀어보기 정수론 및 조합론
# 최대공약수 최소공배수
# https://www.acmicpc.net/problem/2609

# Solution 1
# for 문으로 해결하는 직관적인 방법
A, B = map(int, input().split())
gcd = 0
for i in range(1, min(A, B) + 1):
    if A%i == 0 and B%i == 0:
        gcd = max(i, gcd)

for j in range(max(A, B), A * B + 1, max(A, B)):
    if j%A == 0 and j%B == 0:
        lcm = j
        break

print(gcd, lcm, sep='\n')

# Solution 2
# gcd, lcm 성질을 파악한 간단한 방법
org_num1, org_num2 = map(int, input().split())
x, y = org_num1, org_num2

while y:
    x = x % y
    x, y = y, x

print(x, org_num1 * org_num2 // x, sep='\n')