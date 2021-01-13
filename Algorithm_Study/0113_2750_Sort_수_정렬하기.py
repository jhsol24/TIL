n = int(input())

array = []
for i in range(n):
    array.append(int(input()))

array.sort()
for i in range(n):
    print(array[i], end='\n')
