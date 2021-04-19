info = ["java backend junior pizza 150", "python frontend senior chicken 210", "python frontend senior chicken 150", "cpp backend senior pizza 260", "java backend junior chicken 80", "python backend senior chicken 50"]
query = ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]

info_lst = []
query_lst = []
for i in range(len(info)):
    info_lst.append(info[i].split())

for j in range(len(query)):
    query_lst.append(query[j].replace('and', '').split())

result = []
for i in query_lst:
    cnt = 0
    for j in info_lst:
        for k in range(4):
            if i[k] == '-' or i[k] == j[k]:
                match = True
            else:
                match = False
                break
        if match:
            if int(j[-1]) >= int(i[-1]):
                cnt += 1
    result.append(cnt)

# print(info_lst, query_lst, sep='\n')
print(result)
