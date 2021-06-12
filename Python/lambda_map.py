# lambda
# 익명 함수라고 부른다. def 로 정의되는 함수를 이름을 지정하지 않고 한 줄로 작성할 수 있다.

# def 사용 시
def plus_ten(x):
    return x + 10

print("plus_ten(5) :", plus_ten(5))

# lambda 사용 시
plus_ten_lambda = lambda x: x + 10
print("plus_ten_lambda(5) :", plus_ten_lambda(5))

# 한 번에 사용도 가능
print("using lambda direct :", (lambda x: x + 10)(5))


# map 활용
# map : 리스트의 각 요소에 지정한 함수를 적용시킬 때 사용
# def 사용 시
def_using_map = list(map(plus_ten, [1, 2, 3]))
print("def_using_map :", def_using_map)

# lambda 사용 시
lambda_using_map = list(map(lambda x: x + 10, [1, 2, 3]))
print("lambda_using_map :", lambda_using_map)
