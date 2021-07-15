# REST API

## 1 .API 란?

**A**pplication **P**rogramming **I**nterface

컴퓨터의 기능을 실행시키는 방법

ex. print, document 등



## 2. REST API 란?

**RESTful API**, **RE**presentational **S**tate **T**ransfer **API**

- 내 컴퓨터가 아니라 남의 컴퓨터에서 기능을 실행시키는 방법

- 특정한 기술이 아니라 HTTP 를 효율적이고 기능적으로 뛰어나게 사용하기 위한 모범사례

- HTTP 프로토콜을 HTTP 프로토콜답게 사용하고자 하는 것을 주장

- Resource 는 URI 로, 행위는 Method 로, 결과는 응답코드로 HTTP 가 원래 가지고 있는 의미를 잘 활용하자는 권고안



## 3. Resource

- URI 를 통해 표현된다. Element 가 모여 Collection 을 구성하고 이를 Resource 의 topic 이라고 볼 수 있다.

- 이들을 정보라고 볼 수 있고, method 를 통해 가공한다.

### Method

- Create : 생성, post
- Read : 읽기, get
- Update : 수정, put, patch
- Delete : 삭제, delete



## 4. 실습

Method 를 명시함으로써 해당 기능을 실행한다.

- REST API  의 핵심

  서버쪽에서 처리한 일을 응답코드와 응답 메시지를 통해 응답한다.

1. REST API 에서 규정하고 있는 것
   - Resource 를 식별할 때는 URI 를 통해 식별한다.
   - 어떤 행위를 할 때는 HTTP 의 고유한 Method (post, get, put, ...) 를 이용한다.
2. REST API 에서 규정하고 있지 않은 것
   - 클라이언트와 서버가 통신하는 데이터타입. json 이든 xml 이든 쓰면 된다.

