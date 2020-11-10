# 머신러닝 (Machine Learning)

ML (Machine Learning)은 일반적으로는 애플리케이션을 수정하지 않고도 데이터를 기반으로 패턴을 학습하고 결과를 예측하는 알고리즘 기법을 통칭한다. 대량의 데이터와 알고리즘을 통해 컴퓨터 그 자체를 학습시켜 작업 수행방법을 익히는 것을 의미한다. 데이터와 결과값을 주고 그 것들을 통해 컴퓨터가 자체적으로 프로그래밍을 학습하게 한다.

## 머신러닝의 분류

머신러닝은 지도학습(Supervised Learning)과 비지도학습(Un-supervised Learning), 강화학습(Reinforcement Learning)으로 나뉜다. 지도학습의 대표적인 머신러닝은 분류(Classification)과 회귀(Regression)로 나눌 수 있다.



### 1. 지도학습(Supervised Learning) 

데이터에 대한 정답을 알려주며 학습시키는 것. 대표적으로 분류와 회귀가 있다.

- **분류(Classification)** : 이진 분류, 다중 분류가 있다. 

- **회귀(Regression)** : 어떤 데이터들의 특징을 기반으로 예측하는 것

 

### 2. 비지도학습(Un-supervised Learning)

정답을 따로 알려주지 않고 비슷한 데이터들을 군집화 하는 것

정답은 label, 정답을 알기 위한 특징을 feature라고 한다.

실무에서는 지도학습에서의 적절한 feature를 찾아내기 위한 전처리 방법으로 비지도 학습을 쓰기도 한다.



### 3. 강화학습(Reinforcement Learning

강화(Reinforcement)는 시행착오(Trial and Error)를 통해 학습하는 방법 중 하나를 의미한다.

실수와 보상을 통해 학습을 하여 목표를 찾아가는 알고리즘. 기존의 신경망들이 label이 있는 데이터를 통해서 가중치와 편향을 학습하는 것과 비슷하게 보상(Reward)이라는 개념을 사용하여 가중치와 편향을 학습하는 것이다. 목적은 최적의 행동양식 또는 정책을 학습하는 것