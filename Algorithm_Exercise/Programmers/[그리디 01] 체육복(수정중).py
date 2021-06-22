n = 3
lost = [3]
reserve = [1]



for i in lost:
    if i in reserve:
        lost.remove(i)
        reserve.remove(i)

cnt = n - len(losㅡt)

for i in lost:
    if (i-1) in reserve:
        cnt += 1
        reserve.remove(i-1)
        continue
    if (i+1) in reserve:
        cnt += 1
        reserve.remove(i+1)

print(cnt)


# for i in lost:
#     if i in reserve:
#         lost.remove(i)
#         reserve.remove(i)
#
# for i in reserve:
#     if (i-1) in lost:
#         lost.remove(i-1)
#     elif (i+1) in lost:
#         lost.remove(i+1)
# cnt = n - len(lost)



# def solution(n, lost, reserve):
#     _reserve = [r for r in reserve if r not in lost]
#     _lost = [l for l in lost if l not in reserve]
#     for r in _reserve:
#         f = r - 1
#         b = r + 1
#         if f in _lost:
#             _lost.remove(f)
#         elif b in _lost:
#             _lost.remove(b)
#     return n - len(_lost)