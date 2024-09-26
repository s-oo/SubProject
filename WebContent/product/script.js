var productPrice;
var orderQuantity;

function initial() {
	document.getElementById("optionSize").style.display = "none";
	document.getElementById("amount").style.display = "none";
	
	productPrice = document.detailForm.productPrice.value;
	orderQuantity = document.detailForm.orderQuantity.value;
	document.detailForm.sum.value = productPrice;
}

function select(option) {
    
   if(option=="case1"){
	   
	   document.getElementById("optionSize").style.display = "";
	   document.getElementById("orderColor").value = document.getElementById("option1").value;
	   
   }
   if(option=="case2"){
	   
	   document.getElementById("selectedOptions").style.display = "block";
	   document.getElementById("orderSize").value = document.getElementById("option2").value;
	   
	   document.getElementById("amount").style.display = "block";
	   amount.value = '(' + 1 + '개)';
	   totalPrice.value = productPrice + ' KRW';
   }
}

function count(type) {
	
	if(type === 'plus'){
		orderQuantity = document.detailForm.orderQuantity;
		sum = document.detailForm.sum;
		
		orderQuantity.value ++;
		sum.value = parseInt(orderQuantity.value) * productPrice;
		
		amount.value = '(' + orderQuantity.value  + '개)';
		totalPrice.value = sum.value + ' KRW';
	}
	if(type === 'minus'){
		orderQuantity = document.detailForm.orderQuantity;
		sum = document.detailForm.sum;

		if (orderQuantity.value>1) {
			orderQuantity.value --;
			sum.value = parseInt(orderQuantity.value) * productPrice;
			
			amount.value = '(' +orderQuantity.value + '개)';
			totalPrice.value = sum.value + ' KRW';
		}
		if (orderQuantity.value<0) {
			orderQuantity.value=0;
			
			amount.value=orderQuantity.value;
		}
	}
	if(type === 'delete'){
		document.getElementById("selectedOptions").style.display = "none";
		document.getElementById("optionSize").style.display = "none";
	  		  
		document.getElementById("option1").options[0].selected = "true";
		document.getElementById("option2").options[0].selected = "true";
		
		orderQuantity.value = 1;
		sum.value = productPrice;
		
		totalPrice.value = 0;
		amount.value = 0;
		document.getElementById("amount").style.display = "none";
		
  }
}
function printName()  {
	  const name = document.getElementById('name').value;
	  document.getElementById("result").innerText = name;
	}

function qnaView(boardnum) {
	if (document.getElementById("qnaContent" + boardnum).style.display != "none"){
		document.getElementById("qnaContent" + boardnum).style.display = "none";
		document.getElementById("qnaComment" + boardnum).style.display = "none";
	}
	else if (document.getElementById("qnaContent" + boardnum).style.display == "none")
		document.getElementById("qnaContent" + boardnum).style.display = "table-row";
}

function reviewView(boardnum) {
	
	/*var contents = document.getElementById("reviewContent" + boardnum);
	
	for(var i=0;i<contents.length;i++){
		contents[i].style.display = 'none';
	}
	
	var contentsShow = element.id.replace(/(\d)/g, '-$1');
    document.getElementById(contentsShow).style.display = 'block';*/
	
	if (document.getElementById("reviewContent" + boardnum).style.display != "none"){
		document.getElementById("reviewContent" + boardnum).style.display = "none";
		document.getElementById("reviewComment" + boardnum).style.display = "none";
	}
	
	else if (document.getElementById("reviewContent" + boardnum).style.display == "none"){
		document.getElementById("reviewContent" + boardnum).style.display = "table-row";
		
		
	/*if (!((document.getElementById("reviewContent" + boardnum)).contains(target)))
		document.getElementById("reviewContent" + boardnum).style.display = "none";*/
	}
	
}

function qnaClick(boardnum) {
	if (document.getElementById("qnaComment" + boardnum).style.display != "none")
		document.getElementById("qnaComment" + boardnum).style.display = "none";
	
	else if (document.getElementById("qnaComment" + boardnum).style.display == "none")
		document.getElementById("qnaComment" + boardnum).style.display = "table-row";
	
}

function reviewClick(boardnum) {
	if (document.getElementById("reviewComment" + boardnum).style.display != "none")
		document.getElementById("reviewComment" + boardnum).style.display = "none";
	
	else if (document.getElementById("reviewComment" + boardnum).style.display == "none")
		document.getElementById("reviewComment" + boardnum).style.display = "table-row";
	
}


//Comment of Q&A
function writeQna(boardnum) {
	document.getElementById('msgQna'+ boardnum).style.display = "none";
	document.getElementById('textareaQna'+ boardnum).style.display = "inline-block";
	document.getElementById('write-bntQna'+ boardnum).style.display = "none";
	document.getElementById('register-bnt1Qna'+ boardnum).style.display = "inline-block";
	document.getElementById('cancel-bnt1Qna'+ boardnum).style.display = "inline-block";
}
function cancel1Qna(boardnum) {
	document.getElementById('msgQna'+ boardnum).style.display = "inline-block";
	document.getElementById('textareaQna'+ boardnum).style.display = "none";
	document.getElementById('write-bntQna'+ boardnum).style.display = "inline-block";
	document.getElementById('register-bnt1Qna'+ boardnum).style.display = "none";
	document.getElementById('cancel-bnt1Qna'+ boardnum).style.display = "none";
	document.getElementById('textContentQna'+ boardnum).value="";
}
function editQna(boardnum) {
	document.getElementById('textareaResultQna'+ boardnum).style.display = "none";
	document.getElementById('textareaQna'+ boardnum).style.display = "inline-block";
	document.getElementById('edit-bntQna'+ boardnum).style.display = "none";
	document.getElementById('delete-bntQna'+ boardnum).style.display = "none";
	document.getElementById('register-bnt2Qna'+ boardnum).style.display = "inline-block";
	document.getElementById('cancel-bnt2Qna'+ boardnum).style.display = "inline-block";
}
function cancel2Qna(boardnum) {
	document.getElementById('textareaResultQna'+ boardnum).style.display = "inline-block";
	document.getElementById('textareaQna'+ boardnum).style.display = "none";
	document.getElementById('edit-bntQna'+ boardnum).style.display = "inline-block";
	document.getElementById('delete-bntQna'+ boardnum).style.display = "inline-block";
	document.getElementById('register-bnt2Qna'+ boardnum).style.display = "none";
	document.getElementById('cancel-bnt2Qna'+ boardnum).style.display = "none";
	document.getElementById('textContentQna'+ boardnum).value=document.getElementById('textareaResultQna'+ boardnum).value
}
function sendItWriteQna(num) {
	var f = document.qnaForm[num];
	f.action="/sub/shop/comments/write_ok.do";
	f.submit();
}
function sendItEditQna(num) {
	var f = document.qnaForm[num];
	f.action="/sub/shop/comments/update_ok.do";
	f.submit();
}
function sendItDeleteQna(num) {
	var f = document.qnaForm[num];
	f.action="/sub/shop/comments/delete_ok.do";
	f.submit();
}

//Comment of Review
function writeReview(boardnum) {
	document.getElementById('msgReview'+ boardnum).style.display = "none";
	document.getElementById('textareaReview'+ boardnum).style.display = "inline-block";
	document.getElementById('write-bntReview'+ boardnum).style.display = "none";
	document.getElementById('register-bnt1Review'+ boardnum).style.display = "inline-block";
	document.getElementById('cancel-bnt1Review'+ boardnum).style.display = "inline-block";
}
function cancel1Review(boardnum) {
	document.getElementById('msgReview'+ boardnum).style.display = "inline-block";
	document.getElementById('textareaReview'+ boardnum).style.display = "none";
	document.getElementById('write-bntReview'+ boardnum).style.display = "inline-block";
	document.getElementById('register-bnt1Review'+ boardnum).style.display = "none";
	document.getElementById('cancel-bnt1Review'+ boardnum).style.display = "none";
	document.getElementById('textContentReview'+ boardnum).value="";
}
function editReview(boardnum) {
	document.getElementById('textareaResultReview'+ boardnum).style.display = "none";
	document.getElementById('textareaReview'+ boardnum).style.display = "inline-block";
	document.getElementById('edit-bntReview'+ boardnum).style.display = "none";
	document.getElementById('delete-bntReview'+ boardnum).style.display = "none";
	document.getElementById('register-bnt2Review'+ boardnum).style.display = "inline-block";
	document.getElementById('cancel-bnt2Review'+ boardnum).style.display = "inline-block";
}
function cancel2Review(boardnum) {
	document.getElementById('textareaResultReview'+ boardnum).style.display = "inline-block";
	document.getElementById('textareaReview'+ boardnum).style.display = "none";
	document.getElementById('edit-bntReview'+ boardnum).style.display = "inline-block";
	document.getElementById('delete-bntReview'+ boardnum).style.display = "inline-block";
	document.getElementById('register-bnt2Review'+ boardnum).style.display = "none";
	document.getElementById('cancel-bnt2Review'+ boardnum).style.display = "none";
	document.getElementById('textContentReview'+ boardnum).value=document.getElementById('textareaResultReview'+ boardnum).value
}
function sendItWriteReview(num) {
	var f = document.reviewForm[num];
	f.action="/sub/shop/comments/write_ok.do";
	f.submit();
}
function sendItEditReview(num) {
	var f = document.reviewForm[num];
	f.action="/sub/shop/comments/update_ok.do";
	f.submit();
}
function sendItDeleteReview(num) {
	var f = document.reviewForm[num];
	f.action="/sub/shop/comments/delete_ok.do";
	f.submit();
}