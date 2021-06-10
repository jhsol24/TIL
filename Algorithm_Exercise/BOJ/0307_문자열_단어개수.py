# 단계별 풀어보기 문자열
# 단어의 개수
# https://www.acmicpc.net/problem/1152

# Solution 1

# Word = input()
# if Word[0] == ' ' and Word[-1] == ' ':
#     print(Word.count(' ') - 1)
# elif Word[0] == ' ' or Word[-1] == ' ':
#     print(Word.count(' '))
# else:
#     print(Word.count(' ') + 1)

# Solution 2

_str = input().split()
print(len(_str))
