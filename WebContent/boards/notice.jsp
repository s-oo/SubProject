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
<title>NOTICE</title>

<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/boards/css/list.css"/>


</head>
<body>

<jsp:include page="../main/header.jsp"/>

<div id="content" align="center">
	<div class="boardList">
		<!-- title -->
		<div class="boardTitle" align="center">NOTICE</div>
		<!-- content -->
		<table class="boardContent">
			<colgroup>
				<col style="width: 170px;">
				<col style="width: auto;">
				<col style="width: 184px;">
				<col style="width: 177px;">
				<col style="width: 155px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">SUBJECT</th>
					<th scope="col">ID</th>
					<th scope="col">DATE</th>
					<th scope="col">HITS</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="">
					<tr>
						<td colspan="5" class="empty">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<tr style="margin: 10pt 0pt 10pt">
					<!-- NO -->
					<td>${dto.boardNum }</td>
					<!-- SUBJECT -->
					<td>${dto.subject }</td>
					<!-- ID -->
					<td>${dto.userId }</td>
					<td>${dto.postDate }</td>
					<td>${dto.hits }</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="../main/footer.jsp"/>

</body>
</html>