# 단계별로 풀어보기
# 한수
# https://www.acmicpc.net/problem/1065

N = int(input())
# 두 자리 수까지는 모두 한수
if N <= 99:
    cnt = N
else:
    # 세 자리 수부터 계산
    cnt = 99
    num = 100
    # 100부터 입력값까지 반복
    while num <= N:
        # 등차수열을 이룰 경우 한수 개수에 카운트
        if num//100 + num%10 == num%100//10 * 2:
            cnt += 1
        # 숫자를 하나씩 더하면서 체크
        num += 1
print(cnt)