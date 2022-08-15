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
<title>Insert title here</title>

<script type="text/javascript" src="<%=cp%>/product/script.js"></script>

</head>
<body>

<div class="board">
	<div class="board_wrap">
	<br>
		<!-- QnA -->
		<div class="boardTitle">
			<div class="titleName" style="float: left; font-size: 10pt;">Q&A</div>
			<div class="titleButton" style="float: right; text-align: right;">
				<a href="<%=cp%>/shop/boards/qnaWrite.do">Write</a>
				<a href="<%=cp%>/shop/boards/qna.do" style="margin-left: 15px">View all</a>
			</div>
		</div>

		<table class="boardContent">
			<colgroup>
				<col style="width: 5%;">
				<col style="width: 20%;">
				<col style="width: 5%;">
				<col style="width: 5%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">SUBJECT</th>
					<th scope="col">ID</th>
					<th scope="col">DATE</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty qnaList }">
					<tr>
						<td colspan="4" class="empty">등록된 상품 문의가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="qnaDTO" items="${qnaList }">
					<tr style="margin: 10pt 0pt 10pt;">
						<td>${qnaDTO.rnum }</td>
						<td>
							<div onclick="qnaView('${qnaDTO.boardNum }');">
								<a href="#none">${qnaDTO.subject }</a>
								<%-- <a href="javascript:qnaView('${qnaDTO.boardNum }');">${qnaDTO.subject }</a> --%>
							</div>
						<!-- <img src="https://www.lememe.co.kr/_skin/lememe_220520/img/shop/i_new.gif" border="0" alt="최신"> -->
						</td>
						<td>${qnaDTO.userId }</td>
						<td>${qnaDTO.postDate }</td>
					</tr>
					<tr id="qnaContent${qnaDTO.boardNum }" style="display: none;">
						<td colspan="4" class="qnarev_cnt">
							<div style="padding: 10px 10px 10px 10px;text-align: left;min-height: 50px;">
								${qnaDTO.content }
								<div class="btn">
									<%-- <c:if test="${qnaDTO.userId.equals(userId) || userId == 'KRISTAL' }"> --%>
									<span>
										<a href="<%=cp %>/shop/boards/qnaUpdate.do?boardNum=${qnaDTO.boardNum }&${params }';">EDIT</a>
									</span>
									<span>
										<a></a>
										<a href="<%=cp %>/shop/boards/qnaDelete_ok.do?boardNum=${qnaDTO.boardNum }&${params }';"
										onclick="if(!confirm('정말 삭제하시겠습니까?')){return false;}">DELETE</a>
									</span>
									<%-- </c:if> --%>
								</div>
								<div class="boardComment" onclick="qnaClick('${qnaDTO.boardNum }');">
									<a href="#none" >COMMENT
									<c:if test="${empty qnaDTO.commentsDTO }">0</c:if>
									<c:if test="${!empty qnaDTO.commentsDTO }">1</c:if>
									</a>
								</div>
							</div>
						</td>
					</tr>
					<tr id="qnaComment${qnaDTO.boardNum }" style="display: none;">
						<td colspan="4" >
							<form action="" method="post" name="qnaForm">
								<!-- 댓글 존재X -->
								<c:if test="${empty qnaDTO.commentsDTO }">
									<div class="name" id="msgQna${qnaDTO.boardNum }">
										<p>댓글이 존재하지 않습니다.</p>
									</div>
								</c:if>
								<!-- 댓글 존재 -->
								<c:if test="${!empty qnaDTO.commentsDTO }">
								<div class="commentContent">
									<div class="name">
										<p>${qnaDTO.commentsDTO.userId } | ${qnaDTO.commentsDTO.postDate }</p>
									</div>
									<div class="name"><!--  -->
										<textarea id="textareaResultQna${qnaDTO.boardNum }" readonly="readonly"
										style="resize: none;border: none;outline: none;">${qnaDTO.commentsDTO.getContent() }</textarea>
									</div>
								</div>
								</c:if>
								<!-- 관리자 댓글 권한 -->
								<c:if test="${userId == 'KRISTAL'}">
									<div class="name" id="textareaQna${qnaDTO.boardNum }" style="display: none;">COMMENT
										<textarea id="textContentQna${qnaDTO.boardNum }" name="content" style="width: 600px; height: 130px; resize: none; border-color: #dfdfdf;">${qnaDTO.commentsDTO.content }</textarea>
									</div>
									<div class="elementRight">
										<c:if test="${empty qnaDTO.commentsDTO }">
											<a href="javascript:writeQna(${qnaDTO.boardNum })" class="element" id="write-bntQna${qnaDTO.boardNum }">WRITE</a>
											<a href="javascript:sendItWriteQna(${qnaList.size()-qnaDTO.rnum })" class="element" id="register-bnt1Qna${qnaDTO.boardNum }" style="display: none;">REGISTER</a>
											<a href="javascript:cancel1Qna(${qnaDTO.boardNum } )" class="element" id="cancel-bnt1Qna${qnaDTO.boardNum }" style="display: none;">CANCEL</a>
										</c:if>
										<c:if test="${!empty qnaDTO.commentsDTO }">
											<a href="javascript:editQna(${qnaDTO.boardNum })" class="element" id="edit-bntQna${qnaDTO.boardNum }">EDIT</a>
											<a href="javascript:sendItDeleteQna(${qnaList.size()-qnaDTO.rnum })" class="element" id="delete-bntQna${qnaDTO.boardNum }"
											onclick="if(!confirm('정말 삭제하시겠습니까?')){return false;}">DELETE</a>
											<a href="javascript:sendItEditQna(${qnaList.size()-qnaDTO.rnum })" class="element" id="register-bnt2Qna${qnaDTO.boardNum }" style="display: none;">REGISTER</a>
											<a href="javascript:cancel2Qna(${qnaDTO.boardNum })" class="element" id="cancel-bnt2Qna${qnaDTO.boardNum }" style="display: none;">CANCEL</a>
										</c:if>
									</div>
								</c:if>
								<input type="hidden" name="boardNum" value="${qnaDTO.boardNum }"/>
								<input type="hidden" name="community" value="qna"/>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table><br><br>
		
		<!-- Review -->
		<div class="boardTitle">
			<div class="titleName" style="float: left; font-size: 10pt;">Review</div>
			<div class="titleButton" style="float: right; text-align: right;">
				<a href="<%=cp%>/shop/boards/reviewWrite.do">Write</a>
				<a href="<%=cp%>/shop/boards/review.do" style="margin-left: 15px">View all</a>
			</div>
		</div>
		
		<table class="boardContent">
			<colgroup>
				<col style="width: 5%;">
				<col style="width: 20%;">
				<col style="width: 5%;">
				<col style="width: 5%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">SUBJECT</th>
					<th scope="col">ID</th>
					<th scope="col">DATE</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty reviewList }">
					<tr>
						<td colspan="4" class="empty">등록된 상품 후기가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="reviewDTO" items="${reviewList }">
					<tr style="margin: 10pt 0pt 10pt;">
						<td>${reviewDTO.rnum }</td>
						<td>
							<div onclick="reviewView('${reviewDTO.boardNum }');">
								<a href="#none">${reviewDTO.subject }</a>
							</div>
						</td>
						<td>${reviewDTO.userId }</td>
						<td>${reviewDTO.postDate }</td>
					</tr>
					<tr id="reviewContent${reviewDTO.boardNum }" style="display: none;">
						<td colspan="4" class="qnarev_cnt">
							<div style="padding: 10px 10px 10px 0px;text-align: left;min-height: 50px;">
								<span>${reviewDTO.content }</span>
								<span>${reviewDTO.productName } [${reviewDTO.ordersDTO.getOrderColor() }/${reviewDTO.ordersDTO.getOrderSize() }]</span>
								<div class="btn">
									<span>
										<a href="<%=cp %>/shop/boards/reviewUpdate.do?boardNum=${reviewDTO.boardNum }&${params }';">EDIT</a>
									</span>
									<span>
										<a></a>
										<a href="<%=cp %>/shop/boards/reviewDelete_ok.do?boardNum=${reviewDTO.boardNum }&${params }';"
										onclick="if(!confirm('정말 삭제하시겠습니까?')){return false;}">DELETE</a>
									</span>
								</div>								
								<div class="boardComment" onclick="reviewClick('${reviewDTO.boardNum }');">
									<a href="#none" >COMMENT
									<c:if test="${empty reviewDTO.commentsDTO }">0</c:if>
									<c:if test="${!empty reviewDTO.commentsDTO }">1</c:if>
									</a>
								</div>
							</div>
						</td>
					</tr>
					<tr id="reviewComment${reviewDTO.boardNum }" style="display: none;">
						<td colspan="4" >
							<form action="" method="post" name="reviewForm">
								<!-- 댓글 존재X -->
								<c:if test="${empty reviewDTO.commentsDTO }">
									<div class="name" id="msgReview${reviewDTO.boardNum }">
										<p>댓글이 존재하지 않습니다.</p>
									</div>
								</c:if>
								<!-- 댓글 존재 -->
								<c:if test="${!empty reviewDTO.commentsDTO }">
								<div class="commentContent">
									<div class="name">
										<p>${reviewDTO.commentsDTO.userId } | ${reviewDTO.commentsDTO.postDate }</p>
									</div>
									<div class="name">
										<textarea id="textareaResultReview${reviewDTO.boardNum }" readonly="readonly"
										style="resize: none;border: none;outline: none;">${reviewDTO.commentsDTO.getContent() }</textarea>
									</div>
								</div>
								</c:if>
								<!-- 관리자 댓글 권한 -->
								<c:if test="${userId == 'KRISTAL'}">
									<div class="name" id="textareaReview${reviewDTO.boardNum }" style="display: none;">COMMENT
										<textarea id="textContentReview${reviewDTO.boardNum }" name="content" style="width: 600px; height: 130px; resize: none; border-color: #dfdfdf;">${reviewDTO.commentsDTO.content }</textarea>
									</div>
									<div class="elementRight">
										<c:if test="${empty reviewDTO.commentsDTO }">
											<a href="javascript:writeReview(${reviewDTO.boardNum })" class="element" id="write-bntReview${reviewDTO.boardNum }">WRITE</a>
											<a href="javascript:sendItWriteReview(${reviewList.size()-reviewDTO.rnum })" class="element" id="register-bnt1Review${reviewDTO.boardNum }" style="display: none;">REGISTER</a>
											<a href="javascript:cancel1Review(${reviewDTO.boardNum } )" class="element" id="cancel-bnt1Review${reviewDTO.boardNum }" style="display: none;">CANCEL</a>
										</c:if>
										<c:if test="${!empty reviewDTO.commentsDTO }">
											<a href="javascript:editReview(${reviewDTO.boardNum })" class="element" id="edit-bntReview${reviewDTO.boardNum }">EDIT</a>
											<a href="javascript:sendItDeleteReview(${reviewList.size()-reviewDTO.rnum })" class="element" id="delete-bntReview${reviewDTO.boardNum }"
											onclick="if(!confirm('정말 삭제하시겠습니까?')){return false;}">DELETE</a>
											<a href="javascript:sendItEditReview(${reviewList.size()-reviewDTO.rnum })" class="element" id="register-bnt2Review${reviewDTO.boardNum }" style="display: none;">REGISTER</a>
											<a href="javascript:cancel2Review(${reviewDTO.boardNum })" class="element" id="cancel-bnt2Review${reviewDTO.boardNum }" style="display: none;">CANCEL</a>
										</c:if>
									</div>
								</c:if>
								<input type="hidden" name="boardNum" value="${reviewDTO.boardNum }"/>
								<input type="hidden" name="community" value="review"/>
							</form>
						</td>
					</tr>					
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>

</html>