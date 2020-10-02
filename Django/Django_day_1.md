# Django day 1
## 요약

> MVT 패턴에 대해 배우고 간단한 웹사이트 (`localhost:8000/hello/index`) 를 만들어봤다.
>
> MTV 패턴에 대한 설명 링크 (강사님 사용) : https://butter-shower.tistory.com/49

> Django administration (`localhost:8000/admin`) 에서 `id`, `pwd`, `name` 을 입력하고 만든 웹사이트에서 login 을 하여 원하는 페이지 결과가 나오는 실습을 했다.

> MVT 구조에서 보면
> 1. Web client 에서 Url conf로 Request, View (App 이라고도 불렀다.)에 출력 후 다시 Web client로 Response
> 2. Web client > Url conf > View > Template (html 로 표현된다) > Response to Web client
> 3. Web client > Url conf > View > Model (.momels 사용) > Template > Response to Web client

### 1. Web client > View > Web client

#### 사전 작업

- `settings.py` 에서

  ```python
  ALLOWED_HOSTS = ['127.0.0.1', 'localhost'] # 로 변경. 초기 주소 설정
  TIME_ZONE = 'Asia/Seoul' # 로 변경.
  # DATABASES 의 default 인 sqlite3 은 추후에 변경
  ```

- `djnagoWEB\urls.py` 에서 `path` 변경 및 `include` 함수 추가
- `helloApp\urls.py` 에 `djnagoWEB\urls.py` 의 내용 붙여넣기 후 내용 수정 (자세히 기억 안남)
- `helloApp` 폴더에 `views.py` 생성 후 `def ~ (request)` `return` 을 통해 함수 적용 (Request 부분으로 보임)

#### 적용

- PyCharm 의 Terminal 창에서 다음과 같이 실행한다.

```python
django-admin startproject webserver # 프로젝트의 시작(?)
# dir/w 를 이용해 현재 상태 확인 가능
cd webserver # webserver 폴더 진입
python manage.py start app greetingApp # greetingApp 폴더에서 작업 시작(?)
python manage.py runserver # 이제 웹에 주소를 입력하면 내용 표시가 가능하다. (Response 역할)

```

- Web에서 ` localhost:8000/greeting/index` 접속하면 `views.py` 에 적용한 내용이 출력된다.



### 2. Template, Model 까지 적용시킨 과정

#### 사전 작업

- 기본적으로 이전 작업한 파일에 추가적인 코드를 입력한다.

- `models.py` 파일을 추가한다.

  ```python
  from django.db import models
  
  # Create your models here.
  
  class TestUser(models.Model) :
      user_id   = models.CharField(max_length=50)
      user_pwd  = models.CharField(max_length=50)
      user_name = models.CharField(max_length=50)
  ```

- `admin.py` 파일을 추가한다.

  ```python
  from django.contrib import admin
  from .models import *
  
  # Register your models here.
  
  admin.site.register(TestUser)
  ```

- `index.html` , `success.html` 파일을 추가한다.

  - `index.html` 에는 `method` , `action` , `{% csrf_token %}` , `label` (`id` , `pwd` 를 적용시키는 창을 생성하는 역할) 을 입력한다.
  - `success.html` 에는 login에 성공했을 시 나오는 `localhost:8000/hello/login` 페이지에 나올 결과를 입력한다.

- Django administration 에서 TestUser 생성
  
  - `localhost:8000/admin` 페이지에 접속해 helloApp에 Test user를 Add 한다.

#### 적용

- admin 페이지에서 만든 Test user의 ` id ` , `pwd` 를 입력한다.
-  `localhost:8000/hello/login` 페이지에 `success.html` 에서 적용시킨 결과값이 출력된다.

