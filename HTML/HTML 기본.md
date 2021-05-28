# HTML 기본

## 1. HTML 문법

### 1-1. Tag

HTML 의 가장 기본 형태이다. '요소'라고도 할 수 있다.

```html
<h1>This is h1 tag</h1>
<p>This is p tag</p>
```



### 1-2. 속성(Attributes)과 값(Value)

태그의 기능을 확장하기 위해 '속성'을 사용한다.

```html
<img src="./image_file.jpg" alt="my profile photo"/>
<div class="name">James</div>
```

alt 는 대체 텍스트를 의미한다.



### 1-3. 부모와 자식 요소

하위 요소를 자식요소, 반대는 부모 요소라고 보면 된다.

```html
<!-- 형식 -->
<PARENT>
	<CHILD></CHILD>
</PARENT>

<section class="player">
    <h1>player list</h1>
    <ul>
        <li>James Harden</li>
        <li>Sthephen Curry</li>
        <li>Lebron James</li>
    </ul>
</section>
```



## 2. HTML 문서의 범위

