<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/member/css/memberListStyle.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/member/css/member.css" />

<script type="text/javascript">

function sendIt(){
	
	var f = document.myForm;
	
	
	window.close();
	f.submit();
	
	
	
}


</script>


</head>
<body>

	<form action="" method="post" name="myForm">

	
  	
	

	

	

		${message2 }


		 <button class="add_button1" type="button" name="userId"
			style="width: 170px;" onclick="sendIt();">
			<a style="font-size: 8px; color: #484848; float: center">다시입력하기</a>
		</button>


	</form>


</body>
</html>