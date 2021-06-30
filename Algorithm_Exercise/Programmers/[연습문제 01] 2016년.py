# 연습문제
# 2016년
# https://programmers.co.kr/learn/courses/30/lessons/12901

# 풀이
# datetime 라이브러리를 사용해 날짜의 차이를 구하고
# 초로 표현된 시간차를 날짜로 변환하여 7로 나눈 나머지를 활용해 요일을 구한다.

from datetime import datetime

def solution(a, b):
    day = datetime(2016, a, b) - datetime(2016, 1, 1)
    day_diff = day.total_seconds() // (3600 * 24)
    if day_diff % 7 == 0:
        answer = "FRI"
    elif day_diff % 7 == 1:
        answer = "SAT"
    elif day_diff % 7 == 2:
        answer = "SUN"
    elif day_diff % 7 == 3:
        answer = "MON"
    elif day_diff % 7 == 4:
        answer = "TUE"
    elif day_diff % 7 == 5:
        answer = "WED"
    else:
        answer = "THU"

print(solution(5, 24))