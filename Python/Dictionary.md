# Dictionary
- key, value 로 구성된 자료형 구조

- 기본 형태 : {Key1:Value1, Key2:Value2, Key3:Value3, ...}



### Example

사용할 예시 dictionary

```python
dic = {'player':'Stephen', 'height':191}
```



### Add
```python
# dic[key] = value

dic['PPG'] = 31.9
dic['APG'] = 9.8
print(dic)
```

key-value 쌍이 추가된다.

**Result**

{'player': 'Stephen', 'height': 191, 'PPG': 31.9, 'APG': 9.8}



### Delete
```python
# del dic[key]

del dic['height']
print(dic)
```

지정한 key 의 key-value 쌍이 삭제된다.

**Result**

{'player': 'Stephen', 'PPG': 31.9, 'APG': 9.8}



### Key 를 사용해 Value 얻기
```python
# dic[key]

print(dic['player'])
```

value 값을 얻기 위한 가장 기본적인 형태이다.

**Result**

Stephen



### Key 들을 List 로 반환
```python
# dic.keys()

print(dic.keys())
```

key 를 list 로 만들어준다. key 값들만 사용할 때 유용하다.

**Result**

dict_keys(['player', 'PPG', 'APG'])



### Value 를 List 로 반환
```python
# dic.values()

print(dic.values())
```

value 를 list 로 만들어준다. value 값들만 사용할 때 유용하다.

**Result**

dict_values(['Stephen', 31.9, 9.8])



### Key, Value 를 List 로 반환
```python
# dic.items()

print(dic.items())
```

key-value 쌍을 list 로 만들어준다.

**Result**

dict_items([('player', 'Stephen'), ('PPG', 31.9), ('APG', 9.8)])



### Key 를 기준으로 정렬된 List 의 Value 반환

```python
# sorted(dic.keys())

print(sorted(dic.keys()))
```

key 를 기준으로 정렬된 list 의 value 를 반환한다.

**Result**

['APG', 'PPG', 'player']