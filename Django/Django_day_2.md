# Django Day 2

## 요약

> PollsApp 폴더를 만들어서 투표를 진행하고 count해서 표시되는 페이지를 만드는 작업을 했다.
>
> Model을 통해 DB를 가져오는 과정(ORM)을 실습했다.

### 프로젝트 생성 및 사전작업

- PollsApp 생성

  ```
  >python manage.py startapp PollsApp
  ```

- `djangoWeb/settings.py` 에서 app 추가

  ```python
  INSTALLED_APPS = [
      'django.contrib.admin',
      'django.contrib.auth',
      'django.contrib.contenttypes',
      'django.contrib.sessions',
      'django.contrib.messages',
      'django.contrib.staticfiles',
      'helloApp',
      'PollsApp',		# 새로운 App 추가
  ]
  ```

- `djangoWeb/urls.py` 에서 url 분석을 위한 경로 등록

  ```python
  urlpatterns = [
      path('admin/', admin.site.urls),
      path('hello/', include('helloApp.urls')),
      path('polls/', include('PollsApp.urls')),	 # 새로운 path 추가
  ]
  ```

- `PollsApp/urls.py` 파일을 생성 후 url 분석을 위한 경로 등록

  ```python
  from django.contrib import admin
  from django.urls import path, include
  
  # PollApp/views.py 에 있는 함수(view)를 참조하기 위한 import
  from PollsApp    import views
  
  
  urlpatterns = [
      path('index/', views.index, name='index'),
  ]
  ```

- `djangoWeb/views.py` 에서 함수 생성

  ```python
  from django.http import HttpResponse
  from django.shortcuts import render
  
  # Create your views here.
  
  
  def index(request) :							  # path의 url과 view의 이름이 같아야 한다.
      return HttpResponse('테스트 링크~~ 잘 되나요?')	# HttpResponse 함수로 바로 응답을 보낼 수 있다.
  ```

  > `>python manage.py runserver` 입력 후 `localhost:8000/polls/index` 페이지 접속해서 잘 실행되는지 확인

- `djangoWeb/models.py` 에서 class (MVT 구조에서 Model에 해당) 생성

  ```python
  from django.db import models
  
  # Create your models here.
  
  class Question(models.Model) :
      question_text = models.CharField(max_length=200)
      regdate       = models.DateTimeField('date published')
  
      def __str__(self) :
          return self.question_text+" , "+str(self.regdate)
  
  class Choice(models.Model) :
      question    = models.ForeignKey(Question, on_delete=models.CASCADE)
      choice_text = models.CharField(max_length=200)
      votes       = models.IntegerField(default=0)
  
      def __str__(self) :
          return str(self.question)+" , "+self.choice_text+" , "+str(self.votes)
  
  ```

- `PollsApp/admin.py` 에 위에서 생성한 모델을 등록

  ```python
  from django.contrib import admin
  
  from .models import *
  
  # Register your models here.
  admin.site.register(Question)
  admin.site.register(Choice)
  ```

- makemigration > migrate > runserver (참고 : models에 class 내용 바뀌면 이 과정 다시해야함)

  ```shell
  >python manage.py makemigration
  >python manage.py migrate
  >python manage.py runserver
  ```

- `localhost:8000/admin` 페이지에서 Question에 질문 등록 (관리자 계정으로 테이블을 관리)

- `views.py` 에서 Question 테이블의 question_txt 출력

  ```python
  from django.http import HttpResponse, HttpResponseRedirect
  from django.shortcuts import render, get_object_or_404, redirect
  from django.urls import reverse
  from .models import *				   # 모델과 통신을 하기 위한 import 설정
  
  # Create your views here.
  
  
  def index(request) :
      # return HttpResponse('테스트 링크~~ 잘 되나요?')
  
      lists = Question.objects.all()		# MTV구조에서 View가 Model과 통신하여 DB의 Question 데이터 추출
  
      context = {'lists' : lists}
      return render(request, 'polls/index.html', context)
  ```



### Template 작업

- `PollsApp/templates/polls/index.html` 생성

  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Title</title>
  </head>
  <body>
  
      {% if lists %}
      <ul>
          {% for question in lists %}
          <li><a href="../{{ question.id }}">{{ question.question_text }}</a></li>
          {% endfor %}
      </ul>
      {% else %}
          <p>There is no data.</p>
      {% endif %}
  
  </body>
  </html>
  
  // lists에 데이터가 들어있으면 받아온 lists의 데이터 개수만큼 반복을 돌아
  // Question 객체에 들어있던 question_text 변수를 출력한다.
  // Question 객체에 들어있는 데이터들은 admin 페이지에서 등록한 것이다. 
  // 질문 링크를 누르게 되면 url이 /1, /2 같은 request를 발생시킨다.
  ```

  > `http://localhost:8000/polls/index/` 페이지 실행해서 확인



### Choice 테이블 추가

- 관리자 페이지에서 질문에 대한 답변 데이터 만들기

- `index.html` 에서 `<a href="../{{ question.id }}">` 링크 로직 처리

- 링크를 누르면 해당 질문에 대한 답변 투표 페이지로 이동한다

- `PollsApp/urls.py` 에서 링크 url 분석을 위한 경로 등록

  ```python
  urlpatterns = [
      path('index/', views.index, name='index'),
      path('<int:question_id>', views.choice, name='choice'),		# path 추가
  ]
  ```

- `PollsApp/views.py` 에 import get_object_or_404 하고 def choice 추가 lists 생성

  ```python
  from django.shortcuts import render, get_object_or_404, redirect
  
  def choice(request, question_id) :		# 1대 다의 테이블 relationship
      print('param question_id', str(question_id))
      lists = get_object_or_404(Question, pk=question_id)
      print("-" * 100)
      print(lists)
      print("-" * 100)
      context = { 'clist' : lists}
      return render(request, 'polls/choice.html', context)
  ```

- `PollsApp/templates/polls/choice.html` 생성

  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Title</title>
  </head>
  <body>
      <h1>{{ clist.question_text }}</h1>
      <hr/>
      <form method="post" action="{% url 'vote' %}">
  
      <input type="hidden" name="question_id" value="{{clist.id}}" />
  
      {% csrf_token %}
      {% for choice in clist.choice_set.all %}
      <input type="radio"
             name="choice"
             value="{{choice.id}}">
      <label>{{ choice.choice_text }}</label><br/>
      {% endfor %}
      <p/>
      <input type="submit" value="VOTE">
      </form>
  </body>
  </html>
  ```



### vote, result 로직 추가

- `choice.html` 에서 `action="{% url 'vote' %}"` 로직 처리

- `PollsApp/urls.py` 에서 `/vote` 가 들어간 요청을 처리하기 위한 경로 등록

  ```python
  urlpatterns = [
      path('index/', views.index, name='index'),
      path('<int:question_id>', views.choice, name='choice'),
      path('vote/', views.vote, name='vote'),		# path 추가
  ]
  ```

- `PollsApp/views.py` 에 def vote로 view 생성

  ```python
  def vote(request) :
      choice = request.POST['choice']				   # /vote 요청을 통해 전송된 choice
      question_id = request.POST['question_id']	    # /vote 요청을 통해 전송된 question_id
  
      question = get_object_or_404(Question, pk=question_id)
      checked_choice = question.choice_set.get(pk=choice)
      checked_choice.votes += 1				   	   # 투표된 choice 객체의 votes 컬럼을 1 증가시킨다.
      checked_choice.save()
  
      context = {}
      request.session['question_id'] = question_id	# request의 session에 값을 저장하여 전달
      return redirect('result')					   # urls에 있는 result를 요청
  ```

- `PollsApp/urls.py` 에서 result 요청을 처리하기 위한 경로 등록

  ```python
  urlpatterns = [
      path('index/', views.index, name='index'),
      path('<int:question_id>', views.choice, name='choice'),
      path('vote/', views.vote, name='vote'),
      path('result/', views.result, name='result'),
  ]
  ```

- `PollsApp/views.py` 에 def result로 view 생성

  ```python
  def result(request) :
      question_id = request.session['question_id']	# session에 담겨있는 값을 꺼낸다.
      question = get_object_or_404(Question, pk=question_id)
      context = {'question' : question}
      return render(request, 'polls/result.html', context)
  ```

- `PollsApp/templates/polls/result.html` 생성 후 작성

  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Title</title>
  </head>
  <body>
      <h1>{{ question.question_text }}</h1>
      <hr/>
      
  // 로직은 choice.html 과 비슷하다. 
  // 전달받은 question 객체의 기본키를 외래키로 갖고 있는 choice 데이터를 가져와서
  // 반복을 돌아 choice_text 컬럼과 choice_votes 컬럼을 출력한다.
      
      <ul>
          {% for choice in question.choice_set.all %}
              <li>{{choice.choice_text}} - {{choice.votes}}</li>
          {% endfor %}
      </ul>
      <p/>
      <a href="{% url 'index' %}">첫 페이지로 이동</a> 		// /index 요청을 발생
  
  </body>
  </html>
  ```

- `PollsApp/views.py` 에 checked_choice 변수를 추가

  ```python
  def vote(request) :
      choice = request.POST['choice']
      question_id = request.POST['question_id']
      print('param value choice - ', str(choice))
      print('param value id - ', str(question_id))
  
      question = get_object_or_404(Question, pk=question_id)
      checked_choice = question.choice_set.get(pk=choice)		# 추가된 부분
      checked_choice.votes += 1
      checked_choice.save()
  
      context = {}
      request.session['question_id'] = question_id
      return redirect('result')
  ```

  > `localhost:8000/polls/index` 페이지에서 question 선택 > choice 선택 후 vote 버튼 > 해당 choice에 count 되는 것을 확인할 수 있다. (admin 페이지에서도 count)



### 참고

- MVT 패턴을 정확히 이해하고 코드의 흐름을 잘 파악해야 한다.
- Web으로 시각화하기 위한 과정이다.
- View는 Model과 Template을 이어주는 역할을 한다.
- setting.py > path.py > index.py > view.py > models.py, 통신 역할은 lists가 한다.







