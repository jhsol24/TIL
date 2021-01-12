com = int(input())
net = int(input())
connects = []
for i in range(net):
    connects.append(list(map(int, input().split())))

visited = [False]*com
visited[0] = True

def dfs(v):
    c = visited.count(False)
    for connect in connects:
        if visited[connect[0]-1] is True:
            visited[connect[1]-1] = True
        elif visited[connect[1]-1] is True:
            visited[connect[0]-1] = True
    d = visited.count(False)
    if c == d :
        return 0
    dfs(v)



dfs(1)

print(visited.count(True)-1)