# Git

- Source Code Management (SCM): 코드 관리 도구 (버전을 통해 관리)

- Version Control System (VCS): 버전 컨트롤 시스템



## 주요사항

### (1) `git` 폴더를 기준으로 프로젝트(코드)를 관리한다.



### (2) `git init`

- 현재 폴더에서 코드 관리를 시작(init)한다.
- `.git` 폴더 생성 == git으로 폴더가 관리되고 있다.
- `.git` 폴더 삭제 == git으로 폴더 관리를 중지한다. 



### (3) `git status` (**)

- 현재 상태(status) 출력한다.

```
On branch master (master 브랜치에 있음)

No commits yet (아직 commit 없음)

nothing to commit (create/copy files and use "git add" to track)
(commit 할 게 없음)
```



- 새로운 파일이 생성된 경우,

```
No commits yet (아직 commit 없음)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        a.txt

nothing added to commit but untracked files present (use "git add" to track)

```



### (3) `git add [파일명]`

- 버전을 만들(commit 할, 스냅샷을 찍을) 파일을 추가한다.

- git add 이후 git status

```
No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   a.txt
```



### (4) `git commit -m "메시지"`

- 버전을 만든다.(commit, snapshot)
- message를 필수적으로 입력한다.



### (5) `git log`

- 현재까지의 버전(스냅샷)들의 목록을 출력한다.

----



## 반복작업

### (1) 기존 파일에 내용 추가

- a.txt 파일에 hello 라는 내용추가

- git status 확인

```
On branch master
Changes not staged for commit: (commit 하기 위해 변화들이 stage에 추가되지 않았다)
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   a.txt
```



##### Quiz

>  Popup quiz: git이 설치된 컴퓨터가 있다고 하자. 여기에서 파일들을 git으로 관리하기 위해서는 반드시 인터넷 연결이 필요하다.



### (2) 파일 이름을 수정하거나, 삭제했을 때,

- `git add -u` : `git add` 없어진 파일이나 이름이 바뀐 파일을 인식하지 못하기 때문에, 수정(update)된 파일들을 추가하고 싶을 경우  사용한다.
- `git add .` : 현재 폴더 내부의 모든 변화를 stage에 추가한다.





## 원격저장소

### (1) `git remote add [저장소의이름] [저장소의URL]`

- 저장소의 이름: `origin`
- git remote add origin https://github.com/jhsol24/TIL.git



### (2) `git remote -v`

- 원격 저장소 정보 출력한다.



### (3) `git push origin master`

- origin이라는 저장소에 master 브랜치를 업로드한다.



### (4) `git remote remove [저장소이름]`

- 저장소 정보를 삭제한다.



## 실습2 - http://bit.do/01_TIL

>  `01_TIL.md` 파일을 작성 후, add, commit, & push를 통해 github에 올리기



##### quiz

>  git remote add는 처음 업로드할때만 사용하면 된다. (O)



> commit 한 후에는 다음 commit을 하기 전에 반드시 push 해야 한다. (X)