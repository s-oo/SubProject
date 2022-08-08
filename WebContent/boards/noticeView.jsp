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


			<div style="border: 1px solid #dfdfdf; padding: 30px"
				class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
				<!--
            $login_page_url = /member/login.html
            $deny_access_url = /board/free/list.html
        -->
				<div class="ec-base-table typeWrite ">
					<table border="0" summary="">
						<caption>게시판 상세</caption>
						<colgroup>
							<col style="width: 130px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<!--th scope="row">제목</th-->
								<td style="border: 0; font-size: 15px;">&lt; 배송 안내 &gt; <span
									class="writer"> 와우뷰 <span class="displaynone">(ip:)</span>
										<span><span class="writer">DATE <span>2020-04-26
													22:33:58</span>
										</span></span></span>
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
										<div class="fr-view fr-view-article">
											<p>
												<b style="font-size: 9pt; line-height: 1.5;"><span
													style="font-family: Verdana;"><span
														style="font-size: 12pt;">&lt; 배송 안내 &gt;</span></span></b>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">안녕하세요 WOWVIEW입니다.</span></span></strong>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">월-금 (공휴일 제외) 오후 1시 이전 결제
															완료건까지 확인하여 출고작업이 진행되며</span></span></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">배송기간은 상품에 따라 2-5일정도 소요됩니다.</span></span></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">(* 토, 일, 공휴일은 택배사의 휴무로 제품이
															발송되지 않습니다.)</span></span></strong>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">주문 상품은 순차적으로 발송됩니다.</span></span></strong>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">입고지연 상품 / 주문폭주 상품 등은 배송
															시일이 조금 지연될 수 있으니 양해 부탁드립니다.</span></span></strong>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">* 배송 방법 : 택배</span></span></strong>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">* 배송 지역 : 전국 지역 배송</span></span></strong>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">* 비용 : 주문금액 5만원 미만일 때 배송비
															2,500원이 추가됩니다.</span></span></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">&nbsp; &nbsp; &nbsp;
															&nbsp; &nbsp; &nbsp; (도서 산간 및 제주지방은 3,500원이 추가로 발생할 수
															있습니다.)</span></span></strong>
											</p>
											<p>
												<strong><br></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;"><br></span></span></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;"><br></span></span></strong>
											</p>
											<p>
												<strong><span style="font-family: Verdana;"><span
														style="font-size: 10pt;">감사합니다.</span></span></strong>
											</p>
										</div>
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