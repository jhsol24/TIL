def solution():
    N = int(input())
    count = 0
    New = N

    while True:
        New = ((New % 10) * 10) + (((New // 10) + (New % 10)) % 10)
        count += 1
        if New == N:
            print(count)
            break

solution()