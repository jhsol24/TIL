# 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
# 예제 입력
# 5
# 1 1
# 2 3
# 3 4
# 9 8
# 5 2

# Test case 의 갯수 T가 주어진다.
T = int(input())

# T의 갯수만큼 input 을 입력받고 합을 출력한다.
for i in range(T):
    A, B = map(int, input().split())
    print(A + B)
