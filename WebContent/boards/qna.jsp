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
<title>Q&A</title>
</head>

<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/boards/css/list.css"/>
<script type="text/javascript">

	function sendIt() {
		var f = document.searchForm;
		
		f.action = "<%=cp %>/shop/boards/qna.do";
		f.submit();
	}

</script>

<body>

<jsp:include page="../main/header.jsp"/>

<div id="content" align="center">
	<!-- board -->
	<div class="boardList">
		<!-- title -->
		<div class="boardTitle" align="center">Q&A</div>
		<!-- content -->
		<table class="boardContent">
			<colgroup>
				<col style="width: 80px;">
				<col style="width: auto;">
				<col style="width: 100px;">
				<col style="width: 100px;">
				<col style="width: 80px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">SUBJECT</th>
					<th scope="col">ID</th>
					<th scope="col">DATE</th>
					<th scope="col">COMMENT</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="">
					<tr>
						<td colspan="5" class="empty">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${lists }">
					<tr>
						<!-- NO -->
						<td>${dto.boardNum }</td>
						<!-- SUBJECT -->
						<td>
						 <a href="${viewUrl }&boardNum=${dto.boardNum}">${dto.subject }</a>
						<%-- <a href="${viewUrl }&boardNum=${dto.boardNum}&productNum=${dto.productNum }">${dto.subject }</a> --%>
						</td>
						<!-- ID -->
						<td>${dto.userId }</td>
						<td>${dto.postDate }</td>
						<td>
							<c:if test="${empty dto.commentsDTO }">
								답변 예정
							</c:if>
							<c:if test="${!empty dto.commentsDTO }">
								답변 완료
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
		<!-- paging -->
		<div id="paging">
			<p>
				<c:if test="${dataCount!=0 }">${pageIndexList }</c:if>
			</p>
		</div>
		
		<!-- search -->
		<div id="sub_wrap">
			<div id="sub">
				<form action="" method="post" name="searchForm">
					<div class="search">
						<fieldset>
							<select name="searchKey" class="selectField">
								<option value="subject">SUBJECT</option>
								<option value="userId">ID</option>
								<option value="content">CONTENT</option>
								<option value="productNum">PRODUCTNUM</option>
							</select>
							<input type="text" name="searchValue" class="textField">
							<input type="button" value="SEARCH" class="button" onclick="sendIt();"/>
						</fieldset>
					</div>
				</form>
			</div>			
		</div>
		
		<div class="elementRight" style="float: right;">
			<a href="<%=cp %>/shop/boards/qnaWrite.do"
			class="element">WRITE</a>
		</div>
	</div>
</div>

<jsp:include page="../main/footer.jsp"/>

</body>
</html>