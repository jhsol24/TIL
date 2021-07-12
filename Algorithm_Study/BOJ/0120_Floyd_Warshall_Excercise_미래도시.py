# Floyd - Warshall algorithm 예제
# 미래 도시
# 이코테 7. 최단 경로 알고리즘 플로이드 워셜 예제
# https://youtu.be/acqm9mM1P6o?t=3676

# 예제 입력
# 5 7
# 1 2
# 1 3
# 1 4
# 2 4
# 3 4
# 3 5
# 4 5
# 4 5

# 예제 출력
# 3

INF = int(1e9)  # 무한을 의미하는 값으로 10억을 설정

# 노드의 개수 및 간선의 개수를 입력받기
n, m = map(int, input().split())
# 2차원 리스트(그래프 표현)를 만들고, 무한으로 초기화
graph = [[INF] * (n + 1) for _ in range(n + 1)]

# 자기 자신으로 가는 경로는 0으로 지정
for a in range(1, n + 1):
    for b in range(1, n + 1):
        if a == b:
            graph[a][b] = 0


for _ in range(m):
    # A에서 B로 가는 비용은 1라고 설정 (양쪽)
    a, b = map(int, input().split())
    graph[a][b] = 1
    graph[b][a] = 1

print(graph)

# k를 거쳐 x로 간다.
x, k = map(int, input().split())

for k in range(1, n + 1):
    for a in range(1, n + 1):
        for b in range(1, n + 1):
            graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])

print(graph)

distance = graph[1][k] + graph[k][x]

if distance >= INF:
    print('-1')
else:
    print(distance)
