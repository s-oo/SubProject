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
<title>NOTICE VIEW</title>

<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/boards/css/view.css"/>
<script type="text/javascript">

	function sendIt() {
		var f = document.searchForm;
		
		f.action = "<%=cp %>/shop/boards/noticeView.do";
		f.submit();
	}

</script>
</head>
<body>

<jsp:include page="../main/header.jsp"/>

<div id="content" align="center">
	<!-- board -->
	<div class="boardList">
		<!-- title -->
		<div class="boardTitle" align="center">NOTICE</div>
		<%-- <!-- content -->
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
					<th scope="col">HITS</th>
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
						<td>${dto.rnum }</td>
						<!-- SUBJECT -->
						<td>
						<a href="${viewUrl }&boardNum=${dto.boardNum}">${dto.subject }</a>
						</td>
						<!-- ID -->
						<td>${dto.userId }</td>
						<td>${dto.postDate }</td>
						<td>${dto.hits }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table> --%>


		<div class="boardContent" align="center">
			<div class="">
				<table border="0">
					<colgroup>
						<col style="width: 130px;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr class="viewTitle">
							<td colspan="3">
								<!-- SUBJECT -->
								<div class="name">SUBJECT
									<p>${dto.subject }</p>
								</div>
								<!-- userID -->
								<div class="name">ID
									<p>${dto.userId }</p>
								</div>
								<!-- POSTDATE -->
								<div class="name">DATE
									<p>${dto.postDate }</p>
								</div>
							</td>
						</tr>
						<tr class="viewContents">
							<td colspan="3">
								<div class="">
									<!-- CONTENT -->
									<div class="viewContent">${dto.content }</div>
								</div>
							</td>
						</tr>
						<!-- <tr class="attach displaynone">
							<th scope="row">첨부파일</th>
							<td></td>
						</tr> -->
						<!-- <tr class="displaynone ">
							<th scope="row">비밀번호</th>
							<td><input id="password" name="password"
								onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }"
								value="" type="password">
								<span class="">수정 및 삭제하려면 비밀번호를 입력하세요.</span></td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="button">
				<div class="element">
						<a href="<%=cp %>/shop/boards/notice.do">LIST</a>
					<c:if test="${dto.userId == userId }">
						<a href="<%=cp %>/shop/boards/noticeUpdate.do?boardNum=${dto.boardNum }&${params }';"
						class="displaynone">EDIT</a>
						<a href="<%=cp %>/shop/boards/noticeDelete_ok.do?boardNum=${dto.boardNum }&${params }';"
						class="displaynone">DELETE</a>
					</c:if>
						<a href="/board/product/reply.html" class="displaynone">COMMENT</a>
				</div>
			</div>
		</div>

	</div>
</div>

<jsp:include page="../main/footer.jsp"/>

</body>
</html>