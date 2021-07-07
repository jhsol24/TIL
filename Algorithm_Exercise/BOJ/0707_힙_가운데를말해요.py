# heaq
# 가운데를 말해요
# https://www.acmicpc.net/problem/1655

N = int(input())
arr = []
for i in range(N):
    arr.append(int(input()))

answer = []
for j in range(1, N+1):
    if j % 2 != 0:
        answer.append(sorted(arr[:j])[j//2])
    else:
        answer.append(sorted(arr[:j])[j//2 - 1])

for k in range(N):
    print(answer[k])


# 시간초과로 실패
# 힙 자료구조를 써야한다
# 다시 풀기