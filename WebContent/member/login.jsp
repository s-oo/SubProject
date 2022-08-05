<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/shopStyle.css" />

<script type="text/javascript">
	function login(){
	
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
	
	f.action = "<%=cp%>/shop/member/login_ok.do";
	f.submit();
	}
</script>

</head>
<body>
	<jsp:include page="../main/header.jsp" />

	<div id="content" align="center">

		<form action="" method="post" name="myForm">
			<table width="400" cellpadding="0" cellspacing="0"
				style="margin: auto;">

				<tr height="2">
					<td colspan="2" bgcolor="#cccccc"></td>
				</tr>

				<tr height="30">
					<span ><b>로그인</b></span>
				</tr>

				<tr height="2">
					<td colspan="2" bgcolor="#cccccc"></td>
				</tr>

				<tr height="25">
					<td width="80" bgcolor="#e6e4e6" align="center">아이디</td>
					<td width="120" style="padding-left: 5px;">
					<input width="150" type="text" name="userId" maxlength="10" size="15" /></td>
				</tr>

				<tr height="2">
					<td colspan="2" bgcolor="#cccccc"></td>
				</tr>

				<tr height="25">
					<td width="80" bgcolor="#e6e4e6" align="center">패스워드</td>
					<td width="120" style="padding-left: 5px;">
					<input type="password" name="userPwd" maxlength="10" size="15" /></td>
				</tr>

				<tr height="2">
					<td colspan="2" bgcolor="#cccccc"></td>
				</tr>

				<tr height="30">
					<td colspan="2" align="center"><input type="button"
						value=" 로그인 " class="btn2" onclick="login();" /> 
						<inputtype="button" value=" 취소 " class="btn2" onclick="lo cation='<%=cp%>/shop/main/main.do';" /><br> <br>
						<input width="10" height="" type="button" value=" 회원가입 " class="btn2" onclick="location='<%=cp%>/shop/member/terms.do';" />
					</td>
				</tr>

				<tr height="30">
					<td colspan="2" align="center"><font color="red"><b>${message }</b></font></td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr height="2">
					<td colspan="2" bgcolor="#cccccc"></td>
				</tr>

				<tr height="30">
					<td colspan="2" align="center"><a
						href="<%=cp%>/shop/member/find.do"><b>${searchpw }</b></a>
				</tr>
				<tr height="2">
					<td colspan="2" bgcolor="#cccccc"></td>
				</tr>
			</table>

		</form>

	</div>

	<jsp:include page="../main/footer.jsp" />




</body>
</html>