# 예산
# 이진 탐색
# https://www.acmicpc.net/problem/2512

N = int(input())
request = list(map(int, input().split()))
limit = int(input())

start, end = 1, max(request)
while start <= end:
    mid = (start + end) // 2
    total = 0
    for i in request:
        if i > mid:
            total += mid
        else:
            total += i
    if total <= limit:
        start = mid + 1
        target = mid
    else:
        end = mid - 1

print(target)
