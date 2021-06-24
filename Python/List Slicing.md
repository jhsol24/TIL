# List
## Slicing
구간을 정해 잘라내는 과정
구간을 출력할 때는 한 요소를 출력할 때와 다르다.
헷갈리지 않게 정확한 사용법을 알아야한다.





## 1. 기본 문법

예제 List

```python
array = [0,1,2,3,4,5,6,7,8,9]
```



i번째 요소를 꺼내기

```python
print(array[i:i+1])
```





## 2. 예시

### 2-1. 리스트 내의 모든 요소

```python
print(array[:])
```

**Result**

```python
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```





### 2-2. 첫번째 요소만

```python
print(array[:1])
```

**Result**

```python
[0]
```



#### 같은 결과 다른 방법

```python
print(array[0:1])
```

**Result**

```python
[0]
```

### 2-3. 처음 두개만

```python
print(array[:2])
```

**Result**

```python
[0, 1]
```



#### 같은 결과 다른 방법

```python
print(array[0:2])
```

**Result**

```python
[0, 1]
```



### 2-4. 마지막 요소만
첫번째 요소는 0부터라고 명시하는 것이 가능하지만 마지막 요소는 불가능하다.
`[-1:-1]`라고 하면 빈 리스트가 나온다.

```python
print(array[-1:])
```

**Result**

```python
[9]
```





### 2-5. 마지막 바로 전 요소만

```python
print(array[-2:-1])
```

**Result**

```python
[8]
```

