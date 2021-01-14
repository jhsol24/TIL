# n이 주어졌을 때, 1부터 n까지 합을 구하는 프로그램을 작성하시오.

# 초기값 입력
a = 0

# 입력값을 range 에 직접 입력
for i in range(int(input())+1):
    a += i

print(a)
