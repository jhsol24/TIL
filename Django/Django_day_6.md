## 요약

> csv 파일을 Home 페이지에서 업로드하는 작업
>
> Chart 만들어서 시각화하기

.csv -> model
django - 파일 업로드(.csv)
django - visualization(시각화) - script(json)
numpy - pandas
script - jquery, d3, google chart, highchart
현업에서는 ajax
비정형데이터 - dataframe(pandas) - (.csv) - model(class)
엑셀 -> python code DB 연동 로직

1교시
엑셀파일생성, models class 생성, path 생성, def 설정

2교시
admin 추가, migration, for list
새로고침했을때 데이터 추가, print가 계속 일어나는 것을 피하려면
render가 아니라 redirect 써야함

3교시
파이널에선 웹페이지에서 시각화 하기!
csv파일 업로드하는 코드 home.html에 작성
attachCsv path , csvUpload def

if not 추가해서 csv가 아닌 파일 형식을 넣었을 때
render에서는 불완전한 페이지가 나오고
redirect는 index페이지가 제대로 나오면서
redirect를 써야하는 것을 확인

fileupload 처리하는 방법

4교시
ChartApp 만들기

~교시
line, bar wordcloud 차트 만들고 context 사용한 방법으로도 해보기
wordcloud 복붙하고 text {{ }}에서 "{{ }}" 으로 해줘야함!

highcharts.com > demo 에서 필요한 chart code 가져다쓰기

