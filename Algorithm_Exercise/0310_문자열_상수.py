# 단계별 풀어보기 문자열
# 상수
# https://www.acmicpc.net/problem/2908

A, B = input().split()
print(max(int(A[::-1]), int(B[::-1])))
