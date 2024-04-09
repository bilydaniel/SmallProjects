//variables
var valueOnDisplay= "";
var calculator = {numA:"", numB:"", operator:"", result:""};

function clearEverything()
{
	clearDisplay();
	calculator.numA = "";
	calculator.numB = "";
	calculator.operator = "";
	calculator.result = "";
}

function clearDisplay()
{
	var display = document.querySelector("#display");

	display.textContent = "";
	valueOnDisplay = "";
	
}

function writeOnDisplay(value)
{
	var display = document.querySelector("#display");
	
	display.textContent+=value;
}	

function storeNumber(number)
{
	valueOnDisplay += number;
}

function operatorUsed(operator)
{
	
	if(calculator.operator==="")
	{
		calculator.operator = operator;
		calculator.numA = valueOnDisplay;	
		valueOnDisplay = "";
		
	}	
	else
	{	
		calculator.numB = valueOnDisplay;
		valueOnDisplay = "";
		
		if(calculator.operator != "=")
			calculator.result = Operate(calculator.operator, calculator.numA, calculator.numB);
		
		calculator.operator = operator;
		
		clearDisplay();
		writeOnDisplay(calculator.result);
		calculator.numA=calculator.result;
	}
}

function Operate(operator, numberA, numberB)
{
	numberA = Number(numberA);
	numberB = Number(numberB);

	if(operator === "+")
		return numberA + numberB;
	
	if(operator === "-")
		return numberA - numberB;
	
	if(operator === "*")
		return numberA * numberB;
	
	if(operator === "/")
	{
		if(numberB === 0)
			return "Division by zero";
		return numberA / numberB;
	}

	return;
}

//Event listeners
var digits = document.querySelectorAll(".digit");
for(var i = 0; i<digits.length; i++)
{
	
	digits[i].addEventListener("click",(e)=>
	{
		
		storeNumber(e.target.value);
		writeOnDisplay(e.target.value);
	});
}

var operators = document.querySelectorAll(".operator");
for(var i = 0; i < operators.length; i++)
{
	operators[i].addEventListener("click",(e)=>
	{
		
		operatorUsed(e.target.value);
		if(e.target.value != "=")
			writeOnDisplay(e.target.value);
	});
}

var clear = document.querySelector("#clear");
clear.addEventListener("click",clearEverything);



