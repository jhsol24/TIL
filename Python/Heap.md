# 힙(heap) 자료구조

> 우선순위 큐를 위해 만들어진 자료구조이다.



- 완전 이진트리의 일종으로 우선순위 큐를 위해 만들어진 자료구조이다.
- 여러 개의 값들 중에서 최소, 최댓값을 빠르게 찾아내도록 만들어진 자료구조이다.

```python
import sys
import heapq
inupt = sys.stdin.readline

def heapsort(iterable):
    h = []
    result = []
    # 모든 원소를 차례대로 힙에 삽입
    for value in iterable:
        heapq.heappush(h, value)
    # 힙에 삽입된 모든 원소를 차례대로 꺼내어 담기
    for i in range(len(h)):
        result.append(heapq.heappop(h))

    return result

n = int(input())
arr = []

for i in range(n):
    arr.append(int(input()))

res = heapsort(arr)

for i in range(n):
    print(res[i])

```

