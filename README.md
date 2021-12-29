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
* [Firebase] Auth를 이용해 로그인과 회원가입 기능 구현
* [Firebase] FireStore을 이용해 유저 데이터 클라우드 저장 구현
* [Firebase] Storage를 이용해 유저 프로필 사진/이미지 클라우드 저장 구현
* [IQKeyboardManager] textfields 입력 시 자동으로 키보드와 뷰의 높이 계산 및 키보드 가림 문제 해결


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

## Tests
#### **Mobile Test1 - 21.12.02(목)**

*__Issues__*: 
 1. 회원가입/로그인 스크린에서 부터 키보드가 한번 열리면 닫히질 않는다.
 2. Textfield 단어 자동 완성이 굉장히 신경쓰인다.
 3. 화면 전환시 애니메이션이 너무 단순하고 모든 경우 똑같다.

*__개선점__*:
 너무 기본적인 부분들에서 빠진게 많은것 같다... 키보드 부분과 textfield 자동완성, 뷰 이동 간 애니메이션 다시 체크하기.

---

#### **Mobile Test2 - 21.12.06(월)**
*__Issues__*: 

1. PersonalProfileView 에서 save 버튼이 simulator에선 작동했는데 모바일에선 작동이 안됨.
2. 사진 업로드 버튼 클릭시 권한을 허용하는 팝업 알림이 안뜸.

*__개선점__*:
 시뮬레이터에서 작동이 되는데 아이폰에선 안되는 경우의 이슈를 찾아보고 해결하기.., Textfields에 조금 더 부연 설명을 넣어주기 각 blank가 의미하는 부분에 대해.

---

#### **Mobile Test3 - 21.12.09(목)**
*__Issues__*: 

1. 프로필 사진이 기본 이미지에서 유저가 업로드한 본인 프로필 사진으로 바뀌는데까지 약 1~2초가 걸림. 너무 느리게 바뀜.
2. 아무리봐도 UI가 너무 촌스러움.. 

---

## Submission

#### First submission - Rejected (21.12.13)

- 테스터의 테스트를 위한 로그인 정보를 제공해 주지 않아서 앱 내의 모든 기능을 확인해 보지 못했다고 함.

---

#### Second submission - Accepted (21.12.18)
- 출시 성공!!

---



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

#### **21.11.26(금)**

**Project**

* Personal views에 들어갈 textfields -> TextFieldEffects 라이브러리의 Hoshi 스타일로 선정 -> 약간의 색과 사이즈 customizing 하기.
* Tab bar -> ColorMatchTabs 스타일로 선정 (세개의 각 탭바가 color theme을 갖고 있고 각 탭으로 이전할 때마다 해당 탭 화면의 background color를 해당 theme에 맞게 변경) -> Home tab: [orange] background, [black] contents, Personal tab: [black] background, [orange] font color, Add tab: 미정.

**Team Building (Zoom meeting 12:00 ~ 12:30)**

* 회원가입/로그인 기능을 우선은 이메일만 수집하고 아이디/비밀번호 만들게끔 (아이디/비밀번호 찾기, 비밀번호 재설정 기능 구현) -> 만약 리젝 당할시엔 이메일 수집 포기하고, 비밀번호 찾기 및 재설정 기능 포기 하고 단순히 아이디/비밀번호만 입력해서 회원가입 및 로그인 할 수 있게끔.

---

#### **21.11.27(토)**

**Project**

* Personal views(1,2,3) textfield안에 입력된 값 firestore에 올리는 작업 구현.
* Personal1,2view에서는 next button 클릭시 데이터 저장, personal3view에서는 save button클릭시 데이터 저장 및 root view로 pop 이동.
* [Firebase cloud firestore] Personal1,2,3view 모두 데이터 저장은 각 페이지별 따로 -> "userData" collection 안에 'owner', 'ownerAdd', 'ownerIntro' 각각의 document 생성 및 1,2,3 view 순서대로 각 document에 저장 -> 각 페이지별 담당하는 데이터의 분류와 목적이 다르게 때문에 다른 document에서 저장 및 관리.
* textfield가 빈 칸으로 남을 시 firestore에는 "" 으로 저장됨 -> nil로 바꿀지 말지 고려중.
* textfield에서 값이 입력되고 한번 저장이 되면 이제 textfield가 자체적으로 유저가 이전에 입력해서 저장해둔 값을 나타내고 있음 -> textfield값에서 snapshot listener의 필요 여부 고민중.

---

#### **21.11.28(일)**

**Project**

* PersonalProfileView: 유저(owner)가 입력한 본인 프로필 데이터(personal views1,2,3)를 보여주는 화면.
* PersonalProfileView UI 80% 구현 및 스타일링 (Utilities file에 style sheet 일괄 작성)

---

#### **21.11.29(월)**

**Project**

* Utilities에서 background color와 font color 전부 systembackground, .label 로 변환 -> 기본 라이트모드 다크모드 세팅 -> 추후에 원래 구상해둔 theme color로 custom color setting 예정.
* PersonalProfileView에서 firebase상의 user에 관한 모든 데이터를 받아오기 때문에, snapshot listener를 이용해 실시간으로 데이터 로딩하게끔 구현. -> personal1,2,3Views에서 입력된 모든 데이터 값이 실시간으로 로딩됨.
* Firebase Storage 추가됨 -> 이미지 관리를 위해.
* UIImagePickerController을 이용해 유저의 아이폰 포토 앨범에서 프로필 이미지를 선택할 수 있게 해줌.
* Xcode info file에서 유저의 아이폰 포토 앨범 접근 권한 부여.
* 유저가 프로필 생성 당시 이미지를 포토 앨범에서 고르고 저장하면 이미지가 firebase storage에 업로드 됨.
* PersonalProfileView에서 유저가 업로드한 사진을 다운 받아옴 -> 하지만 아직 snapshot listener처럼 실시간으로 받아오는 방법을 찾지 못함 -> 추후 구현.
* UIColor+Extension 추가: hex color를 다루기 위한 파일 생성 -> theme컬러로 잡은 5가지 컬러를 hex color로 표현하기 위함.
* CALayer+Extension 추가: 뷰의 테두리에 필요한 방향(all, top, bottom, left, right)으로만 boarder를 잡아주기 위함 -> 어떤 뷰든 addBoarder function을 이용해 원하는 방향과, 색, 두께를 정해서 테두리를 잡을 수 있음.
* Personal1,2,3 views + PersonalProfileView UI 90% 구현 -> 버튼과 텍스트필드만 추가 스타일링.

---

#### **21.11.30(화)**

**Project**

* [Firestore] 데이터를 개인 유저로써 올리고 내리는데에는 문제가 없지만, 추후 유저가 늘어났을 경우 고유 아이디를 통해 접속을 해서 데이터를 받아와야 하기 때문에, 이슈 해결중.
* 회원가입과 로그인 기능을 중간에 뺐었는데, 개인정보를 특별히 수집하지 않는 선에서, nickname과 password만 만드는 한도로 회원가입/로그인 기능 다시 추가. 
* 전반적인 UI 다듬기와 theme color를 이용한 라이트 모드와 다크 모드 별 디자인 구현.

---

#### **21.12.01(수)**

**Project**

* [Firestore] 회원가입을 통해 한 유저에게 고유의 firestore에서 제공하는 uid부여 -> uid를 이용해 각 유저별 collection생성 및 각 유저별 데이터를 document에 저장. -> 이제 어느 디바이스에서 로그인 하던 데이터 crud가능 및 유저별 다른 유저 추가 가능.
* [Firebase Storage] 프로필 이미지로 사용될 이미지 파일들은 storage에 jpeg형태로 따로 저장. 이슈: firestore document에 같이 저장되는것이 아니기 때문에 관리가 어렵다 -> 각 유저에게 부여되는 고유의 uid를 이미지 파일 이름으로써 저장 -> filepath에 uid만 있으면 이미지를 쉽게 불러올 수 있다. 이슈 해결.
* UI 최종 다듬기 및 쓰이지 않는 불필요한 label, button, textfield 지우기. 

---

#### **21.12.02(목)**

**Project**

* [Figma] App Icon 제작.
* xcode 프로젝트 app store connect Test Flight에 올리기. 
* 모바일 Test 1 진행.

---

#### **21.12.06(월)**

**Project**

* Textfield 작성시 키보드 한번 올라오면 안내려가던 이슈 해결.
* 단어 자동완성 없앰.
* 버튼 몇개 불필요하다고 판단해서 없앰. (1차 출시는 꼭 필요한 기능들만 넣기)

---

#### **21.12.08(수)**

**Project**

* UI부분 최종 수정 (버튼 이미지, textfield placeholder, label 문구, 기본 이미지 등)
* [Firebase] 회원가입은 이메일과 비밀번호 로그인 형식으로 최종 설정.
* 오류 확인 및 테스트.

---

#### **21.12.09(목)**

**Project**

* 유저의 아이폰 앨범에 접근 권한 alert과 앨범 이용 코드 수정



## Updates

### 업데이트 예정

1. 회원 관리
   * 회원가입 시 이름, 아이디(이메일), 비밀번호 입력 받기
   * Firebase firestore 규칙 보완하기 -> auth된 유저만 CRUD가능 + 프로필은 원래 주인인 유저만 수정 가능하게
   * 회원 탈퇴 기능 추가
2. UI
   * 모든 화면 ui 보완
   * Home 화면에서 보여지는 유저의 명함 cell 구성을 다시 하기
   * 각 textfield에 목적에 맞는 제약 조건 걸기
   * Home 화면에서 명함 cell 클릭시 해당 유저의 상세 profile 페이지 화면으로 넘겨주기
3. 기능
   * QR코드 생성기능 만들기 -> profile 뷰 상단에 버튼 생성 + 버튼 클릭시 본인 프로필과 연결되는 qr코드 생성
   * Add user 기능 만들기 -> add 뷰를 새로 생성(바로 카메라 화면으로 전환) + 상대 유저의 qr코드를 찍으면 해당 유저의 프로필/명함을 받아올 수 있게하기
   * Home 화면 상단에 edit 버튼 추가 -> 유저가 그룹을 생성, 관리할 수 있는 기능 추가 + home 화면에서 상단에 section tab bar를 만들어 그룹별로 명함/프로필을 볼 수 있게끔 설정
4. 성능 개선
   * 이미지 불러오는 시간이 너무 오래걸림 -> 로딩 시간 없이 바로 불러올 수 있도록 이미지 업로드시 사이즈 줄여서 업로드 시키기

---

### 업데이트 내용

#### **21.12.23(목)**
* 로그인, 회원가입시 뜨는 에러문구 수정
* 링크를 포함하는 label 클릭시 클립보드로 복사되는 기능 추가

---

#### **21.12.28(화)**
* SnapKit 추가 (cocoa pod)
* QR code generator 구현 -> 해당 유저의 firestore uid를 담고있는 qr 코드를 생성 / 추후 친구 추가 및 공유를 위한 기능
* QRCodeViewController 추가 -> PersonalProfileViewController에 qr버튼 추가 및 버튼 클릭시 QRCodeViewController가 present로 열림 / QRCodeViewController는 QR code만 보여주는 역할

---

#### **21.12.29(수)** 
*version 1.1.0*

* [SwiftUI] QRCodeView: 해당 유저의 userAuth.uid를 담은 qr code를 생성하는 뷰
* [SwiftUI] QRCodeViewController: [SwiftUI]를 이용해 위에 생성한 QRCodeView를 불러와 화면상에 보여주는 viewcontroller -> PersonalProfileViewController 상단의 qr모양 버튼 클릭시 present 방식으로 화면 전환이 되면서 qr코드를 보여줌. -> 추후 친구 추가 등의 기능을 위한 qr code
* QRCode관련한 코드들이 SwiftUI의 CoreImage 를 이용해 구현되었고, UIKit으로 만들어진 PersonalProfileViewController에서 해당 QR뷰로 넘어가기 위해서 UIHostingController를 이용하였다. UIKit버전에서 SwiftUI코드 뷰로 화면전환이 생길 때 UIHostingController를 이용하면 매우 용이하게 전환될 수 있다
* [SwiftUI] QRCodeScanner: Home 화면 상단에 친구추가 버튼 추가 및 버튼 클릭시 카메라창이 present 방식으로 화면 전환되어 QR코드를 스캔할 수 있게해줌

