# heaq
# 가운데를 말해요
# https://www.acmicpc.net/problem/1655

# 시간초과로 실패

# N = int(input())
# arr = []
# for i in range(N):
#     arr.append(int(input()))
#
# answer = []
# for j in range(1, N+1):
#     if j % 2 != 0:
#         answer.append(sorted(arr[:j])[j//2])
#     else:
#         answer.append(sorted(arr[:j])[j//2 - 1])
#
# for k in range(N):
#     print(answer[k])


# 힙 자료구조를 써서 다시 풀이

import heapq
import sys

n = int(sys.stdin.readline())

max_heap = []
min_heap = []

for _ in range(n):
    num = int(sys.stdin.readline())

    if len(min_heap) == len(max_heap):
        heapq.heappush(min_heap, -num)
    else:
        heapq.heappush(max_heap, num)

    if max_heap and (-min_heap[0] > max_heap[0]):
        heapq.heappush(min_heap, -heapq.heappop(max_heap))
        heapq.heappush(max_heap, -heapq.heappop(min_heap))

    print(-min_heap[0])



