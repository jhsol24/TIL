# Disjoint Set
# 여행 가자
# https://www.acmicpc.net/problem/1976

# Solution 2
# 함수 설정시 parent 변수 제거 (고정하여 사용하므로)
# union_parent 함수에서 parent[a] = b로 간소화
# parent, connected, answer 입력을 append 사용 없이 간소화
# 이 후 이중 for 문에서 한번에 union_parent 함수 처리
# 정답 출력 방식을 부모 노드가 한 개일 때 YES, 아닐 때 NO 출력으로 간소화

def find_parent(x):
    if parent[x] != x:
        parent[x] = find_parent(parent[x])
    return parent[x]

def union_parent(a, b):
    a = find_parent(a)
    b = find_parent(b)
    parent[a] = b

N = int(input())
M = int(input())

parent = [i for i in range(N + 1)]

connected = [list(map(int, input().split())) for _ in range(N)]
for i in range(N):
    for j in range(i, N):
        if connected[i][j] == 1:
            union_parent(i + 1, j + 1)

path = list(map(int, input().split()))
answer = [find_parent(i) for i in path]

if len(list(set(answer))) == 1: print('YES')
else: print('NO')