# Interval Sum
# 수열
# https://www.acmicpc.net/problem/2559

n, k = map(int, input().split())
temp = list(map(int, input().split()))
# 첫 k개의 합을 a로 설정
a = sum(temp[:k])
# 비교할 변수 설정
answer = a
# k개의 합에서 처음 값을 빼고 뒤에 값 하나를 더 더하며 비교
for i in range(k, n):
    a += temp[i] - temp[i-k]
    # 최댓값을 답으로 설정
    answer = max(answer, a)
print(answer)