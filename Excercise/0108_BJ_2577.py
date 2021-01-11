# 문제
# 세 개의 자연수 A, B, C가 주어질 때 A×B×C를 계산한 결과에
# 0부터 9까지 각각의 숫자가 몇 번씩 쓰였는지를 구하는 프로그램을 작성하시오.

A = []

for i in range(3):
    A.append(int(input()))

B = str(A[0]*A[1]*A[2])

for i in range(10):
    print(B.count(str(i)))

# input 값으로 list A를 만들고
# 세 수를 곱한 값을 str 으로 만든 후
# 0~10 을 str 로 변환해 B에 몇개가 들어갔는지 count 한다.
