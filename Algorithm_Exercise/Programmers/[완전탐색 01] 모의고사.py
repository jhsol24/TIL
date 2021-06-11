# 모의고사
# 완전탐색
# https://programmers.co.kr/learn/courses/30/lessons/42840

answers = [1,2,3,4,5,5,5,1,2,3,4,1,1,2,2,1,2,3,4]
# answers = [1,2,3,4,5]
# answers = [1,3,2,4,2]

def solution(answers):
    num_ans = len(answers)

    student1 = [1,2,3,4,5] * (num_ans//5 + 1)
    student2 = [2,1,2,3,2,4,2,5] * (num_ans//8 + 1)
    student3 = [3,3,1,1,2,2,4,4,5,5] * (num_ans//10 + 1)

    cnt1, cnt2, cnt3 = 0, 0, 0

    for i in range(len(answers)):
        if answers[i] == student1[i]:
            cnt1 += 1
        if answers[i] == student2[i]:
            cnt2 += 1
        if answers[i] == student3[i]:
            cnt3 += 1

    max_ans = max(cnt1, cnt2, cnt3)
    answer = []

    if cnt1 == max_ans:
        answer.append(1)
    if cnt2 == max_ans:
        answer.append(2)
    if cnt3 == max_ans:
        answer.append(3)

    return answer

print(solution(answers))