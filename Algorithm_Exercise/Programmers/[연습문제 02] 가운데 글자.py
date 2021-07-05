# 연습문제
# 가운데 글자 가져오기
# https://programmers.co.kr/learn/courses/30/lessons/12903

# 풀이
# 문자열의 인덱스를 잘 고려하면 쉽게 해결할 수 있는 문제

def solution(s):
    answer = ''
    if len(s) % 2 == 0:
        answer = s[(len(s)//2) - 1] + s[len(s)//2]
    else:
        answer = s[(len(s)//2)]
    return answer


s = "abcde"
print(solution(s))