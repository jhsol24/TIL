# 공항
# Disjoint Set
# https://www.acmicpc.net/problem/10775

# 특정 원소가 속한 집합을 찾기
def find_parent(parent, x):
    # 루트 노드를 찾을 때까지 재귀 호출
    if parent[x] != x:
        parent[x] = find_parent(parent, parent[x])
    return parent[x]


def union_parent(parent, a, b):
    a = find_parent(parent, a)
    b = find_parent(parent, b)
    parent[a] = b

# 게이트 수, 비행기 수를 입력
G = int(input())
P = int(input())
# 비행기 리스트 생성
plane = []
for _ in range(P):
    plane.append(int(input()))

print('plane : ', plane)
# 게이트(부모 노드) 리스트 생성
gate = [i for i in range(G + 1)]
cnt = 0
for i in plane:
    x = find_parent(gate, i)
    print(x)
    if x == 0:
        break
    union_parent(gate, x, x - 1)
    cnt += 1

print(cnt)
