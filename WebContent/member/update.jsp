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
			
		f.action = "<%=cp%>/shop/member/updated_ok.do";
		f.submit();
	}
	</script>	







</head>
<body>

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
	<input type="text" name="userAddress"  value="${dto.userAddress }" size="20" maxlength="15" class="txtField"/>
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


</body>
</html>