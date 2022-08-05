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
<title>탈퇴화면</title>
<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"href="<%=cp%>/member/css/memberListStyle.css" />

<script type="text/javascript">

	function deleteValue() {
		
		var f = document.deleteForm;
		
		
		if(!document.deleteForm.userPwd.value){
			alert("패스워드가 일치 하지 않습니다.");
			return false;
		}
		f.action = "<%=cp%>/shop/member/delete_ok.do";
		f.submit();
		
		
	}

</script>

</head>
<body>

<jsp:include page="../main/header.jsp"/>
   
   <div id="content" align="center">


<b>회 원 탈 퇴</b>

<form action="" method="post" name="deleteForm" onsubmit="return deleteValue();">

	<div id="left_area" style="display: inline-block;" >
               <div id="update_area" style="width: 600px;">
                  <div class="box row">
                  
                  <div class="box label">
                        <label for="userName"><span>I&nbsp;&nbsp;D</span></label>
                     </div>
                   <div class="box input">
                        <input type="text" name="userId" id="userId"  readonly="readonly" value="${dto.userId }" />
                     </div>
                   </div>
                   
                   
                    <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span>NAME</span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userName" id="userName" value="${dto.userName }"/>
	                     </div>
             		</div>
                  
                    <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span>PASSWORD</span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요."/>
	                     </div>
             		</div>
                
            </div>
	</div>
<br><br>
				<div class="box input">
					<input type="button" value=" 탈퇴 " onclick="deleteValue();"/>
				</div>


</form>



</div>


<jsp:include page="../main/footer.jsp"/>

</body>
</html>