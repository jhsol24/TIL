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

print(solution(participant, completion))
