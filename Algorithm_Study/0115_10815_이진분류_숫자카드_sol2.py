# 숫자 카드 문제
# 숫자 카드는 정수 하나가 적혀져 있는 카드이다.
# 상근이는 숫자 카드 N개를 가지고 있다.
# 정수 M개가 주어졌을 때, 이 수가 적혀있는 숫자 카드를 상근이가 가지고 있는지 아닌지를 구하는 프로그램을 작성하시오.
# https://www.acmicpc.net/problem/10815

# 존재하는지 여부를 반복문을 사용해 해결

N = int(input())
card = set(map(int, input().split()))
# set 은 되고 list 는 안된다. why?

M = int(input())
target_list = list(map(int, input().split()))

for i in target_list:
    if i in card:
        print(1, end=' ')
    else:
        print(0, end=' ')
