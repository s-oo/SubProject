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

<link rel="stylesheet" type="text/css"href="<%=cp%>/css/shopStyle.css" />
<link rel="stylesheet" type="text/css"href="<%=cp%>/boards/css/listStyle.css" />

<script type="text/javascript">
	function sendIt() {
		var f = document.searchForm;
		
		f.action = "<%=cp%>/shop/boards/list.do"
		f.submit();

	}
</script>

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
		<div id="content" align="center">
			<table id="communityList" class="listTable">
				<colgroup>
					<col width="100px">
					<col width="350px">
					<col width="150px">
					<col width="150px">
					<col width="100px">
				</colgroup>

				<thead>
					<tr>
						<th>NO.</th>
						<th>
							<c:if test="${community == 'QnA' }">
								subject
							</c:if>
							<c:if test="${community == 'notice' || community == 'review' }">
								productName
							</c:if>
						</th>
						<th>userId</th>
						<th>postDate</th>
						<th>hitCount</th>
					</tr>
				</thead>
				<tbody>
					<tr><th colspan="5" bgcolor="#999999"></th></tr>
					
					<c:if test="${!empty lists }">
						<c:forEach var="dto" items="${lists }">
							<tr align="center">
								<td id="boardNum">
									<a href="<%=cp%>/shop/boards/article?boardNum=${dto.boardNum }">
										${dto.boardNum }
									</a>
								</td>
								<c:if test="${community == 'QnA' }">
									<td id="subject">
										<a href="<%=cp%>/shop/boards/article?boardNum=${dto.boardNum }">
											${dto.subject }
										</a>
									</td>
								</c:if>
								<c:if test="${community == 'notice' || community == 'review'}">
									<td id="productName">
										<a href="<%=cp%>/shop/boards/article?boardNum=${dto.boardNum }">
											dto.productName
										</a>
									</td>
								</c:if>
								<td id="userId">
									${dto.userId }
								</td>
								<td id="postDate">
									${dto.postDate }
								</td>
								<td id="hitCount">
									${dto.hitCount }
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				<tfoot>
					<c:if test="${empty lists }">
						<tr>
							<td colspan="5" align="center" height="100px;">
								등록된 게시물이 없음
							</td>
						</tr>
						<tr><th colspan="5" bgcolor="#999999"></th></tr>
					</c:if>
				</tfoot>
			</table>
			
		</div>
	<jsp:include page="../main/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>