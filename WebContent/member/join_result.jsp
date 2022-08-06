<%@page import="com.member.MemberDAO"%>
<%@page import="com.member.MemberDTO"%>

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
</head>
<body>

 <jsp:include page="../main/header.jsp"/>
   
   <div id="content" align="center">
<br><br>
<br><br>
<br><br>

<h1>${userName }님 반갑습니다</h1>
<br><br>

<b>kristal 회원가입을 진심으로 환영합니다.</b><br>
<br>
<br>
	<div align="center">	
				<button  style="border:none; background-color: #FOFOFO; width: 200px; height: 50px;"
					type="button" onclick="javascript:location.href='<%=cp%>/shop/main/main.do';">
						<b style="font-size: 17px; color: black;">메인으로</b>
				</button>
				&nbsp;&nbsp;
				<button style="background-color: black; width: 200px; height: 50px;"
					type="button" onclick="javascript:location.href='<%=cp%>/shop/member/login.do';">
						<b style="font-size: 17px; color: white;">로그인하기</b>
				</button>	
			</div>
	<br><br>
<br><br>
<br><br>




</div>
   
<jsp:include page="../main/footer.jsp"/>


</body>
</html>