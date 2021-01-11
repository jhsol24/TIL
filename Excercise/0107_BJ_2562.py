# 문제
# 9개의 서로 다른 자연수가 주어질 때, 이들 중 최댓값을 찾고
# 그 최댓값이 몇 번째 수인지를 구하는 프로그램을 작성하시오.

A = []

for i in range(9):
    A.append(int(input()))

print(max(A), A.index(max(A)) + 1, sep='\n')

# 빈 list A를 만들고, input 값을 append 해서 수열을 만들고
# 최댓값과 해당 값의 index 를 줄바꿈으로 구분해 출력
