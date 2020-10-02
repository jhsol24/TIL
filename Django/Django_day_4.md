# Django day 4

## 요약

> day 3에 이어 BbsApp에서의 작업이 이루어졌다.
>
> 1. 게시판에서도 user name 노출되게 하기
> 2. 게시판에 글올리기 기능 (New Board 버튼 활성화)
> 3. 게시물 등록 구현
> 4. 게시글 작성 시 writer를 작성자 계정 id로 고정
> 5. TITLE 링크에 CONTENT 표시 (게시물 조회) 되게 하고 VIEWCNT 옵션 추가
> 6. LIST ALL 버튼 활성화
> 7. Modify, Remove 버튼 생성
> 8. Remove 버튼 활성화



### 1. 게시판에서도 user name 노출되게 하기

- `BbsApp/views.py` 에서 session에 id값 저장

  ```python
  def login(request) :
      if request.method == 'GET' :
          return redirect('login')
      elif request.method == 'POST' :
          id = request.POST['id']
          pwd = request.POST['pwd']
          
          # select * from table where id = 1 and pwd = 1;
          # -> modelName.objects.filter(id = 1, pwd = 1)
  
          # user = BbsUserRegister.objects.filter(user_id=id, user_pwd=pwd)	# filter : list 타입 return
          user = BbsUserRegister.objects.get(user_id=id, user_pwd=pwd)		# get : object 타입 return
          print('user result : ', user)	# 확인을 위해 Terminal에 user 정보를 출력
          context = {}
          if user is not None :
          # 아래 4줄 수정 및 추가
              request.session['user_name'] = user.user_name
              request.session['user_id'] = user.user_id
              context['name'] = request.session['user_name']
              context['id'] = request.session['user_id']
      return render(request, 'home.html', context)
  ```

- session 이름 변경에 따른 함수 수정

  ```python
  def loginForm(request) :
      if request.session.get('user_id') :
          context={'id' : request.session['user_id'],
                   'name' : request.session['user_name']} # dictionary 형식
          return render(request, 'home.html', context)
      return render(request, 'login.html')
  
  
  def logout(request) :
      request.session['user_name'] = {}
      request.session['user_id'] = {}
      request.session.modified = True
  
      return redirect('loginForm')
  ```



### 2. 게시판에 글올리기 기능 (New Board 버튼 활성화)

- `list.html` 에서 `newBtn` 부분 script 작성

  ```html
  <script>
  <!--jquery 사용중-->
  	$(document).ready(function() {
  		$('#newBtn').click(function() {
  			location.href = '../bbs_registerForm' ;
  			// window.alert('click')
  		})
  	})
  
  </script>
  ```

- New Board 버튼을 눌렀을 때 `'../bbs_registerForm'` 요청 발생

- 요청 처리 (View 생성)를 위해 `BbsApp/urls.py` 에서 path 설정

  ```python
  path('bbs_registerForm/', views.bbsRegisterForm, name='bbs_registerForm')	# 추가
  ```

- `BbsApp/views.py` 에서 def 등록

  ```python
  def bbsRegisterForm(request) :
      context = {'name': request.session['user_name'],
                 'id': request.session['user_id'], }		# context가 공백이면 name 출력이 안됨
      return render(request, 'bbsRegisterForm.html', context)
  ```

#### render() 와 redirect() 의 차이점

> render() 는 이전에 전달받은 데이터만으로 화면이 구성된 템플릿을 찾아가는 것
>
> redirect() 는 새로운 request 요청을 발생시켜 새로운 페이지를 불러오는 것

###  

### 3. 게시물 등록 구현

- `bbsRegisterForm.html` 코드에서 url 설정

  ```html
  <!-- .......... -->
  
  <form role="form" method="post" action="{% url 'bbs_register' %}">	<!-- url 등록 -->
  
      {% csrf_token %}
      
  <!-- .......... -->
  </form>
  ```

- 요청 처리 (View 생성)를 위해 `BbsApp/urls.py` 에서 path 설정

  ```python
  path('bbs_register/', views.bbsRegister, name='bbs_register'),
  ```

- `BbsApp/views.py` 에서 def 등록

  ```python
  def bbsRegister(request) :
      if request.method == 'GET' :
          return redirect('bbs_registerForm')
      elif request.method == 'POST' :
          title   = request.POST['title']
          content = request.POST['content']
          writer  = request.POST['writer']
  
          # insert into table values('')
          # model(attr = value, attr = value ..... )
          # -> model.save()
  
          board = Bbs(title=title, content=content, writer=writer)
          board.save()				# board라는 이름은 바뀌어도 된다.
      return redirect('bbs_list')		# render가 아니라 redirect 해줘야 한다.
  ```

  

### 4. 게시글 작성 시 writer를 작성자 계정 id로 고정

- `bbsRegisterForm.html` 코드 수정

  ```html
  {% include 'header.html' %}
  {% block content %}
  
  <!-- .......... -->
  
  
  		<div class="form-group">
  			<label for="exampleInputEmail1">Writer</label> 
  			<input type="text"
  				name="writer" class="form-control" readonly value="{{ id }}">	<!-- writer에 입력한 계정의 id가 입력되도록 설정 -->
  		</div>
  	</div>
  	
  <!-- .......... -->
  	
  {% endblock %}
  {% include 'footer.html' %}
  ```



### 5. TITLE 링크에 CONTENT 표시되게 하기 (게시물 조회)

- `list.html` 에서 "OOO" 부분에 url 등록

  ```html
  <tbody id="tbody">
  	{% for board in boards %}
  	<tr>
  		<td>{{ board.id }}</td>
  		<td><a href="{% url 'bbs_read' id=board.id %}">{{ board.title }}</a></td>
          <!-- GET 방식으로 데이터를 전달할 경우 url name 뒤에 전달될 데이터( id=board.id)를 명시해준다. -->
  		<td>{{ board.writer }}</td>
  		<td>{{ board.regdate }}</td>
  		<td><span class="badge bg-red">{{ board.viewcnt }}</span></td>
  	</tr>
      {% endfor %}
  	</tbody>
  ```

- 요청 처리 (View 생성)를 위해 `BbsApp/urls.py` 에서 path 설정

  ```python
  path('bbs_read/<int:id>', views.bbsRead, name='bbs_read'),
  # GET 방식이라서 다른 path들과 다르게 <int : id> 가 들어간다고 한다.
  ```

- `BbsApp/views.py` 에서 def 등록하고 viewcnt 옵션을 추가해준다.

  ```python
  def bbsRead(request, id) :
      print('param - ', id)
      
      # model 작업을 필요로 하게 된다.
      board = Bbs.objects.get(id = id)
      # def login 과 유사하다. 참고하면 도움이 된다.
      
      # viewcnt update
      board.viewcnt = board.viewcnt + 1
      board.save()
      print('read result board - ', board)
      
      context = {'board' : board,
                 'name': request.session['user_name'],
                 'id': request.session['user_id'],
                 }
      # name :, id : 가 없어도 실행은 되지만 user name이 표시되지 않는다. 코드 이해에 참고.
      return render(request, 'read.html', context)
  ```

- templates에 추가된 `read.html` 에서 "OOO" 변수 수정

  ```
  Title 	= {{ board.title }}
  Content = {{ board.content }}
  Writer 	= {{ board.writer }}
  ```



### 6. LIST ALL 버튼 활성화 (게시판 목록으로 돌아가기)

- `read.html` 에서 script 부분 수정

  ```html
  <script>
  $(document).ready(function(){
  	$('#listBtn').click(function() {
  		location.href='../bbs_list'		// #listBtn id 속성을 가진 버튼 클릭시 url 요청 발생
  	})
  });
  </script>
  ```

  

### 7. Modify, Remove 버튼 생성

- `read.html` 에서 버튼을 생성하고 자신의 계정에서만 Modify, Remove 권한 가지는 코드 입력

  ```html
  <div class="box-footer">
  	{% if id == board.writer %}
  	<button type="submit" class="btn btn-warning">Modify</button>
  	<button type="submit" class="btn btn-danger">Remove</button>
  	{% endif %}
  	<button id="listBtn" type="submit" class="btn btn-primary">LIST ALL</button>
  </div>
  ```

- script 수정

  ```html
  <script>
  				
  $(document).ready(function(){
  	$('#listBtn').click(function() {
  		location.href='../bbs_list' ;
  	})
  
  	// listBtn id 속성을 가진 버튼 클릭시 url 요청 발생
  	// 추가
      // .btn-danger class 속성이 있는 버튼을 클릭하면
      // #removeFrm id 속성이 있는 태그에
      // action 속성을 부여하고
      // summit을 실행한다. -> action 속성에 있는 url 요청이 발생된다
  
  	$('.btn-danger').click(function() {
  	   $('#removeFrm').attr('action', '../bbs_remove/');
  	   $('#removeFrm').submit();
  	})
  });
  
  </script>
  ```

  

### 8. Remove 버튼 활성화

- `read.html` 에서 script 수정

  ```html
  <script>
  				
  $(document).ready(function(){
  	$('#listBtn').click(function() {
  		location.href='../bbs_list' ;
  	})
  
      // 추가
  	// listBtn id 속성을 가진 버튼 클릭시 url 요청 발생
      // .btn-danger class 속성이 있는 버튼을 클릭하면
      // #removeFrm id 속성이 있는 태그에
      // action 속성을 부여하고
      // summit을 실행한다. -> action 속성에 있는 url 요청이 발생된다
  
  	$('.btn-danger').click(function() {
  	   $('#removeFrm').attr('action', '../bbs_remove/');
  	   $('#removeFrm').submit();
  	})
  });
  
  </script>
  ```

- 요청 처리 (View 생성)를 위해 `BbsApp/urls.py` 에서 path 설정

  ```python
  path('bbs_remove/', views.bbsRemove, name='bbs_remove'),
  ```

- `BbsApp/views.py` 에서 def 등록

  ```python
  def bbsRemove(request) :
      id = request.POST['id']
      # delete * from table where id = id
      # -> modelName.objects.get(id = id).delete()
      board = Bbs.objects.get(id = id)
      board.delete()
      # render를 쓰는 것이 아니라 redirect!
      return redirect('bbs_list')
  ```



### 참고

1. html 에서의 이해
2. view에서 어떤 작업을 해주는지
3. ORM 과정 이해