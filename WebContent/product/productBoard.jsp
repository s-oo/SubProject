<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<div class="board">
	<div class="board_wrap">
		<!-- Review -->
		<div class="boardTitle">
			<div class="titleName" style="float: left; font-size: 10pt;">Review</div>
			<div class="titleButton" style="float: right; text-align: right;">
				<a href="">Write</a> <a href="" style="margin-left: 15px">View
					all</a>
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
					<th scope="col">NAME</th>
					<th scope="col">DATE</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="">
					<tr>
						<td colspan="5" class="empty">등록된 상품 후기가 없습니다.</td>
					</tr>
				</c:if>
				<tr style="margin: 10pt 0pt 10pt">
					<td>1</td>
					<!-- number -->
					<td>ANDREW COTTON SHIRT [SKY BLUE]</td>
					<!-- product -->
					<td>[기타]<!-- subject --> <a
						href="javascript:prdBoardView('review','311');"> <font
							onclick="rvQnaHit('review', '311');">보라돌이뚜비</font>
					</a> <img
						src="https://www.lememe.co.kr/_skin/lememe_220520/img/shop/i_new.gif"
						border="0" alt="최신">
					</td>
					<td>뚜비</td>
					<td>2022/08/04</td>
				</tr>
				<tr>
					<td colspan="5" class="qnarev_cnt">
						<div id="revContent311" style="display: block;">
							<div style="text-align: left; margin: 10pt 30pt 10pt;">
								<b>좋아요</b><br /> <b>ㅎㅎㅎ</b><br /> <b>!!!</b><br />
							</div>
							<div></div>
							<div></div>
							<div class="btn" align="right">
								<span class="box_btn w100 white"> <a
									href="javascript:editRev(311)">수정</a>
								</span> <span class="box_btn w100 white"> <a
									href="javascript:delRev(311)">삭제</a>
								</span>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- QnA -->
		<div class="boardTitle">
			<div class="titleName" style="float: left; font-size: 10pt;">Q&A</div>
			<div class="titleButton" style="float: right; text-align: right;">
				<a href="">Write</a> <a href="" style="margin-left: 15px">View
					all</a>
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
					<th scope="col">NAME</th>
					<th scope="col">DATE</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="">
					<tr>
						<td colspan="5" class="empty">등록된 상품 후기가 없습니다.</td>
					</tr>
				</c:if>
				<tr style="margin: 10pt 0pt 10pt">
					<td>1</td>
					<!-- number -->
					<td>ANDREW COTTON SHIRT [SKY BLUE]</td>
					<!-- product -->
					<td>[기타]<!-- subject --> <a
						href="javascript:prdBoardView('review','311');"> <font
							onclick="rvQnaHit('review', '311');">질문있어요</font>
					</a> <img
						src="https://www.lememe.co.kr/_skin/lememe_220520/img/shop/i_new.gif"
						border="0" alt="최신">
					</td>
					<td>뚜비</td>
					<td>2022/08/04</td>
				</tr>
				<tr>
					<td colspan="5" class="qnarev_cnt">
						<div id="revContent311" style="display: block;">
							<div style="text-align: left; margin: 10pt 30pt 10pt;">
								<b>언제 배송되나요</b><br /> <b>ㅎㅎㅎ</b><br /> <b>???</b><br />
							</div>
							<div></div>
							<div></div>
							<div class="btn" align="right">
								<span class="box_btn w100 white"> <a
									href="javascript:editRev(311)">수정</a>
								</span> <span class="box_btn w100 white"> <a
									href="javascript:delRev(311)">삭제</a>
								</span>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>