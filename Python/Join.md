# Join

> 리스트를 문자열로 합쳐주는 함수이다.
>
> 문자열을 다룰 때 유용하게 사용할 수 있다.



## 1. "".join

### 예제 리스트

```python
lst = ['a', 'b', 'c', 'd', '1', '2' '3']
```

### 목표

'abcd123' 이라는 문자를 구현하려고 한다.

---

### 1-1. for 이용

```python
result = ""
for i in lst:
	result += i

print(result)
```

**Result**

```python
'abcd123'
```

### 1-2. "".join 활용

```python
result = "".join(lst)
print(result)
```

**Result**

```python
'abcd123'
```



## 2. "`구분자`".join

문자열 리스트의 요소를 연결할 때 가운데에 들어갈 구분자를 설정할 수 있다.

```python
result = "_".join(lst)
print(result)
```

**Result**

```python
'a_b_c_d_1_2_3'
```

