# 9. 기타 알고리즘
# Two Pointer
# https://www.acmicpc.net/problem/1644

# Sol2
# 에라토스테네스의 체를 사용해 반복문 안에서 함수를 사용하는 것 대신 리스트 자체를 만들고 시작한다.
# 함수 정의로 해서 문제를 해결하니 속도는 더 빠르다. 메모리는 같다.
# 결과적으로 Sol1 보다 메모리가 덜 든다.

import math

def solution():
    N = int(input())
    # data = [소수 정렬]

    array = [True for i in range(N + 1)]

    for i in range(2, int(math.sqrt(N)) + 1):
        if array[i]:
            j = 2
            while i * j <= N:
                array[i * j] = False
                j += 1

    data = []
    for i in range(2, len(array)):
        if array[i]:
            data.append(i)

    count = 0
    interval_sum = 0
    end = 0

    # start 를 차례대로 증가시키며 반복
    for start in range(len(data)):
        # end 를 가능한 만큼 이동시키기
        while interval_sum < N and end < len(data):
            interval_sum += data[end]
            end += 1
        # 부분합이 N일 때 카운트 증가
        if interval_sum == N:
            count += 1
        interval_sum -= data[start]

    print(count)

solution()