# Greedy Algorithm
# 체육복
# https://programmers.co.kr/learn/courses/30/lessons/42862

# 풀이
# 여벌을 챙기고 도난도 당한 학생은 자기 것 한 개만을 가지고 있게 되기 때문에
# lost, reserve 리스트 모두에 존재하지 않아야 하므로 제거 작업을 수행한다.
# 이 후 여벌이 있는 학생 앞뒤를 체크해 도난당한 학생에게 옷을 주고
# 이 학생들을 도난당한 학생 리스트에서 제거한다.
# 최종적으로 체육복을 가지고 있는 학생의 수를 구한다.

def solution(n, lost, reserve):

    # 차집합을 이용해 여벌을 챙기고 도난도 당한 학생을 제거
    reserve_new = set(reserve)-set(lost)
    lost_new = set(lost)-set(reserve)

    # 여벌을 가진 학생 중
    for i in reserve_new:
        # 앞 번호 학생이 잃어버렸으면
        if i-1 in lost_new:
            # 여벌 체육복을 받은 학생을 도난당한 학생 리스트에서 제거
            lost_new.remove(i-1)
        # 아니라면 뒷 번호 학생이 잃어버렸는지 확인
        elif i+1 in lost_new:
            # 여벌 체육복을 받은 학생을 도난당한 학생 리스트에서 제거
            lost_new.remove(i+1)
        # 체육복을 소유한 학생 수를 반환
    return n-len(lost_new)

n = 5
lost = [2, 4]
reserve = [1, 3, 5]
print(solution(n, lost, reserve))


# 새로 알게 된 점
# for 문을 도는 리스트를 해당 반복문 안에서 조작하면 무조건 꼬인다.

# 유의사항
# for 문에서 lost 만 조작해준 이유는 for 문을 도는 리스트는 조작하지 말아야 하는데
# 정답은 전체에서 도난당한 학생수를 빼줘야 하기 때문에
# for 문을 도는 리스트를 reserve 로 주고 lost 만 조작했다.