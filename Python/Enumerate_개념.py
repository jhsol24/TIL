# Enumerate
# 반복문 사용 시 몇 번째 반복문인지 확인이 필요한 경우 사용한다.
# 인덱스 번호와 컬렉션의 원소를 tuple 형태로 반환한다.

# 기본 형태
array = [1, 3, 7, 11, 23, 33, 45]
# for i in enumerate(array):
#     print(i)

# 문자열도 사용 가능
string = ['james', 'curry', 'harden', 'durant', 'jokic']
# for i in enumerate(string):
#     print(i)

# tuple 형태 반환을 이용한 활용
# for i, j in enumerate(array):
#     print("index : {}, value : {}".format(i, j))

# 시작 인덱스 바꾸기
for i, j in enumerate(array, start=10):
    print(i, j)

# enumerate 원리
# 내부적으로 next() 함수를 호출하고 있다고 볼 수 있다.
list_enum = list(enumerate(['A', 'B', 'C']))
print(list_enum)