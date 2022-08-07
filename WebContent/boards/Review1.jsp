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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=cp%>/boards/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/boards/css/list.css"/>

<script type="text/javascript">
	function sendIt() {
		var f = document.searchForm;
		
		f.action = "<%=cp%>/shop/list.do"
		f.submit();
		
	}
</script>

</head>
<body bgcolor="blue">

<div id="header" class="txt">
	<div id="header_bg"></div>
	<div class="cboth">
		<div class="left_area">
			<a href="#none" id="cate_btn" class="on"><b>Review</b></a>
			<div id="cate_wrap" class="on">
				<div id="cate_inner" class="xans-element- xans-layout xans-layout-category">
					<a href="/sub/boards/list.jsp" class="xans-record-">Q/A</a><br/>
					<a href="/sub/boards/notice.jsp" class="xans-record-">NOTICE</a><br/>
				

				</div>
			</div>

	</div>
	</div>
	</div>
	<div id="bbsList">
	
	
	
	
	
		<div id="bbsList_title"><a> </a> 상품 REVIEW    </div>
			

			
			<div id="bbsList_header">
				<div id="leftHeader">
			
					<form action="" method="post" name="searchForm">
						<select name="searchKey" class="selectField">
							<option value="subject">제목</option>
							<option value="name">작성자</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="searchValue" class="textField"/>
						<input type="button" value=" 검 색 " class="btn2" onclick="sendIt()"/>
					</form>
				</div>
				<div id="rightHeader">
					<input type="button" value="글올리기" class="btn2" onclick="javascript:location.href='<%=cp%>/shop/write.do';">
				</div>
			</div>
	
		<div id="bbsList_list">
			<div id="title">
				<dl>
					<dt class="num">번호</dt>
					<dt class="subject">제목</dt>
					<dt class="name">작성자</dt>
					<dt class="created">작성일</dt>
					<dt class="hitCount">조회수</dt>
				</dl>
			</div>
			<div id="lists">
				<c:forEach var="dto" items="${lists }">
					<dl>
						<dd class="num">${dto.num }</dd>
						<dd class="subject">
							<a href="${articleUrl }&num=${dto.num }">${dto.subject }</a>
						</dd>
						<dd class="name">${dto.name }</dd>
						<dd class="created">${dto.created }</dd>
						<dd class="hitCount">${dto.hitCount }</dd>
					</dl>
				</c:forEach>
			</div>
			<div id="footer">
			
							<div>
<img src="./img/사진.jpg">
</div>
				<p>
					<c:if test="${dataCount != 0 }">
						${pageIndexList }
					</c:if>
					<c:if test="${dataCount == 0 }">
						등록된게시물이 없습니다.
					</c:if>
				</p>
			</div>
		</div>
	</div>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>