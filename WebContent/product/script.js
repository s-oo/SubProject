function initial() {
	 document.getElementById("optionSize").style.display = "none";
}

function select(option) {
    
   if(option=="case1"){
	   
	   document.getElementById("optionSize").style.display = "";
	   
	   document.getElementById("selected1").value = document.getElementById("option1").value;
	   
	}
   if(option=="case2"){
	   document.getElementById("selectedOptions").style.display = "block";
	   
	   document.getElementById("selected2").value = document.getElementById("option2").value;
	}
   
}

function count(type)  {
	
	  const resultElement = document.getElementById('result');
	  
	  let number = resultElement.innerText;
	  
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    if(number > 1){
	    	number = parseInt(number) - 1;
	    }
	  }else if(type === 'delete'){
		  document.getElementById("selectedOptions").style.display = "none";
		  document.getElementById("optionSize").style.display = "none";
		  		  
		  document.getElementById("option1").options[0].selected = "true";
		  document.getElementById("option2").options[0].selected = "true";
	  }
	  
	  resultElement.innerText = number;
}
