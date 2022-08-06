var price;
var amount;

function initial() {
	document.getElementById("optionSize").style.display = "none";
	document.getElementById("totalAmount").style.display = "none";
	
	price = document.form.price.value;
	amount = document.form.amount.value;
	document.form.sum.value = price;
	/*
	change();*/
}

function select(option) {
    
   if(option=="case1"){
	   
	   document.getElementById("optionSize").style.display = "";
	   document.getElementById("selected1").value = document.getElementById("option1").value;
	   
   }
   if(option=="case2"){
	   
	   document.getElementById("selectedOptions").style.display = "block";
	   document.getElementById("selected2").value = document.getElementById("option2").value;
	   
	   document.getElementById("totalAmount").style.display = "block";
	   totalAmount.value = '(' + 1 + '개)';
	   totalSum.value = price + ' KRW';
   }
}

function count(type) {
	
	if(type === 'plus'){
		amount = document.form.amount;
		sum = document.form.sum;
		
		amount.value ++;
		sum.value = parseInt(amount.value) * price;
		
		totalAmount.value = '(' + amount.value  + '개)';
		totalSum.value = sum.value + ' KRW';
	}
	if(type === 'minus'){
		amount = document.form.amount;
		sum = document.form.sum;

		if (amount.value>1) {
			amount.value --;
			sum.value = parseInt(amount.value) * price;
			
			totalAmount.value = '(' +amount.value + '개)';
			totalSum.value = sum.value + ' KRW';
		}
		if (amount.value<0) {
			amount.value=0;
			
			totalAmount.value=amount.value;
		}
	}
	if(type === 'delete'){
		document.getElementById("selectedOptions").style.display = "none";
		document.getElementById("optionSize").style.display = "none";
	  		  
		document.getElementById("option1").options[0].selected = "true";
		document.getElementById("option2").options[0].selected = "true";
		
		amount.value = 1;
		sum.value = price;
		
		totalSum.value = 0;
		totalAmount.value = 0;
		document.getElementById("totalAmount").style.display = "none";
		
  }
}