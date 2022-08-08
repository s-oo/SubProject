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
<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"href="<%=cp%>/member/css/memberListStyle.css" />

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
		
		if(!f.userGender.value){
			alert("성별을 입력해 주세요.");
			f.userGender.focus();
			return;
		}
		if(!f.userBirth[0].value){
			alert("생년월일을 입력해 주세요.");
			f.userBirth[0].focus();
			return;
		}
		 if(!f.userBirth[1].value){
			alert("월을 입력해 주세요.");
			f.userBirth[1].focus();
			return;
		}
		if(!f.userBirth[2].value){
			alert("일을 입력해 주세요.");
			f.userBirth[2].focus();
			return;
		}
		
		if(!f.userTel.value){
			alert("전화번호를 입력해 주세요.");
			f.userTel.focus();
			return;
		}
		
		/* if(!f.userEmail.value){
			alert("E-Mail 입력해 주세요.");
			f.userEmail.focus();
			return;
		} */
		f.action = "<%=cp%>/shop/member/join_ok.do"
		f.submit();
		
		
		
	}
	
	function checkNumber(event) {
		  if(event.key >= 0 && event.key <= 9) {
		    return true;
		  }
		  alert("0~9까지 숫자 4자리만 입력해주세요.")
		  return false;
		}
	
	function id_check() {
		  //window.open("팝업될 문서 경로", "팝업될 문서 이름", "옵션");
		  window.open("<%=cp%>/shop/member/idCheck.do", "idCheck", "width=600, height=200, left=200, top=100");
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
<body >
 <jsp:include page="../main/header.jsp"/>
   
   <div id="content" align="center">


<div id="bbs">
	<div id="bbs_title" align="center" >
	<b>회&nbsp;원&nbsp;가&nbsp;입</b>
	</div>
	
	<form action="" method="post" name="myForm">
	
	<div id="left_area" style="display: inline-block;" >
               <div id="update_area" style="width: 600px;">
                  <div class="box row">
                  
                  <div class="box label">
                        <label for="userId" ><span >I&nbsp;&nbsp;D</span></label>
                     </div>
                   <div class="box input">
                        <input onKeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');" type="text" name="userId" id="userId"placeholder="아이디"/>
                        <!-- <button type="button" onclick="id_check();">중복확인</button>
                        <input type="hidden" name="idDuplication" value="idUncheck"> -->

                     </div>
                   </div>
                   <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span>PASSWORD</span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userPwd" id="userPwd" placeholder="비밀번호"/>
	                     </div>
             		</div>
                   
                    <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span>NAME</span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userName" id="userName" placeholder="이름"/>
	                     </div>
             		</div>
                  
                    
                  	  <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span>GENDER</span></label>
	                     </div>
	                     <div class="box input">
	                     <!--  <input type="text" name="userGender" id="userGender"/> -->
	                        <select style="border: none; width: 80; height: 30; margin-left: -230px;" name="userGender">
	                       		<option value="">선택</option>
	                        	<option value="선택안함">선택안함</option>
	                        	<option value="남자">남자</option>
	                        	<option value="여자">여자</option>	                        
	                        </select>
	                     </div>
             		</div>
                   <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span>BIRTH</span></label>
	                     </div>
	                     <div class="box input">
	                  		<input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" style="width: 50px; vertical-align: middle;" 
	                  		type="text" name="userBirth" id="userBirth" placeholder="년도"/> 
		                  
		                    <select style="border: none; width: 80; height: 30; margin-left: -330px;" name="userBirth" >
							<option value="">월</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option></select>
							
							<input maxlength="2" style="margin-left: 100px; width: 50px; vertical-align: middle;" type="text" name="userBirth" id="userBirth" placeholder="일"/> 
                    
	                    </div>
             		</div>
                  
                  <div class="box row" style="height: 110px;">
                     <div class="box label" style="height: 80px;">
                        <label style="margin-left: -20px;" for="userAddress"><span>ADDRESS</span></label>
                     </div>
                     <div class="box input" style="padding: 0px;">
                      <div class="box input" style="padding: 5px; margin-left: -5px;">
                           <input type="text" name="userAddr" id="sample6_postcode" class="input-2" placeholder="우편번호" ">
                           <input style="cursor:pointer; border: black; width: 80; height: 30; margin-left: -100px;" type="button" 
                           onclick="sample6_execDaumPostcode()" class="input-2 right" value="우편번호 찾기">
                        </div>
                       
                        <div class="box input" style="padding: 5px; margin-left: -5px;">
                           <input type="text" name="userAddr" id="sample6_address" placeholder="주소" >
                        </div>
                       
                        <div class="box input" style="padding: 5px;margin-left: -5px;">
                           <input type="text" name="userAddr" id="sample6_detailAddress" placeholder="상세주소" >
                                                   
                        <div class="box input" style="padding: 5px; margin-left: -6px;">  
                           <input type="text"  name="userAddr"id="sample6_extraAddress" placeholder="참고항목">
                        </div>
                        </div>
                     </div>
                  </div>
                <div class="box row">
                     <div class="box label">
                        <label for="userTel"><span>TEL</span></label>
                     </div>
                     <div class="box input">
                        <input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11" type="text" name="userTel" id="userTel" placeholder="(-)없이 숫자만 입력해주세요."/>
                     </div>
                  </div>
                  <div class="box row">
                     <div class="box label">
                        <label for="userEmail"><span>E-MAIL</span><a>(선택)</a></label>
                     </div>
                     <div class="box input">
                        <input type="text" name="userEmail" id="userEmail" placeholder="이메일 (선택사항)"/>
                     </div>
                  </div>
                </div>
            </div>
            <br><br><br>
            
            
            
            
		<div align="center">	
				<button  style="cursor:pointer; border:none; background-color: #FOFOFO; width: 200px; height: 50px;"
					type="button" onclick="javascript:history.back();">
						<b style="font-size: 17px; color: black;">뒤로가기</b>
				</button>
				&nbsp;&nbsp;
				<button style="cursor:pointer; background-color: black; width: 200px; height: 50px;"
					type="button" onclick="sendIt();">
						<b style="font-size: 17px; color: white;">가입하기</b>
				</button>	
			</div>
	
	</form>
</div>



</div>
   
<jsp:include page="../main/footer.jsp"/>

</body>
</html>