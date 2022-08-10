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

function reviewView(boardNum) {
	if (document.getElementById("reviewContent" + boardNum).style.display != "none")
		document.getElementById("reviewContent" + boardNum).style.display = "none";
	else if (document.getElementById("reviewContent" + boardNum).style.display == "none")
		document.getElementById("reviewContent" + boardNum).style.display = "table-row";
}

function qnaView(boardNum) {
	if (document.getElementById("qnaContent" + boardNum).style.display != "none")
		document.getElementById("qnaContent" + boardNum).style.display = "none";
	else if (document.getElementById("qnaContent" + boardNum).style.display == "none")
		document.getElementById("qnaContent" + boardNum).style.display = "table-row";
}