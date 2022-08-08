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


<h1><b>회 원 탈 퇴</b></h1>

<form action="" method="post" name="deleteForm" onsubmit="return deleteValue();">

	<div id="left_area" style="display: inline-block;" >
               <div id="update_area" style="width: 600px;">
                  <div class="box row">
                  
                  <div class="box label">
                        <label for="userName"><span><b>I&nbsp;&nbsp;D</b></span></label>
                     </div>
                   <div class="box input">
                        <input type="text" name="userId" id="userId"  readonly="readonly" value="${dto.userId }" />
                     </div>
                   </div>
                   
                   
                    <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span><b>NAME</b></span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userName" id="userName" value="${dto.userName }"/>
	                     </div>
             		</div>
                  
                    <div class="box row">
	                     <div class="box label">
	                        <label for="userName"><span><b>PASSWORD</b></span></label>
	                     </div>
	                     <div class="box input">
	                        <input type="text" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요."/>
	                     </div>
             		</div>
                
            </div>
	</div>
<br><br>
					<div align="center">	
						<button  style="cursor:pointer; border:none; background-color: #FOFOFO; width: 200px; height: 50px;"
							type="button" onclick="javascript:history.back();">
								<b style="font-size: 17px; color: black;">뒤로가기</b>
						</button>
							&nbsp;&nbsp;
						<button style="cursor:pointer; background-color: black; width: 200px; height: 50px;"
							type="button" onclick="deleteValue();">
								<a style="font-size: 17px; color: white;">탈&nbsp;퇴</a>
						</button>	
					</div>	
				

</form>



</div>


<jsp:include page="../main/footer.jsp"/>

</body>
</html>