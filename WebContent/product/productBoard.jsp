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
				<col style="width: 5%;">
				<col style="width: 10%;">
				<col style="width: 5%;">
				<col style="width: 5%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">PRODUCT</th>
					<th scope="col">SUBJECT</th>
					<th scope="col">ID</th>
					<th scope="col">DATE</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty qnaList }">
						<tr>
							<td colspan="5" class="empty">등록된 상품 문의가 없습니다.</td>
						</tr>
				</c:if>
				<c:forEach var="qnaDTO" items="${qnaList }">
						<tr style="margin: 10pt 0pt 10pt;">
							<td>${qnaDTO.boardNum }</td>
							<td>${qnaDTO.productName }</td>
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
							<td colspan="5" class="qnarev_cnt">
								<div style="padding: 10px 0px 10px 0px;">
									${qnaDTO.content }
									<div align="right" onclick="qnaClick('${qnaDTO.boardNum }');">
										<a href="#none" >댓글${contentNum }</a>
									</div>
									<div class="btn" align="right">
										<c:if test="${qnaDTO.userId.equals(userId) || userId == 'KRISTAL' }">
											<span>
												<a href="<%=cp %>/shop/boards/qnaUpdate.do?boardNum=${qnaDTO.boardNum }&${params }';">EDIT</a>
											</span>
											<span>
												<a></a>
												<a href="<%=cp %>/shop/boards/qnaDelete_ok.do?boardNum=${qnaDTO.boardNum }&${params }';"
												onclick="if(!confirm('정말 삭제하시겠습니까??')){return false;}">DELETE</a>
											</span>
										</c:if>
									</div>
								</div>
							</td>
						</tr>
						<tr id="qnaComment${qnaDTO.boardNum }" style="display: none;">
						<td colspan="5" >
							<form action="" method="post" name="myForm">
								<c:if test="${empty qnaDTO.commentsDTO }">
									<div class="name" id="msg">
										<p>댓글이 존재하지 않습니다.</p>
									</div>
								</c:if>
								<c:if test="${!empty qnaDTO.commentsDTO }">
									<div class="name" id="textarea" >CONTENT
										<textarea name="content" style="width: 600px; height: 130px; resize: none; border-color: #dfdfdf;">${qnaDTO.commentsDTO.getContent() }</textarea>
									</div>
								</c:if>
								<c:if test="${userId == 'KRISTAL'}">
									<div class="elementRight">
										<c:if test="${empty qnaDTO.commentsDTO }">
											<a href="javascript:write()" class="element" id="write-bnt">WRITE</a>
											<a href="javascript:sendItWrite()" class="element" id="register-bnt1" style="display: none;">REGISTER</a>
											<a href="javascript:cancel1()" class="element" id="cancel-bnt1" style="display: none;">CANCEL</a>
										</c:if>
										<c:if test="${!empty qnaDTO.commentsDTO }">
											<a href="javascript:edit()" class="element" id="edit-bnt">EDIT</a>
											<a href="javascript:sendItEdit)" class="element" id="delete-bnt">DELETE</a>
											<a href="javascript:sendItDelete()" class="element" id="register-bnt2" style="display: none;">REGISTER</a>
											<a href="javascript:cancel2()" class="element" id="cancel-bnt2" style="display: none;">CANCEL</a>
										</c:if>
									</div>
								</c:if>
								<input type="hidden" name="boardNum" value="${qnaDTO.boardNum }"/>
								<input type="hidden" name="community" value="review"/>
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
				<col style="width: 5%;">
				<col style="width: 10%;">
				<col style="width: 5%;">
				<col style="width: 5%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">PRODUCT</th>
					<th scope="col">SUBJECT</th>
					<th scope="col">ID</th>
					<th scope="col">DATE</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty reviewList }">
					<tr>
						<td colspan="5" class="empty">등록된 상품 후기가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="reviewDTO" items="${reviewList }">
					<tr style="margin: 10pt 0pt 10pt;">
						<td>${reviewDTO.boardNum }</td>
						
						<%-- <td>
							<a href="<%=cp%>/shop/product/detail.do?productNum=${reviewDTO.ordersDTO.getProductNum() }">
								<img src="<%=cp %>/product/image/${reviewDTO.productCategory}/${reviewDTO.saveFileName[0]}" width="100px;" height="100px;" style="margin-bottom: 15px;">
							</a>
						</td> --%>
						
						<td>${reviewDTO.productName } [${reviewDTO.ordersDTO.getOrderColor() }/${reviewDTO.ordersDTO.getOrderSize() }]</td>
						<td>
							<a href="javascript:reviewView('${reviewDTO.boardNum }');">${reviewDTO.subject }</a> 
						<!-- <img src="https://www.lememe.co.kr/_skin/lememe_220520/img/shop/i_new.gif" border="0" alt="최신"> -->
						</td>
						<td>${reviewDTO.userId }</td>
						<td>${reviewDTO.postDate }</td>
					</tr>
					<tr id="reviewContent${reviewDTO.boardNum }" style="display: none;">
						<td colspan="5" class="qnarev_cnt">
							<div style="padding: 10px 0px 10px 0px;text-align: left;">
								${reviewDTO.content }
								<div align="right" onclick="reviewClick('${reviewDTO.boardNum }');">
									<a href="#none" >댓글${contentNum }</a>
								</div>
								<div class="btn" align="right">
									<c:if test="${reviewDTO.userId.equals(userId) || userId == 'KRISTAL' }">
										<span>
											<a href="<%=cp %>/shop/boards/reviewUpdate.do?boardNum=${reviewDTO.boardNum }&${params }';">EDIT</a>
										</span>
										<span>
											<a href="<%=cp %>/shop/boards/reviewDelete_ok.do?boardNum=${reviewDTO.boardNum }&${params }';"
											onclick="if(!confirm('정말 삭제하시겠습니까??')){return false;}">DELETE</a>
										</span>
									</c:if>
								</div>
							</div>
						</td>
					</tr>
					<tr id="reviewComment${reviewDTO.boardNum }" style="display: none;">
						<td colspan="5" >
							<form action="" method="post" name="myForm">
								<c:if test="${empty reviewDTO.commentsDTO }">
									<div class="name" id="msg">
										<p>댓글이 존재하지 않습니다.</p>
									</div>
								</c:if>
								<c:if test="${!empty reviewDTO.commentsDTO }">
									<div class="name" id="textarea" style="display: none;">CONTENT
										<textarea name="content" style="width: 600px; height: 130px; resize: none; border-color: #dfdfdf;">${commentsDTO.content }</textarea>
									</div>
								</c:if>
								<c:if test="${userId == 'KRISTAL'}">
									<div class="elementRight">
										<c:if test="${empty reviewDTO.commentsDTO }">
											<a href="javascript:write()" class="element" id="write-bnt">WRITE</a>
											<a href="javascript:sendItWrite()" class="element" id="register-bnt1" style="display: none;">REGISTER</a>
											<a href="javascript:cancel1()" class="element" id="cancel-bnt1" style="display: none;">CANCEL</a>
										</c:if>
										<c:if test="${!empty reviewDTO.commentsDTO }">
											<a href="javascript:edit()" class="element" id="edit-bnt">EDIT</a>
											<a href="javascript:sendItEdit)" class="element" id="delete-bnt">DELETE</a>
											<a href="javascript:sendItDelete()" class="element" id="register-bnt2" style="display: none;">REGISTER</a>
											<a href="javascript:cancel2()" class="element" id="cancel-bnt2" style="display: none;">CANCEL</a>
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


<script type="text/javascript">
	function write() {
		document.getElementById('msg').style.display = "none";
		document.getElementById('textarea').style.display = "inline-block";
		document.getElementById('write-bnt').style.display = "none";
		document.getElementById('register-bnt1').style.display = "inline-block";
		document.getElementById('cancel-bnt1').style.display = "inline-block";
	}
	function cancel1() {
		document.getElementById('msg').style.display = "inline-block";
		document.getElementById('textarea').style.display = "none";
		document.getElementById('write-bnt').style.display = "inline-block";
		document.getElementById('register-bnt1').style.display = "none";
		document.getElementById('cancel-bnt1').style.display = "none";
	}
	function edit() {
		document.getElementById('msg').style.display = "none";
		document.getElementById('textarea').style.display = "inline-block";
		document.getElementById('edit-bnt').style.display = "none";
		document.getElementById('delete-bnt').style.display = "none";
		document.getElementById('register-bnt2').style.display = "inline-block";
		document.getElementById('cancel-bnt2').style.display = "inline-block";
	}
	function cancel2() {
		document.getElementById('msg').style.display = "inline-block";
		document.getElementById('textarea').style.display = "none";
		document.getElementById('edit-bnt').style.display = "inline-block";
		document.getElementById('delete-bnt').style.display = "inline-block";
		document.getElementById('register-bnt2').style.display = "none";
		document.getElementById('cancel-bnt2').style.display = "none";
	}
	function sendItWrite() {
		var f = document.myForm;
		f.action="<%=cp %>/shop/comments/write_ok.do";
		f.submit();
	}
	function sendItEdit() {
		var f = document.myForm;
		f.action="<%=cp %>/shop/comments/upadte_ok.do";
		f.submit();
	}
	function sendItDelete() {
		var f = document.myForm;
		f.action="<%=cp %>/shop/comments/delete_ok.do";
		f.submit();
	}
</script>

</html>