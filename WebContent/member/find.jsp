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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/member/css/memberListStyle.css" />


<script type="text/javascript">
	function searchpw(){
	
	var f = document.myForm;
	
	if(!f.userId.value){
		alert("아이디를 입력해 주세요.");
		f.userId.focus();
		return;
	}
	
	if(!f.userTel.value){
		alert("전화번호를 입력해 주세요.");
		f.userTel.focus();
		return;
	
	}
	
	f.action = "<%=cp%>/shop/member/find_ok.do";
		f.submit();
	}
</script>



</head>
<body>




	<jsp:include page="../main/header.jsp" />

	<div id="content" align="center">

		<br>
		<br>
	


		<h2>비밀번호 찾기</h2>

		<br> <br>
		<form action="" method="post" name="myForm">
			<div id="left_area" style="display: inline-block;">
				<div id="update_area" style="width: 600px;">
					<div class="box row">

						<div class="box label">
							<label for="userId"><span><b>I&nbsp;&nbsp;D</b></span></label>
						</div>
						<div class="box input">
							<input type="text" name="userId" id="userId" placeholder="아이디" />
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
					style="cursor:pointer; border: 0.5; background-color: white; width: 200px; height: 50px;"
					type="button" onclick="location.href='<%=cp%>/shop/member/login.do';"
					onmouseover=this.style.backgroundColor='#F0F0F0' onmouseout=this.style.backgroundColor='white'>
					<b style="font-size: 17px; color: black;">뒤로가기</b>
				</button>
				&nbsp;&nbsp;
				<button style="cursor:pointer; background-color: black; width: 200px; height: 50px;"
					type="button" onclick="searchpw();">
					<b style="font-size: 17px; color: white;">찾기</b>
				</button>
			</div>


			<table>
				<tr height="30">
					<td colspan="2" align="center"><font color="red"><b>
								${message }</b></font></td>
				</tr>
			</table>
			<table style="margin: auto;">
				<tr height="30">
					<td colspan="2" align="center"><a
						href="<%=cp%>/shop/member/login.do"><b>${lego }</b></a></td>
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