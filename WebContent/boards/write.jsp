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
<title>게 시 판</title>

<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"href="<%=cp%>/orders/css/cartListStyle.css" />

<script type="text/javascript" src="<%=cp%>/boards/js/util.js"></script>
<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		str = f.subject.value;
		str = str.trim();
		if(!str){
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		f.subject.value = str;
		
		f.action = "<%=cp%>/shop/boards/write_ok.do";
		f.submit();
		
	}

</script>

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="bbs">
		<div id="bbs_title">
		Q A
		</div>
		
		<form action="" method="post" name="myForm">
		<div id="bbsCreated">
	
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
					<dd>
						<input type="text" name="subject" size="60" 
						maxlength="100" class="boxTF"/>
					</dd>
				</dl>		
			</div>
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>회원&nbsp;&nbsp;ID</dt>
					<dd>
						<input type="text" name="userId" size="35" 
						maxlength="20" class="boxTF"
						value="${sessionScope.userId }"/>
					</dd>
				</dl>		
			</div>
		
		
		
		
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
						<textarea rows="12" cols="63" name="content" class="boxTA"></textarea>
					</dd>
				</dl>		
			</div>
			
		
	
		</div>
	
		<div id="bbsCreated_footer">
			<input type="button" value=" 등록하기 " class="btn2"
				onclick="sendIt();"/>
			<input type="reset" value=" 다시입력 " class="btn2"
				onclick="document.myForm.subject.focus();"/>
			<input type="button" value=" 작성취소 " class="btn2"
				onclick="javascript:location.href='<%=cp%>/shop/boards/list.do';"/>	
		</div>	
	
	</form>

</div>


	<jsp:include page="../main/footer.jsp"/>
</body>
</html>