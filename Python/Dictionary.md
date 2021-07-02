# Dictionary
- key, value 로 구성된 자료형 구조

- 기본 형태 : {Key1:Value1, Key2:Value2, Key3:Value3, ...}





## 1. Example

사용할 예시 dictionary

```python
dic = {'player':'Stephen', 'height':191}
```





## 2. Add

```python
# dic[key] = value

dic['PPG'] = 31.9
dic['APG'] = 9.8
print(dic)
```

key-value 쌍이 추가된다.



**Result**

```python
{'player': 'Stephen', 'height': 191, 'PPG': 31.9, 'APG': 9.8}
```





## 3. Delete (del)

```python
# del dic[key]

del dic['height']
print(dic)
```

지정한 key 의 key-value 쌍이 삭제된다.



**Result**

```python
{'player': 'Stephen', 'PPG': 31.9, 'APG': 9.8}
```





## 4. Key 를 사용해 Value 얻기

```python
# dic[key]

print(dic['player'])
```

value 값을 얻기 위한 가장 기본적인 형태이다.



**Result**

```python
Stephen
```





## 5. Key 들을 List 로 반환 (keys)

```python
# dic.keys()

print(dic.keys())
```

key 를 list 로 만들어준다. key 값들만 사용할 때 유용하다.



**Result**

```python
dict_keys(['player', 'PPG', 'APG'])
```





## 6. **Value 를 List 로 반환 (values)**

```python
# dic.values()

print(dic.values())
```

value 를 list 로 만들어준다. value 값들만 사용할 때 유용하다.



**Result**

```python
dict_values(['Stephen', 31.9, 9.8])
```





## 7. Key, Value 를 List 로 반환 (items)

```python
# dic.items()

print(dic.items())
```

key-value 쌍을 list 로 만들어준다.



**Result**

```python
dict_items([('player', 'Stephen'), ('PPG', 31.9), ('APG', 9.8)])
```





## 8. 만들어진 리스트를 정렬

```python
# sorted(dic.keys())

print(sorted(dic.keys()))
```

key, value 를 리스트로 만들고 정렬도 가능하다.



**Result**

```python
['APG', 'PPG', 'player']
```

