# Django day 5

## 요약

> day 4에 이어 Modify 버튼을 활성화하고 게시판 List에서 제목 또는 작성자를 검색할 수 있는 기능을 구현한다.
>
> 1. Modify 버튼 활성화
> 2. Modify 화면에서 Modify 클릭 시 수정된 내용을 등록
>
> 3. Search 버튼 등록
>
> 4. Search 버튼 활성화 (Ajax 통신, Json 형식)



### 1. Modify 버튼 활성화

- `read.html` 의 script에서 Modify 버튼 활성화

  > Modify 버튼을 눌렀을 때 수정할 수 있는 화면으로 들어가짐

  ```html
  $('.btn-warning').click(function() {
  	<!-- alert('modify btn click') 활성화 시 해당 내용이 출력되는 창이 뜸 -->
  	   $('#removeFrm').attr('action', '../bbs_modifyFrm/');
  	<!-- bbs_modifyFrm 경로로 실행 -->
  	   $('#removeFrm').submit();
  	})
  ```

- `BbsApp/urls.py` 에 경로 설정 (View 생성)

  ```python
  path('bbs_modifyFrm/', views.bbsModifyFrm, name='bbs_modifyFrm'),
  ```

- `BbsApp/views.py` 에서 def 설정

  ```python
  def bbsModifyFrm(request) :
      id = request.POST['id']         # 사용자가 보낸 id 값을 받아옴
      board = Bbs.objects.get(id=id)
      context = {'board' : board,
                 'name': request.session['user_name'],
                 'id': request.session['user_id'],}
      return render(request, 'modify.html', context)
  ```



### 2. Modify 화면에서 수정된 내용을 등록

- `modify.html` 에서 script 수정

  ```html
  <script>
  	$(document).ready(function() {
  		$('.btn-primary').click(function() {
  			// alert('modify btn click')
  			$('#modifyFrm').submit()
  		})
  		$('.btn-warning').click(function() {
  	});
  </script>
  ```

- `modify.html` 에서 form 부분 id, action, csrf_token 추가, bbs_modify 실행하는 코드 작성

  ```html
  <form 	id="modifyFrm"
  		role="form" method="post" action="{% url 'bbs_modify' %}">
  	<div class="box-body">
  
  		{% csrf_token %}
  
  		<div class="form-group">
  ```

- `BbsApp/urls.py` 에 경로 설정 (View 생성)

  ```python
  path('bbs_modify/', views.bbsModify, name='bbs_modify'),
  ```

- `BbsApp/views.py` 에서 def 설정

  ```python
  def bbsModify(request) :
      id = request.POST['id']
      title = request.POST['title']
      content = request.POST['content']
  
      # board = Bbs(id=id, title=title, content=content)
      # board.save()
      # 이렇게 하니까 writer 없어지고 modify, remove 없어졌다.
      # 왜 이렇게 된건지 이해해보면 도움이 될 것
      # -> bbsRegister에서 insert 작업을 참고했다.
  
      # Bbs에서 해당 id와 일치하는 정보를 가져와서
      # 그거를 변수 board에다가 담고
      # 입력한 id title content를 다시 board.title, board.content 에다가 주고 저장시키는거지!
  
      board = Bbs.objects.get(id=id)      # 객체를 가져오는 작업
      board.title = title
      board.content = content
      board.save()
      return redirect('bbs_list')
  ```

- `modify.html` 에서 value 값들` {{ board.OOO}}` 로 수정



### 3. Search 버튼 등록

- `list.html` 의 script에 Search 버튼, 제목/작성자 선택 창 추가

  ```html
  <div class='box-body'>
  					<select id="searchType">
  						<option value="title">제목</option>
  						<option value="writer">작성자</option>
  					</select>
  					<input type="text" id="searchKeyword">
  					<button id='searchBtn'>Search Board</button>
  					<button id='newBtn'>New Board</button>
  				
  				</div>
  
  <script>
  <!-- jquery 사용중 -->
  	$(document).ready(function() {
  		$('#newBtn').click(function() {
  			location.href = '../bbs_registerForm' ;
  			// window.alert('click')
  		})
  <!-- 추가 -->
  		$('#searchBtn').click(function() {
  			$('#tbody').empty()
  	})
  
  </script>
  ```



### 4. Search 버튼 활성화 (Ajax 통신, Json 형식)

- `list.html` 의 script에 Search 동작 적용

  > 여기서 bbs_search url을 등록

  ```html
  <script>
  <!-- jquery 사용중 -->
     $(document).ready(function() {
        $('#newBtn').click(function() {
           location.href = '../bbs_registerForm' ;
           // window.alert('click')
        })
        $('#searchBtn').click(function() {
           $('#tbody').empty()
           // alert($('#searchType').val())
           // alert($('#searchKeyword').val())
           // ajax 통신 - json
           $.ajax({
              url     : "{% url 'bbs_search' %}",
              type    : "post",
              data    : {'csrfmiddlewaretoken' : '{{csrf_token}}',
                       type : $('#searchType').val(),
                       keyword : $('#searchKeyword').val(),
                       },
              dataType : "json",
              // success는 callback 옵션
              success  : function(data) {
                 var txt = "";
                    $.each(data , function(idx, obj) {
                           txt +="<tr><td>"+obj.id+"</td>" ;
                           txt +="<td><a href="../bbs_read/"+obj.id"+">"+obj.title+"</a></td>";
                        <!-- 이 부분이 content 표시되는 부분 -->
                           txt +="<td>"+obj.writer+"</td>";
                           txt +="<td>"+obj.regdate+"</td>";
                           txt +="<td><span class='badge bg-red'>"+obj.viewcnt+"</span></td></tr>" ;
                    });
                    $("#tbody").append(txt);
                 // $('#tbody').html(data.test)
              }
           })
        })
     })
  
  </script>
  ```

- `BbsApp/urls.py` 에 경로 설정 (View 생성)

  ```python
  path('bbs_search/', views.bbsSearch, name='bbs_search'),
  ```

- `BbsApp/views.py` 에서 def 설정

  ```python
  def bbsSearch(request) :
      print('----- ajax json bbsSearch')
      type = request.POST['type']
      keyword = request.POST['keyword']
      print('type : ', type, 'keyword : ', keyword)
      # model
      # select * from table where title like '공지%'
      # -> modelName.objects.filter(subject_startswith='공지')
      if type == 'title' :
          boards = Bbs.objects.filter(title__startswith=keyword)
      if type == 'writer' :
          boards = Bbs.objects.filter(writer__startswith=keyword)
  
  
      print(" ajax -- result : ", boards)
      dict = {'test' : 'json_sample'}
  
      data = []
      for board in boards :
          data.append({
              'id'        : board.id,
              'title'     : board.title,
              'writer'    : board.writer,
              'regdate'   : board.regdate,
              'viewcnt'   : board.viewcnt
          })
  
      return JsonResponse(data, safe=False)
      # return HttpResponse(json.dumps(dict), content_type='application/json')
  ```

  > print해준 것으로 Terminal에서 json 방식을 잘 받는지 체크하면서 진행

### 참고

- Ajax의 장점 : 비동기이기 때문에 reloading 없이 화면에 바뀜

- Ajax, Json의 개념이 어려우므로 코드 참고하고 구글링해서 이해하기

