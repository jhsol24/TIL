# 점수에 따른 등급 출력 문제

score = int(input())

if 90 <= score:
    print('A')
elif 80 <= score:
    print('B')
elif 70 <= score:
    print('C')
elif 60 <= score:
    print('D')
else:
    print('F')
