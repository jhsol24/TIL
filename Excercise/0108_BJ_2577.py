A = []

for i in range(3):
    A.append(int(input()))

B = str(A[0]*A[1]*A[2])

for i in range(10):
    print(B.count(str(i)))
