N = int(input())
count = 0

while N == 0:
    check = ((N // 10) + (N % 10)) % 10
    count += 1
    if check == N:
        print(count)
        break