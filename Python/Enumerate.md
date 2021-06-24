# Enumerate
반복문 사용 시 몇 번째 반복문인지 확인이 필요한 경우 사용한다.
인덱스 번호와 컬렉션의 원소를 tuple 형태로 반환한다.





## 1. 기본 형태

```python
array = [1, 3, 7, 11, 23, 33, 45]

for i in enumerate(array):
    print(i)
```



**Result**

```python
(0, 1)
(1, 3)
(2, 7)
(3, 11)
(4, 23)
(5, 33)
(6, 45)
```





## 2. enumerate 원리

내부적으로 next() 함수를 호출하고 있다고 볼 수 있다.

```python
list_enum = list(enumerate(['A', 'B', 'C']))

print(list_enum)
```



**Result**

```python
[(0, 'A'), (1, 'B'), (2, 'C')]
```





## 3. 문자열도 사용 가능

```python
string = ['james', 'curry', 'harden', 'durant', 'jokic']

for i in enumerate(string):
    print(i)
```



**Result**

```python
(0, 'james')
(1, 'curry')
(2, 'harden')
(3, 'durant')
(4, 'jokic')
```





## 4. *tuple 형태 반환을 이용한 활용*

index 와 값을 tuple 형태로 반환해 hash 형식으로 이용할 수 있다.

**enumerate 를 가장 유용하게 사용할 수 있는 기본 형태**이다.

```python
for i, j in enumerate(array):
    print("index : {}, value : {}".format(i, j))
```



**Result**

```python
index : 0, value : 1
index : 1, value : 3
index : 2, value : 7
index : 3, value : 11
index : 4, value : 23
index : 5, value : 33
index : 6, value : 45
```





## 5. 시작 인덱스 바꾸기

`start=숫자` 를 이용해 시작점을 지정할 수 있다.

```python
for i, j in enumerate(array, start=10):
    print(i, j)
```



**Result**

```python
10 1
11 3
12 7
13 11
14 23
15 33
16 45
```

