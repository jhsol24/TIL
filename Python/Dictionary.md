# Dictionary
- key, value 로 구성된 자료형 구조

- 기본 형태 : {Key1:Value1, Key2:Value2, Key3:Value3, ...}



##### Example

dic = {'player':'Stephen', 'height':191}



### Add
dic['PPG'] = 31.9
dic['APG'] = 9.8
print("Add 'PPG','APG' :", dic)



### Delete
del dic['height']
print("Delete 'height' :", dic)



### Get Value using Key
print("Value of Key 'player' :", dic['player'])



### Key list (keys)
list_of_keys = dic.keys()
print("List of keys :", list_of_keys)



### Value list (values)
list_of_values = dic.values()
print("List of values :", list_of_values)



### Key, Value list (items)
print("dic.items() :", dic.items())



### Sort by key

sort_dic = sorted(dic.keys())
print("Sorted by key :", sort_dic)