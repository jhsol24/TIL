# 단계별 풀어보기 재귀함수
# 피보나치 수 5
# https://www.acmicpc.net/problem/10870

# for 문 사용
# fibonacci = [0] * 21
# fibonacci[1] = 1
# for i in range(19):
#     fibonacci[i + 2] += fibonacci[i + 1] + fibonacci[i]
#
# print(fibonacci)

# 재귀함수 사용
def fibo(x):
    if x <= 1:
        return x
    return fibo(x - 1) + fibo(x - 2)

print(fibo(int(input())))