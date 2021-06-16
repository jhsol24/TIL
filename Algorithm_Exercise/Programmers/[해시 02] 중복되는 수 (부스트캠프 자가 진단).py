# 부스트캠프 자가 진단 문제
# 함수 구현
# https://blog.naver.com/boostcamp_official/221978031932

# 입출력 예시 1
arr = [3, 2, 4, 4, 2, 5, 2, 5, 5]
# 결과 : 2가 3회, 4가 2회, 5가 3회 나타나므로 [3, 2, 3] 반환

# 입출력 예시 2
# arr = [3, 5, 7, 9, 1]
# 결과 : 중복되는 숫자가 없으므로 [-1] 반환

import collections

def solution(arr):

    arr_lst = collections.Counter(arr).items()
    answer = []

    for i, j in arr_lst:
        if j != 1:
            answer.append(j)

    if not answer: answer.append(-1)
    return answer

print(solution(arr))