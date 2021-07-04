# 정렬 02
# 가장 큰 수
# https://programmers.co.kr/learn/courses/30/lessons/42746

# 풀이
# 알아둬야 할 점
# 1. 문자열을 비교할 때는 맨 앞자리부터 아스키 코드 값으로 비교한다.
#    이는 해당 문제의 대소비교 시 숫자를 문자형으로 바꿔 비교하는데에 유용하다.
# 2. join 함수로 문자열을 간단히 붙일 수 있다.
#
# 숫자를 문자로 바꿔서 비교해야하는 어려운 문제였다.
# 다양한 경우를 고려해 예외 케이스를 주의해야하고, 색다른 아이디어로 코드를 간결히 해야한다.
#
# Point
# 각 원소를 아스키 코드 값을 활용해 비교하기 위해 각 원소 * 3 을 해준다.
# 각 원소가 1000 이하이므로, 한 자리수도 3자리수로 바뀌고 이러면 공백을 비교하는 경우가 생기지 않는다.

def solution(numbers):
    answer = ""
    # 입력값 리스트의 각 요소를 문자열 형태로 변경
    numbers_new = list(map(str, numbers))
    # 각 요소를 3배한 값으로 바꿔 문자열 정렬 사용
    numbers_new.sort(key=lambda x: x*3, reverse=True)
    # 0000 같은 경우를 0으로 바꾸기 위해 int, str 을 사용하고 join
    answer = str(int("".join(numbers_new)))
    return answer

numbers = [3, 30, 34, 5, 9]
print(solution(numbers))