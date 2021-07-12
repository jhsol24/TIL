# Dynamic Programming
# https://www.acmicpc.net/problem/9095
# 정수 n이 주어졌을 때,
# n을 1, 2, 3의 합으로 나타내는 방법의 수를 구하는 프로그램을 작성하시오.

# using bottom up dynamic programming

# 0으로 이루어진 리스트를 생성
n = 10
d = [0] * (n+1)

# 1, 2, 3 일 때의 초기값 설정
d[1] = 1
d[2] = 2
d[3] = 4

# 모든 경우에 대해 점화식을 적용해 리스트를 완성
for i in range(4, n+1):
    d[i] = d[i - 1] + d[i - 2] + d[i - 3]

# input 값에 맞는 해당 원소를 출력
for i in range(int(input())):
    print(d[int(input())])
