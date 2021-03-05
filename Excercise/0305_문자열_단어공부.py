# 단계별 풀어보기 문자열
# 단어 공부
# https://www.acmicpc.net/problem/1157

# Dictionary 활용
# get, items 문법 익히기
Word = input().upper()
lst = {}
for i in set(Word):
    lst[i] = Word.count(i)

max(lst, key=lst.get)
result = [k for k, v in lst.items() if max(lst.values()) == v]

if len(result) != 1:
    print('?')
else:
    print(result[0])