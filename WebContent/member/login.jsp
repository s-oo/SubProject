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

<link rel="stylesheet" type="text/css"href="<%=cp%>/member/css/memberListStyle.css" />
<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
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
			<div id="left_area" style="display: inline-block;" >
               <div id="update_area" style="width: 500px; margin: 50px auto;">
                  <div class="box row">
                  
                  <div class="box label">
                        <label for="userId" ><span><a style=" font-size: 8px; color: #484848;" >MEMBER&nbsp;I&nbsp;D</a></span></label>
                     </div>
                   <div class="box input">
                        <input type="text" name="userId" id="userId" />
                     </div>
                   </div>
					 <div class="box row">
                  
	                  <div class="box label">
	                        <label for="userPwd" ><span><a style=" font-size: 8px; color: #484848;" >PASSWORD</a></span></label>
	                     </div>
	                   <div class="box input">
	                        <input type="password" name="userPwd" id="userPwd"/>
                     </div>
                   </div>
				
		
				</div>
			</div>
			<div align="center">	
				<button   style=" cursor:pointer; margin-top:10PX; border:1px solid #BDBDBD; background-color: #FFFFFF; width: 200px; line-height: 48px;" type="button" onclick="login();" 
				onmouseover=this.style.backgroundColor='#F0F0F0' onmouseout=this.style.backgroundColor='white'>
						<a style=" font-size: 8px; color: #484848;" >SIGN IN</a>
				</button>				
			</div>
				
				
			<div  style="font-size: 11px; margin-top: 10px; margin-left: 300px;   text-align:center; ">
				<a href="<%=cp%>/shop/member/findId.do" style="font-size: 8px; ">SEARCH&nbsp;ID</a> <span>/&nbsp;</span> 
				<a href="<%=cp%>/shop/member/find.do" style="font-size: 8px; ">PASSWORD</a>
			</div>	
				
			
			 <table width="300">
				<tr  height="30">
					<td colspan="2" align="center"><font color="red"><b>${message }</b></font></td>
				</tr>
			</table>

		<%--	<table style="margin: auto;">
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
 --%>
		</form>
<br><br><br><br><br><br><br>
	</div>

	<jsp:include page="../main/footer.jsp" />




</body>
</html>