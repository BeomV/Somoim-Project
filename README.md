# 소모임 프로젝트(팀404)
오프라인이 아닌, 온라인 모임을 통해 사람들간 원할한 커뮤니케이션을 위한 사이트입니다.

### 제작기간
2023.06 ~ 2023.07 (약1개월)

### 기여 부분
화면 설계 및 퍼블리싱(반응형)<br>
소모임 게시판 내부 기능 및 포인트몰<br>
``
소모임 개설(CRUD), 소모임 일정(CRUD), 투표 기능, 일정 참석/취소, 카카오페이 API 연동 결제 프로세스
``
<br>
Github 버전관리<br>
AWS 배포

# 프로젝트 설명
저희는 소모임 프로젝트를 개발하면서 자바의 스프링 프레임워크를 사용하였습니다.
스프링 프레임워크를 사용한 이유는 확장성 있는 웹 애플리케이션을 빠르고 효율적으로
개발 할 수 있도록 다양한한 통합 솔루션을 제공하기 때문입니다.
<br>
또한, 자바는 크로스플랫폼으로 어떠한 OS 환경에서도 높은 호환성을 보여줍니다.

### 🛠️ Tools 🛠️


<div align="left">
  <strong>Front-end</strong>
  <br>
	<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white" />
	<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white" />
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white" />
  <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white" />
</div>
<br>

<div align="left">
  <strong>Back-end</strong>
  <br>
  <img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white" />
	<img src="https://img.shields.io/badge/Spring-6DB33F?style=flat&logo=Spring&logoColor=white" />
  <img src="https://img.shields.io/badge/Spring Security-6DB33F?style=flat&logo=Spring Security&logoColor=white" />
</div>
<br>

<div align="left">
  <strong>Ohters</strong>
  <br>
  <img src="https://img.shields.io/badge/Oracle-f80000?style=flat&logo=Oracle&logoColor=white" />
	<img src="https://img.shields.io/badge/MongoDB-47a248?style=flat&logo=MongoDB&logoColor=white" />
  <img src="https://img.shields.io/badge/Amazon AWS-232F3E?style=flat&logo=Amazon AWS&logoColor=white" />
</div>
<br>

### 🧾 Version 🧾

Language : JAVA (JDK 1.6), HTML/CSS,JavaScript<br>
Server: apache-tomcat-9.0.73<br>
FrameWork : Spring 3.9.18 RELEASE, (ORM) Mybits 1.1.1<br>
DataBase : Oracle6 11.2.0.4 , MongoDB 3.12.14<br>
IDE : Eplipse STS3 , InteljiJ, Visual Code, SQL Developer, Studio 3T<br>
API & Library : RESTful API  (JSON), Jquery, KaKaoPay, CRUD, LomBok


## 겪었던 문제점들
첫번 째로 투표 기능을 개발할 때, 투표 선택을 할 경우 서버에 부하가 많이 걸리는 것을 확인하였습니다. 투표 기능을 처음에는 동기 방식으로 구성하였습니다.
또한 중복 방지를 안 해놓은 시점에서 투표를 눌렀을 경우 페이지 리로드가 되면서 응답 속도가 현저히 느려짐을 느꼈습니다. 이를 대처하기 위해 투표 기능을 
비동기 방식으로 서버에 응답을 요청 후 클라이언트에 반환되게 코드를 수정하여 개선하였습니다.

## @Controller
```
@RequestMapping(value = "/choice_insertOK.do", method = RequestMethod.POST)
    public String choice_insertOK(Somoim_Choice_Vote vo) {
        log.info("choice_insertOK.do().....{}", vo);

        service.choice_insert(vo);


        // HTTP 상태 코드 200(OK)와 함께 num 값을 응답 본문에 담아 반환합니다.
        return "SUCCESS";
    }

    @RequestMapping(value = "/vote_UpdateOK.do", method = RequestMethod.POST)
    public ResponseEntity<String> vote_update(Somoim_Choice_Vote vo, HttpServletRequest request) {
        log.info("vote_insertOK.do().....{}", vo);

        String userId = (String) request.getSession().getAttribute("user_id");

        vo.setSom_vote_user_id(userId);
        log.info(vo.getSom_vote_user_id());

        int result = service.vote_update(vo);


        if (result == 1) {
            // HTTP 상태 코드 200(OK)와 함께 num 값을 응답 본문에 담아 반환합니다.
            return new ResponseEntity<>("Success!", HttpStatus.OK);

        }else{
            return new ResponseEntity<>("Fail!", HttpStatus.OK);
        }

    }

    @RequestMapping(value = "/vote_CancleOK.do", method = RequestMethod.POST)
    public ResponseEntity<String> vote_CancleOK(Somoim_Choice_Vote vo, HttpServletRequest request) {
        log.info("vote_insertOK.do().....{}", vo);

        String userId = (String) request.getSession().getAttribute("user_id");

        vo.setSom_vote_user_id(userId);
        log.info(vo.getSom_vote_user_id());

        int result = service.vote_cancle(vo);


        if (result == 1) {
            // HTTP 상태 코드 200(OK)와 함께 num 값을 응답 본문에 담아 반환합니다.
            return new ResponseEntity<>("Success!", HttpStatus.OK);

        }else{
            return new ResponseEntity<>("Fail!", HttpStatus.OK);
        }

    }
```

## JavaScript
```
$(document).ready(function() {


    var globalCurrentNum;

    function setCurrentNum(num) {
        globalCurrentNum = num;
    }

    function vote_items(current_num) {
        $('.vote_items').each(function() {
            var voteItem = $(this).val();

            $.ajax({
                url: "choice_insertOK.do",
                data: {
                    som_qvote_num: current_num,
                    choice: voteItem,
                    somoim_num: $('#insert_num').val()
                },
                method: 'POST',
                dataType: 'text',
                success: function(response) {
                    console.log('ajax....success', response);
                },
                error: function(xhr) {
                    console.log('xhr.status:', xhr.status);
                }
            });
        });
    }
}

var prevClickedButton = null;


    function test(buttonElement) {
        var userId = "${user_id}";
        console.log(userId);

        var voteItemValue = $(buttonElement).find('.vote_items').val();
        var voteVo_num = $(buttonElement).find('#voteVo_num').val();
        console.log(voteItemValue);
        console.log(voteVo_num);

        var VoteMember = $(buttonElement).find('.som_vote_member').val();
        console.log(VoteMember);

        // VoteMember를 '/'로 분할하고, userId가 있는지 확인
        var VoteMemberArray = VoteMember.split('/');
        if (VoteMemberArray.includes(userId)) {
            $.ajax({
                url: "vote_CancleOK.do",
                data: {
                    som_qvote_num: voteVo_num,
                    choice: voteItemValue,
                },
                method: 'POST',
                dataType: 'text',
                success: function (response) {
                    console.log('Success:', response);
                    location.reload();

                },
                error: function (xhr) {
                    ;
                    alert('Error occurred. Status: ' + xhr.status);
                }
            });
        } else {
            $.ajax({
                url: "vote_UpdateOK.do",
                data: {
                    som_qvote_num: voteVo_num,
                    choice: voteItemValue,
                },
                method: 'POST',
                dataType: 'text',
                success: function (response) {
                    console.log('Success:', response);
                    location.reload();

                },
                error: function (xhr) {
                    ;
                    alert('Error occurred. Status: ' + xhr.status);
                }
            });

        }
    }

    $(document).ready(function() {
        var userId = "${user_id}";

        // 모든 투표 항목을 순회
        $('.vote_items').each(function() {
            var buttonElement = $(this).parent(); // 현재 투표 항목의 부모 요소 (버튼 요소)를 선택
            var VoteMember = buttonElement.find('.som_vote_member').val();
            console.log("including member");

            // VoteMember를 '/'로 분할하고, userId가 있는지 확인
            var VoteMemberArray = VoteMember.split('/');
            if (VoteMemberArray.includes(userId)) {
                $(this).css('background-color', '#ccc'); // vote_items 요소의 배경색을 #ccc로 변경
            }
        });
    });
```


## Oracle, MongoDB를 두 가지의 DB를 쓴 이유
현재 MongoDB를 사용한 부분은 소모임 게시판 내 갤러리 부분에 사용되었습니다. 이 부분에 MongoDB를 사용하게된 이유는 우선, 처음에는 기존과 동일한 Oracle을 사용하려고 하였습니다
저희 소모임 갤러리 게시판은 개설된 소모임 내에서 게시판에 업로드 되는 모든 이미지 파일들이 올라가게 설계 되어있습니다. 그래서 점점 방대햔 양의 데이터들이 쌓일 것을 예상하였습니다.
또한 멘토님이 ``만약 갤러리가 10억개 이상의 데이터가 들어가면 어떻게 대처할 것인지?``에 대한 질문을 하였을 때 팀원들과 많은 고민을 해본 결과 데이터 증가에 대응하기 용이한 MongoDB를 사용하게 되었습니다.
이러한 개선을 한 결과 실제로 페이지가 로드 되는 속도가 개선되는 효과를 확인하였습니다.

##  추가해보고 싶은 기능
많은 것들을 추가해보고 싶기는 하지만 그 중에 가장 해보고 싶은 것은 ``JWT 토큰을 이용한 로그인 방식, OAuth2.0을 활용한 간편 로그인 방식, Spring Batch를 사용한 대용량 데이터 처리 애플리케이션 구축, Soft Delete를 사용한 데이터 삭제``
등 시도해보고 싶다는 생각이 들었습니다. 앞으로도 다양한 기술들을 체험해보고 완성도를 높여가는 개발자이고 싶습니다.

## 프로젝트를 하면서 느낀점
이번 멀티캠퍼스 11회차 교육을 들으면서 처음 팀 프로젝트를 수행해보았습니다. 처음에는 의견도 맞고 가치관도 같아 팀원들과 시너지를 발휘하여 효율적이고 빠른 속도로 개발이 진행되었지만
각자 브랜치를 병합하는 부분에서 많은 충돌을 경험했습니다. 병합에 익숙하지 않아 내 커밋으로 인해 팀원들의 코드까지 영향을 받는 모습을 보고 많은 자책과 미안한 감정을 느끼게 되어 구글링과 유튜브를 통해 Github 관리에 대해 많은 지식을 습득하여
충돌을 최소화 시키는 자신을 보고 그래도 좋은 경험이 되었다는 것을 느꼈습니다. 또한 그런 저를 괜찮다 괜찮다 해준 팀원들에게 너무 고맙고 나도 팀원들을 먼저 생각하는 개발자가 되고 싶다는 생각이 들었습니다.

## 프로젝트 결과
![image](https://github.com/BeomV/Somoim-Project/assets/101873654/6cf7f9af-0e91-45cb-a2cc-e57f8ae30d8e)

[(최우수상_상장)멀티캠퍼스 백엔드 개발자 취업캠프(Java) 11회차.pdf](https://github.com/BeomV/Somoim-Project/files/12664275/_.Java.11.pdf)





