# Django Day 3

## 요약

> BbsApp 폴더를 만들어서 admin 페이지와 연동해 웹페이지에 계정을 만들고 로그인하여 게시판에 접속하는 작업을 했다.

### 프로젝트 생성 및 사전작업

- Bbs







0921

App생성>path추가
runserver로 확인
장고는 웹이 앱들을 관리
settings.py에 static 수정
static파일추가

migrations로 수정
templates폴더 생성 login.html 생성
{% load static %} 붙여주고 href 수정
models.py 수정
views에 def register
urls에 path 등록
join.html 생성해서 {% load static %} 붙이고 href 수정
admin에 register 등록

path의 처음 index/ 이런거는 사용자의 접근, 코드의접근은 name으로 간다.
render는 템플릿을 찾는것
redirect는 새로운 request를 보내는것이다.
join.html, login.html 수정
포스트방식은 보안토큰 {% csrf_token %} 가 들어가야한다
완료페이지 출력완료

오후
000에 이름넣어주기 작업
개발자로서 서버사이드 architecture에 대해 이해를 하고있어야한다.
id pwd 쳐서 데이터를 보낼거다.
context에 대해 자세히 알아보기
filter는 쿼리셋을 get은 모델객체를 리턴타입으로 리턴함

로그인페이지에 이름넣기
로그아웃 함수만들어서 로그아웃시 메인페이지로 이동하기
게시판만들기
url 추가하면 path, def 해줘야함
html파일에 앞뒤에
{% include 'header.html' %}
{% block content %}
{% endblock %}
{% include 'footer.html' %}
해줘야함