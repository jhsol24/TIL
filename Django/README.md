# Django

> Django란 보안이 우수하고 유지보수가 편리한 웹사이트를 신속하게 개발하는 하도록 도움을 주는 파이썬 웹 프레임워크이자 웹 개발 도구이다.

> Pycharm에서 project 형식으로 진행했다.



### 프로젝트 생성

\>django-admin startproject djangoWEB



\>dir/w

\>cd djangoWEB



### App 생성

\>python manage.py startapp `App name`



### Model Migrations

> 사용자 모델 -> DB (테이블) 만드는 명령어
>
> class 가 새로 생성된 경우 실행 후 runserver 해야 한다.

\>python manage.py makemigrations

\>python manage.py migrate



### Server 실행하는 명령어

\>python manage.py runserver



### 사용자 입장에서

http://localhost:8000/`App name`/`url name`



### 개발자 admin 계정 접근

http://localhost:8000/admin



### Templates

- html (tag + text)

- {{ print }}

- {% 동적 코드를 작성하고자 할 때 %}

  {% 프레젠테이션 레이어에 로직을 심을 수 있다 %}



### views.py

- HttpResponse : 정의해준 함수 (def `function`) 가 경로를 따라 잘 출력되는지 확인 할 때 사용하면 좋다.

- render(  , templates (html)  ,  context)  -  forward

  > context에 데이터를 심으면 해당 데이터는 요청된 페이지 내에서만 사용이 가능한 scope 가지게 된다.

- redirect ( 새로운 request url 요청할 수 있게 된다. )



### html 파일에서

```html
{% include 'header.html' %}
{% block content %}

	<section></section>

{% endblock %}
{% include 'footer.html' %}
```

> 코드의 맨 위, 아래에 해당 코드를 입력해서 설정한 header, footer 형식을 적용시킨다.