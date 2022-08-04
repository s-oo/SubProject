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
</head>
<body>
<h1>${userName }님 반갑습니다</h1>
<br><br>

<b>kristal 회원가입을 진심으로 환영합니다.</b><br>
<br>
<br>
<input type="button" value=" 메인으로 " onclick="location.href='<%=cp%>/shop/main/main.do';"/>
<input type="button" value=" 로그인 " onclick="location.href='<%=cp%>/shop/member/login.do';"/>






</body>
</html>