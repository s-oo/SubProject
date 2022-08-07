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
<link rel="stylesheet" type="text/css"href="<%=cp%>/boards/css/writeStyle.css" />

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
		<div id="content" align="center">
			<div style="display: inline-block; margin: auto;" align="left">
				<div class="box row" style="width: 700px; border-top: 1px solid #DBDBDB;">
					<c:if test="${empty productNum }">
						<img alt="noimage" src="<%=cp %>/boards/img/noimage.png" style="margin: 10px; display: inline;">
						<div class="box">
							<div style="border: 1px solid; width: 100px; padding: 5px;">
								<a href="javascript:window.open('<%=cp %>/shop/boards/searchList.do','상품정보 선택','width=500, height=500, status=yes, top=100, left=100')">상품정보 선택</a>
							</div>
						</div>
					</c:if>
					<c:if test="${!empty productNum }">
						<a href="<%=cp %>/shop/product/detail.do?productNum=${ordersDTO.productNum }">
							<img src="<%=cp %>/product/image/top/${ordersDTO.saveFileName[0] }" style="margin: 10px; display: inline;">
						</a>
						<div class="box">
							<div class="box text">${ordersDTO.productName }</div>
							<div class="box text">${ordersDTO.productPrice } ${ordersDTO.productName }</div>
							<div class="box text">[옵션 : ordersDTO.orderColor/ordersDTO.orderSize]</div>
							<div style="border: 1px solid; width: 100px; padding: 5px;">
								<a href="<%=cp %>/shop/product/detail.do?productNum=${ordersDTO.productNum }">상품정보 보기</a>
							</div>
							<div style="border: 1px solid; width: 100px; padding: 5px;">
								<a href="javascript:window.open('<%=cp %>/shop/boards/searchList.do','상품정보 선택','width=500, height=500, status=yes, top=100, left=100')">상품정보 선택</a>
							</div>
						</div>
					</c:if>
				</div>
				<div class="box row">
					<div class="box label"><label for="subject">SUBJECT</label></div>
					<div class="box input"><input type="text" name="subject"></div>
				</div>
				<div class="box row">
					<div class="box label"><label for="userId">ID</label></div>
					<div class="box input"><input type="text" name="userId"></div>
				</div>
				<div class="box row">
					<label for="userId">CONTENT</label><br/>
					<div class="box input">
						<textarea rows="" cols=""></textarea>
					</div>
				</div>
				
			</div>
		</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>