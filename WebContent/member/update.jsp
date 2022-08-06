<%@page import="com.member.MemberDTO"%>
<%@page import="com.member.MemberDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String userId = request.getParameter("userId");
	
	Connection conn= DBConn.getConnection();
	MemberDAO dao = new MemberDAO(conn);
	
	MemberDTO dto = dao.getReadData(userId);
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kristal회원정보수정</title>
<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"href="<%=cp%>/member/css/memberListStyle.css" />


<script type="text/javascript">


	function sendIt() {
		var f = document.myForm;
			
		f.action = "<%=cp%>/shop/member/update_ok.do";
		f.submit();
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
   
      
   


<form action="" method="post" name="myForm">
<div id="left_area" style="display: inline-block;" >
               <div id="update_area" style="width: 600px;">
                  <div class="box row">
                  
                  <div class="box label">
                        <label for="userName"><span><b>I&nbsp;&nbsp;D</b></span></label>
                     </div>
                   <div class="box input">
                        <input type="text" name="userId" id="userId"  readonly="readonly" value="${dto.userId }" />
                     </div>
                   </div>
                   
                   
                    <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span><b>NAME</b></span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userName" id="userName" value="${dto.userName }"/>
	                     </div>
             		</div>
                  
                    <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span><b>PASSWORD</b></span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userPwd" id="userName" value="${dto.userPwd }"/>
	                     </div>
             		</div>
                  	  <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span><b>GENDER</b></span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userGender" id="userGender" value="${dto.userGender }"/>
	                     </div>
             		</div>
                   <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span><b>BIRTH</b></span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userBirth" id="userBirth" value="${dto.userBirth }"/>
	                     </div>
             		</div>
                  
                  <div class="box row" style="height: 110px;">
                     <div class="box label" style="height: 80px;">
                        <label for="userAddress"><span><b>ADDRESS</b></span></label>
                     </div>
                     <div class="box input" style="padding: 0px;">
                      <div class="box input" style="padding: 5px;">
                           <input type="text" name="userAddr" id="sample6_postcode" class="input-2" placeholder="우편번호" value="${dto.userAddr[0] }">
                           <input type="button" onclick="sample6_execDaumPostcode()" class="input-2 right" value="우편번호 찾기">
                        </div>
                       
                        <div class="box input" style="padding: 5px;">
                           <input type="text" name="userAddr" id="sample6_address" placeholder="주소" value="${dto.userAddr[1] }">
                        </div>
                       
                        <div class="box input" style="padding: 5px;">
                           <input type="text" name="userAddr" id="sample6_detailAddress" placeholder="상세주소" value="${dto.userAddr[2] }">
                          <br>
                          
                        <div class="box input" style="padding: 5px;">  
                           <input type="text"  name="userAddr"id="sample6_extraAddress" placeholder="참고항목" value="${dto.userAddr[3] }">
                        </div>
                        </div>
                     </div>
                  </div>
                <div class="box row">
                     <div class="box label">
                        <label for="userTel"><span><b>TEL</b></span></label>
                     </div>
                     <div class="box input">
                        <input type="text" name="userTel" id="userTel" value="${dto.userTel }"/>
                     </div>
                  </div>
                  <div class="box row">
                     <div class="box label">
                        <label for="userEmail"><span><b>E-MAIL</b></span></label>
                     </div>
                     <div class="box input">
                        <input type="text" name="userEmail" id="userEmail" value="${dto.userEmail }"/>
                     </div>
                  </div>
                </div>
            </div>
				<br><br>
			<div align="center">	
				<button  style="border:none; background-color: #FOFOFO; width: 200px; height: 50px;"
					type="button" onclick="javascript:history.back();">
						<b style="font-size: 17px; color: black;">뒤로가기</b>
				</button>
				&nbsp;&nbsp;
				<button style="background-color: black; width: 200px; height: 50px;"
					type="button" onclick="sendIt();">
						<b style="font-size: 17px; color: white;">수정완료</b>
				</button>	
			</div>				
			<br>
				<div class="box input">	
					<button style="border:none; background-color: gray; width: 100px; height: 25px;"
							type="button" onclick="javascript:location.href='<%=cp%>/shop/member/delete.do';">
						<a style="font-size: 13px; color: white;">탈&nbsp;퇴</a>
					</button>
				</div>
</form>
 
</div>


<jsp:include page="../main/footer.jsp"/>
</body>
</html>