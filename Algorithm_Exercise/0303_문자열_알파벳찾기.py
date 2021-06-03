# 단계별 풀어보기 문자열
# 알파벳 찾기
# https://www.acmicpc.net/problem/10809

S = input()
# 아스키코드를 활용하기 위한 범위 설정
alphabet_idx = range(97, 123)
for i in alphabet_idx:
    print(S.find(chr(i)), end=' ')