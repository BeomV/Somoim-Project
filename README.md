# Somoim-Project (온앤오프)

오프라인이 아닌 온라인 모임을 통해 사람들 간 원활한 커뮤니케이션을 위한 소모임 플랫폼입니다.

**멀티캠퍼스 백엔드 개발자 취업캠프(Java) 11회차 최우수상 수상**

## 프로젝트 개요

| 항목 | 내용 |
|------|------|
| **기간** | 2023.06 ~ 2023.07 (약 1개월) |
| **인원** | 4명 (팀 프로젝트) |
| **수상** | 멀티캠퍼스 최우수상 |
| **배포** | AWS |

## 담당 역할

- 화면 설계 및 반응형 퍼블리싱
- 소모임 게시판 핵심 기능 개발 (CRUD, 일정, 투표, 참석/취소)
- 카카오페이 API 연동 결제 프로세스 구현
- GitHub 버전 관리 및 AWS 배포

## 기술 스택

| 구분 | 기술 |
|------|------|
| **Backend** | Java (JDK 1.6), Spring Framework 3.9.18 |
| **ORM** | MyBatis 1.1.1 |
| **Frontend** | HTML/CSS, JavaScript, jQuery |
| **Database** | Oracle 11g, MongoDB 3.12.14 |
| **Server** | Apache Tomcat 9.0.73 |
| **배포** | AWS |
| **API** | 카카오페이 API, RESTful API |
| **기타** | Lombok |

## 주요 기능

### 소모임 관리
- 소모임 개설, 수정, 삭제 (CRUD)
- 소모임 일정 관리 (CRUD)
- 일정 참석 / 취소

### 투표 기능
- 소모임 내 투표 생성 및 참여
- 비동기(AJAX) 처리로 서버 부하 최적화
- 중복 투표 방지

### 포인트몰
- 카카오페이 API 연동 결제
- 포인트 충전 및 사용

### 커뮤니티
- 게시판 CRUD
- 댓글 / 대댓글
- 갤러리 (MongoDB 기반 이미지 관리)

## 기술적 도전

### 1. 투표 기능 비동기 전환

처음에는 투표를 동기 방식으로 구현하여, 투표 시 페이지 리로드가 발생하고 서버 부하가 컸습니다.
이를 **AJAX 비동기 방식**으로 전환하여 응답 속도를 개선했습니다.

```java
@RequestMapping(value = "/vote_UpdateOK.do", method = RequestMethod.POST)
public ResponseEntity<String> vote_update(Somoim_Choice_Vote vo, HttpServletRequest request) {
    String userId = (String) request.getSession().getAttribute("user_id");
    vo.setSom_vote_user_id(userId);

    int result = service.vote_update(vo);

    if (result == 1) {
        return new ResponseEntity<>("Success!", HttpStatus.OK);
    } else {
        return new ResponseEntity<>("Fail!", HttpStatus.OK);
    }
}
```

```javascript
$.ajax({
    url: "vote_UpdateOK.do",
    data: { som_qvote_num: voteVo_num, choice: voteItemValue },
    method: 'POST',
    dataType: 'text',
    success: function(response) {
        location.reload();
    }
});
```

### 2. 듀얼 DB 아키텍처 (Oracle + MongoDB)

갤러리의 대용량 이미지 데이터가 점점 증가할 것을 예상하여,
**Oracle**(정형 데이터) + **MongoDB**(비정형 이미지 데이터) 병행 사용으로 전환했습니다.

- 대량의 이미지 데이터 저장 시 MongoDB의 수평 확장성 활용
- 실제 페이지 로드 속도 개선 확인

### 3. Git 충돌 관리

팀 프로젝트 초기에 브랜치 병합 시 많은 충돌을 경험했습니다.
충돌을 최소화하기 위해 GitHub 관리 방법을 학습하고, 브랜치 전략을 개선하여 해결했습니다.

## 프로젝트 구조

```
src/main/
├── java/
│   └── controller/    # 소모임, 게시판, 투표, 결제 컨트롤러
│   └── service/       # 비즈니스 로직
│   └── model/         # VO 클래스
│   └── dao/           # DAO 인터페이스
├── resources/
│   └── jdbc/          # MyBatis SQL Mapper (18개 XML)
│       ├── sqlMapper_somoim.xml
│       ├── sqlMapper_somoim_board.xml
│       ├── sqlMapper_vote.xml
│       ├── sqlMapper_member.xml
│       └── ...
└── webapp/
    └── WEB-INF/views/ # JSP 뷰
```

## 데이터베이스

- `onandoff.sql` - Oracle DDL/DML 스크립트 포함

## 프로젝트 결과

![최우수상](https://github.com/BeomV/Somoim-Project/assets/101873654/6cf7f9af-0e91-45cb-a2cc-e57f8ae30d8e)

## 시작하기

### 사전 요구사항
- JDK 1.8
- Apache Tomcat 9.0
- Oracle 11g
- MongoDB 3.x

### 1. 데이터베이스 설정
- Oracle: `onandoff.sql` 실행
- MongoDB: 갤러리 컬렉션 자동 생성

### 2. 빌드 및 실행
```bash
mvn clean package
```
Tomcat에 WAR 파일을 배포하여 실행합니다.
