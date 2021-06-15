# 완주하지 못한 선수
# 해시
# https://programmers.co.kr/learn/courses/30/lessons/42576

# 입력 예시
participant = ["marina", "josipa", "nikola", "vinko", "filipa"]
completion = ["josipa", "filipa", "marina", "nikola"]


def solution(participant, completion):
    # 완주하지 못한 사람만 다른 index 에 존재하도록 모두 정렬
    participant.sort()
    completion.sort()

    # 정렬된 각 요소를 하나씩 가져와서
    for p, c in zip(participant, completion):
        # 값이 다르다면 (완주하지 못한 이름이 발견되면)
        if p != c:
            # 해당 참가자를 반환
            return p
    # 모두 같다면 마지막 참가자를 반환
    # 이 때 마지막 참가자는 중복된 이름이거나 완주자 목록에 없는 이름
    return participant[-1]


# print(solution(participant, completion))


# 다른 풀이 방법

# hash 사용
def solution2(participant, completion):
    # hash 값을 쌓을 tmp 값 설정
    tmp = 0

    # 해쉬 값을 key, 이름을 value 로 설정하여
    # 이름을 결과로 뽑기 위해 dictionary 설정
    dic = {}

    # tmp 에 참가자 해쉬 값을 더하고
    for p in participant:
        dic[hash(p)] = p
        tmp += hash(p)

    # 완주자 해쉬 값을 빼서 미완주자의 해쉬 값만 남기기
    for c in completion:
        dic[hash(c)] = c
        tmp -= hash(c)

    return dic[tmp]


# print(solution2(participant, completion))


# collections.Counter 사용
import collections


def solution3(participant, completion):
    # 참가자 - 완주자 = 미완주자의 {이름 : 1}
    answer = collections.Counter(participant) - collections.Counter(completion)

    # key 값을 반환하기 위해 리스트로 만든 후 리턴
    return list(answer.keys())[0]

# print(solution3(participant, completion))