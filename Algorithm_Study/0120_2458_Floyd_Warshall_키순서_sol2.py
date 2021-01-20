# 최단 경로 알고리즘
# Floyd - Warshall algorithm
# 키 순서
# https://www.acmicpc.net/problem/2458

# 학생들의 키를 비교한 결과가 주어질 때,
# 자신의 키가 몇 번째인지 알 수 있는 학생들이 모두 몇 명인지 계산하여 출력하는 프로그램을 작성하시오.

# 노드의 개수 및 간선의 개수 입력받기
n, m = map(int, input().split())
# 2차원 리스트 만들고 0으로 초기화
graph = [[0] * (n + 1) for _ in range(n + 1)]

# 각 간선에 대한 정보를 입력 받아 그 값을 초기화
for _ in range(m):
    # a에서 b로 가는 비용은 1이라고 설정
    a, b = map(int, input().split())
    graph[a][b] = 1

# 점화식에 따라 플로이드 워셜 알고리즘 수행
for k in range(1, n + 1):
    for a in range(1, n + 1):
        for b in range(1, n + 1):
            # 경유해서 가는 경우 포함해서, 가는 경우는 1, 안가는 경우는 0 으로 구분
            if graph[a][k] + graph[k][b] == 2:
                graph[a][b] = 1
# 그러면 a에서 b로 가는 경우는 1, 안가는 경우는 0으로 입력된다.

print(graph)

# 연결 여부를 count 하기 위한 빈 리스트 생성
answer = [0] * (n + 1)
print(answer)
for i in range(1, n + 1):
    for j in range(1, n + 1):
        # a에서 b로 가는 경우, a와 b에 1씩 카운트
        # 가는 경우와 오는 경우를 카운트 한 것이다.
        # 가는 경우에만 1을 줬으므로 중복되지 않는다.
        if graph[i][j] == 1:
            answer[i] += 1
            answer[j] += 1

print(answer)
# 갈 수 있는 노드, 해당 노드에게 오는 노드의 개수를 더한 값이
# 자기 자신을 제외한 n - 1 값인 노드의 개수를 출력한다.
print(answer.count(n - 1))
