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
<title>회원정보수정</title>
<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<style type="text/css">
body{
	font-size: 9pt;
}
td{
	font-size: 9pt;

}
.txtField{
	font-size: 9pt;

}

.btn{
	font-size: 9pt;
	background: #e6e6e6;

}
</style>

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
   
      
   
<table width="500" cellpadding="0" cellspacing="3" align="center" bgcolor="#e4e4e4">
<tr height="50">
	<td bgcolor="#ffffff" style="padding-left: 10px;">
	<b>회원수정</b>
	</td>
	</tr>
</table>
<br>
<form action="" method="post" name="myForm">

<table width="500" cellpadding="0" cellspacing="0" align="center">

<tr height="2">
	<td colspan="2" bgcolor="#ccccccc"></td></tr> 
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6" >아이디</td>
	<td style="padding-left: 5px;">
	${dto.userId }
	</td>
</tr>
<tr height="2">
	<td colspan="2" bgcolor="#ccccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">이름</td>
	<td style="padding-left: 5px;">
	<input type="text" name="userName"  value="${dto.userName }" size="20" maxlength="10" class="txtField"/>
	</td>
</tr>
<tr height="2">
	<td colspan="2" bgcolor="#ccccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">패스워드</td>
	<td style="padding-left: 5px;">
	<input type="text" name="userPwd"  value="${dto.userPwd }" size="20" maxlength="10" class="txtField"/>
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#ccccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">성별</td>
	<td style="padding-left: 5px;">
	<input type="text" name="userGender"  value="${dto.userGender }" size="20" maxlength="15" class="txtField"/>
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#ccccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">생일</td>
	<td style="padding-left: 5px;">
	<input type="text" name="userBirth"  value="${dto.userBirth }" size="20" maxlength="15" class="txtField"/>
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#ccccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">주소</td>
	<td style="padding-left: 5px;">
	
	
				<input type="text" name="address1" id="sample6_postcode" value="${dto.address1 }">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="address2" id="sample6_address" value="${dto.address2 }"><br>
				<input type="text" name="address3" id="sample6_detailAddress" value="${dto.address3 }">
				<input type="text"  name="address4"id="sample6_extraAddress" value="${dto.address4 }">
	
	
	
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#ccccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">E-Mail</td>
	<td style="padding-left: 5px;">
	<input type="text" name="userEmail"  value="${dto.userEmail }" size="20" maxlength="15" class="txtField"/>
	</td>
</tr>


<tr height="2">
	<td colspan="2" bgcolor="#ccccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">전화</td>
	<td style="padding-left: 5px;">
	<input type="text" name="userTel"  value="${dto.userTel }" size="20" maxlength="15" class="txtField"/>
	</td>
</tr>
<tr height="2">
	<td colspan="2" bgcolor="#ccccccc"></td></tr>
	
<tr height="35">
	<td align="center" colspan="2">
	
	<input type="hidden" name="userId" value="${dto.userId }"/>
	
	<input type="button" class="btn" value="수정완료" onclick="sendIt();"/>
	<input type="button" class="btn" value="수정취소" onclick="javascript:location.href='<%=cp%>/shop/member/myPage.do';"/> 
</table>





</form>

</div>
   
<jsp:include page="../main/footer.jsp"/>
</body>
</html>