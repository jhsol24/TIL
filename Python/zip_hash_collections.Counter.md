# zip, hash, collections.counter



## 1. zip()

> 동일한 개수로 이루어진 자료형을 묶어 주는 함수



### 1-1. 예시

>  두 리스트의 각 요소가 매칭되어 tuple 형태로 반환된다.

```python
num = [1, 2, 3, 4]
name = ['rose', 'leonard', 'wade', 'jackson']

num_name = list(zip(num, name))

print(num_name)
```

**Result**

```python
[(1, 'rose'), (2, 'leonard'), (3, 'wade'), (4, 'jackson')]
```



### 1-2. for 문을 활용해 dictionary 구조로 표현

> zip 으로 묶은 tuple 형태의 리스트에서 2개씩 꺼내어 dictionary 형태로 반환할 수 있다.

```python
dic = {}
for num, name in zip(num, name):
    dic[num] = name

print(dic)
```

**Result**

```python
{1: 'rose', 2: 'leonard', 3: 'wade', 4: 'jackson'}
```



### 1-3. 개수가 다른 경우

>  두 리스트의 개수가 다른 경우, 개수가 적은 리스트에 맞춰 결과를 반환한다.

```python
A = ['a','b','b','c']
B = ['a','b','c']
zip_ex = list(zip(A, B))

print(zip_ex)
```

**Result**

```python
[('a', 'a'), ('b', 'b'), ('b', 'c')]
```

---



## 2. hash()
> - dict 값들을 빠르게 비교하기 위해 정수형 숫자를 반환한다.
> - 숫자들은 자료형이 다르더라도 같은 hash 값을 가진다 (ex. int - 1 / float - 1.0 같은 hash 값을 가짐)
> - hash 는 마치 자료들의 주소 값처럼 실행될 때마다 각 값에 대한 고유한 숫자 값을 반환한다.
>   단, 숫자의 hash 값은 숫자 그 자체 값이다.



### 2-1. 예시

```python
print(hash(name))
```

**Result**

```python
3397533150852559485 	# (실행 할 때마다 결과가 바뀐다.)
```

---



## 3. collections.Counter()

> Counter 는 dict 와 같이 hash 형 자료들의 값의 개수를 셀 때 사용한다.
> Dictionary 처럼 {'자료 이름' : '개수'} 형식으로 만들어진다



### 특징

> - 객체끼리의 뺄셈도 가능하다. (set 의 차집합처럼)
> - 찾고자 하는 값이 없을 경우에도 Counter 로 세어주면 에러가 아니라 0을 반환한다.

### 3-1. 예시
```python
import collections

array1 = ['a', 'b', 'c', 'c', 'c', 'd', 'd', 'e']
array2 = ['a', 'b', 'c', 'c', 'd', 'd', 'e']
```



1. 첫번째 리스트의 각 요소의 개수

```python
print(collections.Counter(array1))
```

**Result**

```python
Counter({'c': 3, 'd': 2, 'a': 1, 'b': 1, 'e': 1})
```



2. 두번째 리스트의 각 요소의 개수

```python
print(collections.Counter(array2))
```

**Result**

```python
Counter({'c': 2, 'd': 2, 'a': 1, 'b': 1, 'e': 1})
```



3. 두 리스트의 요소들의 차집합

```python
print(collections.Counter(array1) - collections.Counter(array2))
```

**Result**

```python
Counter({'c': 1})
```