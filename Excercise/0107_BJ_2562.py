A = []

for i in range(9):
    A.append(int(input()))

print(max(A), A.index(max(A)) + 1, sep='\n')
