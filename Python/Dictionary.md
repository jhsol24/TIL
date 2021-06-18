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
dic['PPG'] = 31.9
dic['APG'] = 9.8
print(dic)
```

key 와 value 쌍이 추가된다.

**Result**

{'player': 'Stephen', 'height': 191, 'PPG': 31.9, 'APG': 9.8}



### Delete
```python
del dic['height']
print(dic)
```

지정한 key 의 key-value 쌍이 삭제된다.

**Result**

{'player': 'Stephen', 'PPG': 31.9, 'APG': 9.8}



### Get Value using Key
```python
print("Value of Key 'player' :", dic['player'])
```





### Key list (keys)
```python
list_of_keys = dic.keys()
print(list_of_keys)
```





### Value list (values)
```python
list_of_values = dic.values()
print(list_of_values)
```





### Key, Value list (items)
```python
print(dic.items())
```



### Sort by key

```python
sort_dic = sorted(dic.keys())
print("Sorted by key :", sort_dic)
```

