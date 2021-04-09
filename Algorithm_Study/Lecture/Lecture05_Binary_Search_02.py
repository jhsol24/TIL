# n개의 오름차순 정렬된 숫자열에서 target 값은 몇 번째 인덱스에 있는가? 반복문 사용

def binary_search(array, target, start, end):
    while start <= end:
        mid = (start + end) // 2
        # 찾은 경우 중간점 인덱스 반환
        if array[mid] == target:
            return mid
        # 중간점의 값보다 타겟값이 작은 경우 왼쪽 확인
        elif array[mid] > target:
            end = mid - 1
        # 중간점의 값보다 타겟값이 큰 경우 오른쪽 확인
        else:
            start = mid + 1
    return None

# n(원소의 갯수)과 target(찾고자 하는 값)을 입력 받기
n, target = list(map(int, input().split()))
# 전체 원소 입력 받기
array = list(map(int, input().split()))

# 이진 탐색 수행 결과 출력
result = binary_search(array, target, 0, n - 1)
if result is None:
    print('Not exist')
else:
    print(result + 1)
