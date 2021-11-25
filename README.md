# WhoMI Demo

> "나" 를 한 눈에 보여줄 수 있는 나만의 디지털 명함 만들기.
>
> 실물 명함을 스캔하여 저장하는 방식이 아닌, 나의 상황, 직종, 스타일에 맞게 나만의 명함을 꾸며보고
>
> 다른 사람들과의 공유를 통해 나를 알리고 다른 사람들을 알아가 보자.  


## 프로젝트 설명

* 실물 명함을 스캔하여 저장해두는 방식의 서비스는 몇몇 시중에 나와있고 리멤버라는 서비스가 대표적이다. 하지만 실물 명함은 어디까지나 실물 명함이고 공간적 제약과 대부분이 회사에서 발급해주는 방식이기 때문에, "나"를 대표한다기 보다는 나의 "소속"을 보여주는 수단이라고 할 수 있다.
* WhoMI에서 추구하는 "나"는 내가 보여주고 싶은 진짜 "나"이고, 개인의 직종, 직군, 관심 분야나 어필하고 싶은 방향에 따라 얼마든지 자유롭게 나를 표출할 수 있는 서비스이다.

## Frameworks & libraries & api
* [Firebase] 와 구글 제공 클라우드를 통한 회원 정보 관리 및 로그인 기능 구현
* [Realm] 을 통한 앱 내의 데이터 관리 및 CRUD
* [Alamofire] 을 통한 서버 통신과 api 구현
* [Toast] 을 이용한 앱 내 알림 구현
* [Fastlane] 을 활용한 빌드, 앱스토어 업로드 및 배포
* [Twilio programmable sms api] 를 이용한 휴대폰 sms 인증 구현 (미정)
* [Kingfisher] 을 이용한 web으로부터의 이미지 관리와 캐싱 (미정)


## 프로젝트 계획

| 업무 | 태그 | 소요시간(h) |
| :---- | :----: | :-----------: |
|   기획 및 기능, 화면 디자인   |   Design   |      15       |
|   UI 디자인, 화면 전환 구성   |   Design   |      15       |
|   Data 모델링 및 구성   |   Database   |      3       |
|   회원가입 및 로그인 방식 구현   |   Database   |      10       |
|   1차 테스트 및 보완   |   Test   |      2       |
|   명함/프로필 디자인 툴 구현   |   View   |      8       |
|   CRUD 구현 및 테스트   |   Database   |      12      |
|   2차 테스트 및 보완   |   Test   |      3       |
|   UI 보완 및 다듬기  |   Design   |      5       |
|   서버/클라우드 연결   |   Tech   |      8      |
|   명함/프로필 공유 기능 구현   |   Tech   |      5       |
|   백업, 복구 구현   |   Database   |      5       |
|   코드 정리 및 버그 확인   |   Wrap up   |      5       |
|   최종 테스트   |   Test   |      5       |
|   합계   |   All   |      101      |


## Information Architecture (IA)
<img src="https://user-images.githubusercontent.com/34597321/142169177-f92f3b2d-8f1c-4521-bde8-51866df232cd.png" width="1200px" height="500px"></img>

## 대표 기능 구현 및 확인 사항
* 회원가입과 로그인 방식 -> 개인의 SNS(페이스북, 카카오톡, apple 계정 등)을 이용한 간편 로그인 가능 여부
* QR코드 촬영을 통한 친구 추가 가능 여부
* 스마트폰 내의 연락처 동기화 가능 여부
* 앱 외 알림에 대한 가능 여부
  

## Daily Reports

#### **21.11.15 (월)**

**Project**

* 주제 정하기.
* 앱에 들어갈 기능 나열해보고 기간과 능력에 맞게 구현 가능 여부 파악하기.

**Team Building (Zoom meeting 12:00 ~ 13:00)**

* 팀원들과 각자의 앱/서비스 주제와 방향 논의하기.
* 서로 아이디어 교류하고 보완점 찾아주기.

---

#### **21.11.16 (화)**

**Project**

* 주제에 맞게 내가 구현할 서비스의 목적, 의미, 타겟 구체화 하기.
* [Markdown] 4주간의 출시 프로젝트 계획서를 만들고 공수 산정 구하기 -> README.md
* [Figma] 간단하게 UI 그리기 -> 모든 페이지는 하지 못하고 각 Tab bar에 해당하는 3페이지와 Onboarding 뷰만.
* 간략한 기획서 작성하기.

**Team Building (Zoom meeting 10:30 ~ 11:30)**

* 각자 생각해온 앱/서비스의 방향성 공유 및 작성한 기획서와 계획서 공유.
* 서로 아이디어에 대한 코멘트 및 질의 응답.

---

#### **21.11.17 (수)**

**Project**

* [Miro] IA 작성 완료 하기.
* [Markdown] 계획서 작성 및 README 업로드.

**Team Building (Zoom meeting  10:20 ~ 10:50)**

* 기획서 작성중에 고민되는 부분들 논의 및 의견 제시.

---

#### **21.11.18 (목)**

**Project**

* Onboarding 화면 구현 완료 -> 회원가입과 로그인 버튼은 나중에 추가.
* 각 Tab bar에 들어갈 Home, Add, Personal Views 구현.

**Team Building (Zoom meeting 10:00 ~ 12:30)**

* 각자의 기획안과 계획 사항 발표

---

#### **21.11.19 (금)**

**Project**

* Firebase 연결 완료 (로그인과 회원 정보 관리용) / pod으로 추가 (Firebase Analytics, Auth, Core, Firestore).
* Cloud Firestore 위치는 asia - northeast3 로 지정.
* 회원가입과 로그인 페이지 구현 완료 -> Onboarding 화면에 합치기 & 스타일 sheet theme에 맞게 수정하기.
* 회원가입과 로그인 기능 구현 완료 -> 회원 가입시 필요한 정보와 ID(email), password의 조건 다듬기.

**Team Building (Zoom meeting 12:00 ~ 12:30)**

* 각자 프로젝트 진행 상황 공유 및 리뷰

---

#### **21.11.22 (월)**

**Project**

* 개인 프로필 화면 UI 구상 및 스토리보드 구현 (미완성).
* 데이터 구상 및 모델링.

**Team Building (Zoom meeting 10:00 ~ 11:00)**

* 각자의 주말간 진행사항 공유 및 피드백.
* 데이터를 어떻게 짜고 구현할지. 고려해야할 사항이 많음.

---

#### **21.11.23(화)**

**Project**

* 개인 프로필 화면 UI 스토리보드상 구현 및 뷰컨트롤러와의 연동. (3페이지)

**Team Building (Zoom meeting 11:00 ~ 11:30)**

* 각자의 기능 구현 및 디자인 내용 리뷰.
* 오늘의 목표 공유 -> 밤 10시에 인증(공유).

---

#### **21.11.24(수)**

**Project**

* 회원가입/로그인 기능 빼기 -> 개인정보 수집을 위해선 사업자 등록을 해야하는데 사업자 등록할 생각이 없기 때문에 구현되어있는 회원가입과 로그인 기능은 제외하기로 함. 

**Team Building (Zoom meeting 10:00 ~ 10:40)**

* 오늘의 목표 공유.
* 그 동안의 작업간에 알게된, 공유해보고 싶은 내용, 기능들 설명 및 리뷰.
* Moya- Alamofire 작업을 할 때, 코드를 직관적이고 가독성 좋게 쉽게 작성할 수 있다.
* Debugging stage에서 xcode상에 hiererchy 기능을 사용하면 뷰 레이어들을 한 눈에 볼 수 있고 새로운 레이어를 추가하려 할 때나, 숨겨져 있는 레이어를 찾아야할 때 유용하다.

---

#### **21.11.25(목)**

**Project**

* PersonalViewController + Personal2ViewController + Personal3ViewController UI구성 및 스타일링 부분 완성 (다시 다듬기).
* Utilites 파일에 UI관련 style sheet 작성. (label, button, textfield, view, etc.)
* 기존의 realm 데이터 모델 삭제 -> firebase로 모든 데이터 파트 구현.
* 로그인/회원가입 구현 여부는 아직 미정.
* Firebase 공부.

**Team Building (Zoom meeting 10:00 ~ 10:30)**

* 오늘의 목표 공유.
* 각자의 진행사항 공유 및 peer 리뷰.

---
