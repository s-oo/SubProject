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
<title>kristal 아이디찾기</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/member/css/memberListStyle.css" />

<script type="text/javascript">
	function searchpw(){
	
	var f = document.myForm;
	
	if(!f.userName.value){
		alert("성함을 입력해 주세요.");
		f.userName.focus();
		return;
	}
	
	if(!f.userTel.value){
		alert("전화번호를 입력해 주세요.");
		f.userTel.focus();
		return;
	
	}
	
	f.action = "<%=cp%>/shop/member/findId_ok.do";
	f.submit();
}

</script>



</head>
<body>
	<jsp:include page="../main/header.jsp" />

	<div id="content" align="center">

		<br> <br>



		<h2>아이디 찾기</h2>

		<br> <br>
		<form action="" method="post" name="myForm">
			<div id="left_area" style="display: inline-block;">
				<div id="update_area" style="width: 600px;">
					<div class="box row">

						<div class="box label">
							<label for="userName"><span><b>NAME</b></span></label>
						</div>
						<div class="box input">
							<input type="text" name="userName" id="userName" placeholder="이름" />
						</div>
					</div>

					<div class="box row">
						<div class="box label">
							<label for="userTel"><span><b>TEL</b></span></label>
						</div>
						<div class="box input">
							<input type="text" name="userTel" id="userTel"
								placeholder="(-)없이 숫자만 입력해주세요." />
						</div>
					</div>


				</div>
			</div>
			<br> <br> <br>
			<div align="center">
				<button
					style="border: none; background-color: #FOFOFO; width: 200px; height: 50px;"
					type="button" onclick="javascript:history.back();">
					<b style="font-size: 17px; color: black;">뒤로가기</b>
				</button>
				&nbsp;&nbsp;
				<button style="background-color: black; width: 200px; height: 50px;"
					type="button" onclick="searchpw();">
					<b style="font-size: 17px; color: white;">찾기</b>
				</button>
			</div>
			<table width="200;">
				<tr height="30">
					<td colspan="2" align="center"><font color="red"><b>
								${message }</b></font></td>
				</tr>
			</table>
			<table style="margin: auto;">

				<tr height="30">
					<td colspan="2" align="center"><a
						href="<%=cp%>/shop/member/findId.do"><b>${lego }</b></a></td>
				</tr>
			</table>


		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>