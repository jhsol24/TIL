# 정렬 02
# 가장 큰 수
# https://programmers.co.kr/learn/courses/30/lessons/42746

def solution(numbers):
    answer = ""
    numbers_new = list(map(str, numbers))
    numbers_new.sort(key=lambda x: x*3, reverse=True)
    answer = str(int("".join(numbers_new)))
    return answer

numbers = [3, 30, 34, 5, 9]
print(solution(numbers))

# join 정리하기
# 원리 다시 한번 이해하기