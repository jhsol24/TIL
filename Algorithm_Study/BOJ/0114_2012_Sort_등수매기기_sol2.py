# 계수 정렬을 사용해 해결

# 학생 수 N을 입력받는다.
N = int(input())

# 예상 등수를 입력받는다.
expected_rank = []
for i in range(N):
    expected_rank.append(int(input()))

# 예제 입력 시 : expected_rank = [1, 1, 2, 3, 5]

# 모든 범위를 포함하는 리스트 선언 (모든 값은 0으로 초기화)
# 예상 등수로 고른 모든 숫자들의 갯수를 세기 위해
count = [0] * max(expected_rank)

# 예제 입력 시 : count = [0, 0, 0, 0, 0]

# n번째 인덱스에 숫자 n의 갯수를 표시
for i in range(len(expected_rank)):
    count[expected_rank[i] - 1] += 1    # 1부터 세기 위해 -1을 해줌

# 예제 입력 시 : count = [2, 1, 1, 0, 1]

# count 에 표시된 해당 숫자의 갯수만큼 A에 append 해준다.
A = []
for i in range(len(count)):
    for j in range(count[i]):
        A.append(int(i + 1))

# 예제 입력 시 : A = [1, 1, 2, 3, 5]
# 이렇게 하면 expected_rank 를 계수 정렬을 사용해 오름차순 정렬된다.

# 예상 등수에서 index 번호 + 1을 뺀 값의 절대값을 모두 더한다.
B = 0
for i in range(N):
    B += abs(A[i] - i - 1)

print(B)
