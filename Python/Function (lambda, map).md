# Function (lambda, map)
함수를 사용하는 두 가지 방법.

lambda 는 익명함수로 함수를 간결하게 일회성으로 사용할 때 사용한다.

map 은 리스트의 각 요소에 함수를 적용할 때 사용한다.



### def 사용 (기본)

```python
def plus_ten(x):
    return x + 10

print(plus_ten(5))
```

**Result**

15



## lambda

익명 함수라고 부른다. def 로 정의되는 함수를 이름을 지정하지 않고 한 줄로 작성할 수 있다.



#### 기본 예시

```python
plus_ten_lambda = lambda x: x + 10
print(plus_ten_lambda(5))
```

**Result**

15



#### 한 번에 사용할 때

```python
print((lambda x: x + 10)(5))
```

**Result**

15



## map

리스트의 각 요소에 지정한 함수를 적용시킬 때 사용한다.



#### def 사용 시

```python
def_using_map = list(map(plus_ten, [1, 2, 3]))
print(def_using_map)
```

**Result**

[11, 12, 13]



#### lambda 사용 시

```python
lambda_using_map = list(map(lambda x: x + 10, [1, 2, 3]))
print(lambda_using_map)
```

**Result**

[11, 12, 13]