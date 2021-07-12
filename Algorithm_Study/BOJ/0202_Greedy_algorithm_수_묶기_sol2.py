# 그리디 알고리즘
# 수 묶기
# https://www.acmicpc.net/problem/1744

# Sol2
# 코드 길이 축소
# input 값이 들어가서 append 하는 부분 수정
# 함수 부분 range 설정 부분 수정

def multi_sum(lst, answer):
    if len(lst) % 2 == 1:
        for x in range(0, len(lst) - 1, 2):
            answer += (lst[x] * lst[x + 1])
        answer += lst[-1]
    else:
        for y in range(0, len(lst), 2):
            answer += (lst[y] * lst[y + 1])
    return answer

N = int(input())
under_0 = []
over_1 = []
result = 0
for _ in range(N):
    i = int(input())
    if i <= 0:
        under_0.append(i)
    elif i == 1:
        result += 1
    else:
        over_1.append(i)

under_0.sort()
over_1.sort(reverse=True)

print(multi_sum(over_1, (multi_sum(under_0, result))))