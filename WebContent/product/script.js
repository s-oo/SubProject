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

function qnaView(rnum) {
	if (document.getElementById("qnaContent" + rnum).style.display != "none"){
		document.getElementById("qnaContent" + rnum).style.display = "none";
		document.getElementById("qnaComment" + rnum).style.display = "none";
	}
	else if (document.getElementById("qnaContent" + rnum).style.display == "none")
		document.getElementById("qnaContent" + rnum).style.display = "table-row";
}

function reviewView(rnum) {
	
	/*var contents = document.getElementById("reviewContent" + rnum);
	
	for(var i=0;i<contents.length;i++){
		contents[i].style.display = 'none';
	}
	
	var contentsShow = element.id.replace(/(\d)/g, '-$1');
    document.getElementById(contentsShow).style.display = 'block';*/
	
	if (document.getElementById("reviewContent" + rnum).style.display != "none"){
		document.getElementById("reviewContent" + rnum).style.display = "none";
		document.getElementById("reviewComment" + rnum).style.display = "none";
	}
	
	else if (document.getElementById("reviewContent" + rnum).style.display == "none"){
		document.getElementById("reviewContent" + rnum).style.display = "table-row";
		
		
	/*if (!((document.getElementById("reviewContent" + rnum)).contains(target)))
		document.getElementById("reviewContent" + rnum).style.display = "none";*/
	}
	
}

function qnaClick(rnum) {
	if (document.getElementById("qnaComment" + rnum).style.display != "none")
		document.getElementById("qnaComment" + rnum).style.display = "none";
	
	else if (document.getElementById("qnaComment" + rnum).style.display == "none")
		document.getElementById("qnaComment" + rnum).style.display = "table-row";
	
}

function reviewClick(rnum) {
	if (document.getElementById("reviewComment" + rnum).style.display != "none")
		document.getElementById("reviewComment" + rnum).style.display = "none";
	
	else if (document.getElementById("reviewComment" + rnum).style.display == "none")
		document.getElementById("reviewComment" + rnum).style.display = "table-row";
	
}

//Comment of Product Board
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
	textContent.value="";
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
	f.action="/sub/shop/comments/write_ok.do";
	f.submit();
}
function sendItEdit() {
	var f = document.myForm;
	f.action="/sub/shop/comments/upadte_ok.do";
	f.submit();
}
function sendItDelete() {
	var f = document.myForm;
	f.action="/sub/shop/comments/delete_ok.do";
	f.submit();
}