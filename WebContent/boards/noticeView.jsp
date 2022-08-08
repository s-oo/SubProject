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
<link rel="stylesheet" type="text/css" href="<%=cp %>/boards/css/list.css"/>
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


			<div style="border: 1px solid #dfdfdf; padding: 30px" class="">
				<div class="">
					<table border="0" summary="">
						<colgroup>
							<col style="width: 130px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<c:forEach var="dto" items="${lists }">
								<tr>
									<!-- SUBJECT -->
									<td style="border: 0; font-size: 15px;">&lt; ${dto.subject } &gt;
									<!-- userID -->
									<span class="writer">${dto.userId }
										<span>
											<!-- POSTDATE -->
											<span class="writer">DATE
												<span>${dto.postDate }</span>
											</span>
										</span>
									</span>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<ul class="etcArea">
											<li class="displaynone"><strong>평점</strong> <img
												src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif"
												alt="0점"> &nbsp;</li>
											<li class="displaynone"><strong>추천</strong> <span
												class="txtNum"><a href="#none"
													onclick="BOARD_READ.article_vote('/exec/front/Board/vote/1?no=7&amp;return_url=%2Farticle%2Fnotice%2F1%2F7%2F&amp;e2d2a63aa7b718a384e=f342c0d4e2adcf3567eae96cf9cc3650&amp;board_no=1');">
														<img
														src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_recommend.gif"
														alt="추천하기">
												</a></span></li>
										</ul>
										<div class="detail">
											<!-- CONTENT -->
											<div class="fr-view fr-view-article">${dto.content }</div>
										</div>
									</td>
								</tr>
								<tr class="attach displaynone">
									<th scope="row">첨부파일</th>
									<td></td>
								</tr>
								<tr class="displaynone ">
									<th scope="row">비밀번호</th>
									<td><input id="password" name="password" fw-filter=""
										fw-label="비밀번호" fw-msg=""
										onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }"
										value="" type="password"> <span
										class="ec-base-help txtInfo">수정 및 삭제하려면 비밀번호를 입력하세요.</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="ec-base-button ">
					<span class="gLeft"> <span class="displaynone"> <!--div class="borad_button_s"><a href="#none" onclick="" class="admin displaynone">관리자게시</a></div-->
							<div class="artfinger_button_board_list">
								<a href="#none" onclick="" class="admin displaynone">게시안함</a>
							</div>
							<div class="artfinger_button_board_list">
								<a href="#none" onclick="">스팸신고</a>
							</div>
							<div class="artfinger_button_board_list">
								<a href="#none" onclick="">스팸해제</a>
							</div>
					</span>
						<div class="artfinger_button_board_list">
							<a href="/board/notice/1/">목록</a>
						</div>
					</span> <span class="gRight">
						<div class="artfinger_button_board_list">
							<a href="#none"
								onclick="BOARD_READ.article_delete('BoardDelForm','1');"
								class="displaynone">삭제</a>
						</div>
						<div class="artfinger_button_board_enter">
							<a
								href="/board/product/modify.html?board_act=edit&amp;no=7&amp;board_no=1"
								class="displaynone">수정</a>
						</div>
						<div class="artfinger_button_board_list">
							<a href="/board/product/reply.html" class="displaynone">답변</a>
						</div>
					</span>
				</div>
			</div>

		</div>
</div>

<jsp:include page="../main/footer.jsp"/>

</body>
</html>