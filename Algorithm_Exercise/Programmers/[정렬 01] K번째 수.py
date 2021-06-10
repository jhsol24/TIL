# Programmers Excercise
# K번째 수 (Level 1)
# https://programmers.co.kr/learn/courses/30/lessons/42748

# 입력 예시
array = [1,5,2,6,3,7,4]
commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]

# 풀이
# List 의 특징과 사용법을 알면 되는 간단한 문제이다.
def solution(array, commands):
    answer = []
    # commands 의 각 요소에 대해 반복
    for i in commands:
        # 리스트를 잘라서 정렬한 새로운 리스트 생성
        new_array = sorted(array[i[0]-1 : i[1]])
        # answer 에 찾는 값을 append
        answer.append(new_array[i[2]-1])
    return answer

print(solution(array, commands))


# 간결한 풀이
def solution2(array, commands):
    return list(map(lambda x:sorted(array[x[0]-1 : x[1]])[x[2]-1], commands))

print(solution2(array, commands))