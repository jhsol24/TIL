# HTTP

> HTTP (Hyper Text Transfer Protocol) 는  Web Browser 와 Web Server 가 통신할 때 사용하는 통신 규칙이다.

## 1-1. 소개

Web Browser 와 Web Server 가 HTML 로 통신하고, 이 통신 규약을 HTTP 라고 보면 된다.

서로 Request 와 Response 를 한다.

웹에서 개발자 도구(F12) or 검사 > Network > Headers 를 확인하면 Request, Response 내용을 확인할 수 있다.

![](https://www.seobility.net/en/wiki/images/thumb/d/d2/HTTP-Header.png/675px-HTTP-Header.png)



## 1-2. Request Headers

![](https://blog.kakaocdn.net/dn/qCMft/btqDxvB8rpZ/TNgZvzVPFTWJAlVC9DtTY1/img.png)

Request 방식, 내용, HTTP의 버전, IP 주소, Port 번호 등 기본적인 내용들이 들어있다.



## 1-3. Response Headers

![](https://media.vlpt.us/images/nsunny0908/post/087bb8dc-7109-4d75-bb82-e6165228f1d8/image.png)

HTTP 응답의 코드가 명시되어있다. (ex. 404 Error)

전달하는 html 의 정보가 명시되어 있다. 대표적으로 Content-type, Content-length 등이 있다.