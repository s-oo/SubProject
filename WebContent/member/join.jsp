<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		if(!f.userId.value){
			alert("아이디를 입력해 주세요.");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value){
			alert("패스워드를 입력해 주세요.");
			f.userPwd.focus();
			return;
		}
		
		if(!f.userName.value){
			alert("이름을 입력해 주세요.");
			f.userName.focus();
			return;
		}
		
		if(!f.userBirth.value){
			alert("생일을 입력해 주세요.");
			f.userBirth.focus();
			return;
		}
		
		if(!f.userTel.value){
			alert("전화번호를 입력해 주세요.");
			f.userTel.focus();
			return;
		}
		
		f.action = "<%=cp%>/shop/member/join_ok.do"
		f.submit();
		
		
		
	}

	function asdf() {
	
		window.open("/sub/member/idCheck.jsp","idcheck","width=500, height=300");
	
	}
	
	function getUserAddress() {
		var f = document.myForm;
		var str="";
		str+=f.address1 + address2
	}
    
</script>
    

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
 <jsp:include page="../main/header.jsp"/>
   
   <div id="content" align="center">


<div id="bbs">
	<div id="bbs_title" align="center" >
	<b>회&nbsp;원&nbsp;가&nbsp;입</b>
	</div>
	
	<form action="" method="post" name="myForm">
	<div id="bbsCreated" align="center">
	
		<div class="bbsCreated_bottomLine" align="center">
			<dl>
				<dt>아&nbsp;이&nbsp;디</dt>
				<dd>
				<input type="text" name="userId" size="35" maxlength="20" class="boxTF"/>
				<input type="button" value=" 중복확인 " name="checkId" onclick="asdf();"/>
				</dd> 
			</dl>
			
		</div>

		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>패스워드</dt>
				<dd>
				<input type="password" name="userPwd" size="35" maxlength="20" class="boxTF"/>
				</dd> 
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
				<dd>
				<input type="text" name="userName" size="35" maxlength="20" class="boxTF"/>
				</dd> 
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</dt>
				<dd>
				<input type="text" name="userGender" size="35" maxlength="20" class="boxTF"/>
				</dd> 
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</dt>
				<dd>
				<input type="text" name="userBirth" size="35" maxlength="20" class="boxTF"/>[YYYY-MM-DD]
				</dd> 
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</dt>				
				<dd>				
				<input type="text" name="userAddr" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="userAddr" id="sample6_address" placeholder="주소"><br>
				<input type="text" name="userAddr" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text"  name="userAddr"id="sample6_extraAddress" placeholder="참고항목">
				</dd>
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>이&nbsp;메&nbsp;일</dt>
				<dd>
				<input type="text" name="userEmail" size="35" maxlength="20" class="boxTF"/>
				</dd> 
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화</dt>
				<dd>
				<input type="text" name="userTel" size="35" maxlength="20"  placeholder="(-)없이 숫자만 입력하세요" class="boxTF"/>
				</dd> 
			</dl>
		</div>

	</div>
	
	
	
	
	
	<div id="bbsCreated_footer" align="center">	
		<input type="button" value=" 가입하기 " class="btn2" onclick="sendIt();"/> 
		<input type="button" value=" 가입취소 " class="btn2" onclick="location.href='<%=cp%>/shop/main/main.do';"/> 
	</div>
	
	
	</form>
</div>



</div>
   
<jsp:include page="../main/footer.jsp"/>

</body>
</html>